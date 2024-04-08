---------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 04/08/2024 
-- Design Name: MineSweep
-- Lab Name: Lab 4 - Mine Sweep
-- Target Devices: Basys 3
-- 
-- Description: 
-- Houses the state machine for the control signals and the 
-- individual modules. The state machine starts by waiting 
-- until the board returns to a zero state after a reset. Once
-- the zero state has been entered, the SM move to playing mode
-- and waits for a move to be made, telling the randomizer
-- to send bomb locations to the tile driver
---------------------------------------------------------------
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
    ---------- Types
    type detect_t is (WAITING, PLAYING, MOVEDETECTED);

    ---------- Constants
    constant ACTIVE         : std_logic := '1';

    ---------- Signals
    signal bombLocation     : std_logic_vector(14 downto 0);
    signal gamePlayMode     : std_logic;    
    signal moveDet          : std_logic;
    signal nextState        : detect_t;
    signal currState        : detect_t;
    signal zeroMode         : std_logic;

begin
    

    
    --Randomizer------------------------------------------------------- Instant 
    RANDOMIZER : entity work.Randomizer
        port map(
            clock        => clock,
            reset        => reset,
            moveDet      => moveDet,
            gamePlayMode => gamePlayMode,
            bombLocation => bombLocation
        );
    
    --Tile-Driver------------------------------------------------------ Instant
    TileDriver_inst : entity work.TileDriver
        port map(
            clock         => clock,
            reset         => reset,
            bombLocations => bombLocation,
            tiles         => tiles
        );
    
    --Move-Detect------------------------------------------------------ Instant 
    --Zero-Mode-------------------------------------------- Selected Assignment
    ZERO: with playerMove select
        zeroMode <= ACTIVE when "0000000000000000",
                    not ACTIVE when others;
    
    --Detect-Register-------------------------------------------------- Process
    MOVEDETECT_REG : process (clock, reset) is
    begin
        if (reset = '1') then
            currState <= WAITING;
        elsif (rising_edge(clock)) then
            currState <= nextState;
        end if;
    end process MOVEDETECT_REG;
    
    --Detect----------------------------------------------------- State Machine
    MOVEDETECT : process (currState, playerMove, zeroMode) is
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
                moveDet <= not ACTIVE;
                
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
                moveDet <= not ACTIVE;
                
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
                moveDet     <= ACTIVE;
                nextState   <= PLAYING;
        end case;        

    end process MOVEDETECT;
    
    
    

    
end architecture MineSweep_ARCH;
