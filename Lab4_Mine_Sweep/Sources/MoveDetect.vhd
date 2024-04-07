

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
    DETECT : process (currState, playerMoveSync, zeroMode) is
    begin
        gamePlayMode    <= not ACTIVE;
        startEn         <= not ACTIVE;
        case (currState) is 
            when WAITING =>
                if (zeroMode = ACTIVE) then
                    nextState <= PLAYING;
                end if;
            when PLAYING =>
                gamePlayMode <= ACTIVE;
                for move in playerMoveSync'range loop
                    if (playerMoveSync(move) = ACTIVE) then
                        nextState <= MOVEDETECTED;
                    end if;
                end loop;
            when MOVEDETECTED =>
                startEn     <= ACTIVE;
                nextState   <= PLAYING;
        end case;        

    end process DETECT;
    
    
    
end architecture MoveDetect_ARCH;