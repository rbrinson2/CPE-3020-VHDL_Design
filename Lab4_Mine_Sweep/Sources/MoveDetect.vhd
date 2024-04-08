

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
        startEn : out std_logic
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
    signal zeroMode     : std_logic;
begin
    
    --Zero-Mode-------------------------------------------- Selected Assignment
    with playerMoveSync select
        zeroMode <= ACTIVE when "0000000000000000",
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
    DETECT : process (currState, playerMoveSync, zeroMode) is
        variable moveTracker : std_logic_vector(15 downto 0) := (others => '0');
    begin
        -- Default State Enable 
        startEn <= not ACTIVE;

        case (currState) is 
            when WAITING =>
                report "State: Waiting";

                -- Set default to stay in state
                nextState <= WAITING;
                
                -- Set default values
                moveTracker := (others => '0');
                gamePlayMode <= not ACTIVE;
                startEn <= not ACTIVE;
                
                -- Once Zero is reached, move state
                if (zeroMode = ACTIVE) then
                    nextState <= PLAYING;
                end if;

            when PLAYING =>
                report "State: Playing";

                -- Set Default to remain in state
                nextState <= PLAYING;

                -- Turn gameplay mode on
                gamePlayMode <= ACTIVE;

                -- Check if a move has occured
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