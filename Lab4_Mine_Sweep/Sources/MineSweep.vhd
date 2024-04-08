library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.physical_io_package.all;

--====================================================================== ENTITY
entity MineSweep is
    port(
        --------- Inputs
        clock       : in std_logic;
        reset       : in std_logic;
        playerMove  : in std_logic_vector(15 downto 0);

        ---------- Outputs
        tiles       : out std_logic_vector(15 downto 0)
    );
end entity MineSweep;

--================================================================ ARCHITECTURE
architecture MineSweep_ARCH of MineSweep is
    ---------- Constants
    constant ACTIVE : std_logic := '1';
    
    ---------- Types
    type detect_t is (WAITING, PLAYING, MOVEDETECTED);

    ---------- Signals
    signal bombLocation     : std_logic_vector(14 downto 0);
    signal gamePlayMode     : std_logic;    
    signal startEn          : std_logic;
    

    ---------- Signals
    signal nextState    : detect_t;
    signal currState    : detect_t;
    signal zeroMode     : std_logic;

begin
    

    
    --Randomizer------------------------------------------------------- Instant 
    RANDOMIZER : entity work.Randomizer
        port map(
            clock        => clock,
            reset        => reset,
            startEn      => startEn,
            gamePlayMode => gamePlayMode,
            bombLocation => bombLocation
        );
    
    --Move-Detect------------------------------------------------------ Instant 
    --Zero-Mode-------------------------------------------- Selected Assignment
    with playerMove select
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
    DETECT : process (currState, playerMove, zeroMode) is
        variable moveTracker : std_logic_vector(15 downto 0) := (others => '0');
    begin

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

                -- Set values
                gamePlayMode <= ACTIVE;
                startEn <= not ACTIVE;
                
                -- Check if a move has occured
                for move in playerMove'range loop
                    if (playerMove(move) = ACTIVE 
                        and moveTracker(move) = not ACTIVE
                        and zeroMode = not ACTIVE
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
    
    --Tile-Driver------------------------------------------------------ Instant
    TileDriver_inst : entity work.TileDriver
        port map(
            clock         => clock,
            reset         => reset,
            bombLocations => bombLocation,
            tiles         => tiles
        );
    

    
end architecture MineSweep_ARCH;
