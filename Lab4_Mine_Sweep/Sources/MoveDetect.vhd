

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--====================================================================== ENTITY
entity MoveDetect is
    port(
        ---------- Input Ports
        clock : in std_logic;
        reset : in std_logic;
        playerMoveSync : in std_logic_vector(15 downto 0);

        ---------- Output Ports
        gamePlayMode : out std_logic;
        startEn : out std_logic;
        zeroMode : out std_logic
    );
end entity MoveDetect;

--================================================================ ARCHITECTURE
architecture MoveDetect_ARCH of MoveDetect is
    ---------- Constants
    constant ACTIVE : std_logic := '1';
    
    ---------- Types
    type detect_t is (WAITING, PLAYING, MOVEDETECTED);
    
    ---------- Signals
    signal nextState    : detect_t;
    signal currState    : detect_t;
begin
    
    --Zero-Mode-------------------------------------------- Selected Assignment
    with playerMoveSync select
        zeroMode <= ACTIVE when (others => '0'),
                    not ACTIVE when others;
    
    --Detect-Register-------------------------------------------------- Process
    DETECT_REG : process (clock, reset) is
    begin
        if (reset = '1') then
            currState <= WAITING;
        elsif (rising_edge(clock)) then
            currState <= nextState;
        end if;
    end process DETECT_REG;
    
    --Detect----------------------------------------------------- State Machine
    DETECT : process (currState, playerMoveSync, zeroMode, reset) is
        variable moveTracker : std_logic_vector(15 downto 0) := (others => '0');
    begin
        -- Default State Enable 
        startEn <= not ACTIVE;

        case (currState) is 
            when WAITING =>
                report "State: Waiting";
                nextState <= WAITING;
                moveTracker := (others => '0');
                gamePlayMode <= not ACTIVE;
                if (reset = not ACTIVE) then
                    if (zeroMode = ACTIVE) then
                        gamePlayMode <= ACTIVE;
                        report "Gamplay mode active";
                        nextState <= PLAYING;
                    end if;
                end if;
            when PLAYING =>
                report "State: Playing";
                nextState <= PLAYING;
                for move in playerMoveSync'range loop
                    if (playerMoveSync(move) = ACTIVE 
                        and moveTracker(move) = not ACTIVE
                    ) then
                        moveTracker(move) := ACTIVE;
                        nextState <= MOVEDETECTED;
                    end if;
                end loop;
            when MOVEDETECTED =>
                report "State: Move Detected";
                startEn     <= ACTIVE;
                nextState   <= PLAYING;
        end case;        

    end process DETECT;
    
    
    
end architecture MoveDetect_ARCH;