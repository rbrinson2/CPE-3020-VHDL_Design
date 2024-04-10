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
    

    tiles <= '0' & bombLocation;

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
    --TILEDRIVER : entity work.TileDriver
    --    port map(
    --        clock         => clock,
    --        reset         => reset,
    --        bombLocations => bombLocation,
    --        tiles         => tiles
    --    );
    --


    --Move-Detect------------------------------------------------------ Control  
    --Zero-Mode-------------------------------------------- Selected Assignment
    ZERO: with playerMove select
        zeroMode <= ACTIVE when X"0000",
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

        gamePlayMode <= not ACTIVE;
        moveDet <= not ACTIVE;

        case (currState) is 
            when WAITING =>
                --report "State: Waiting";
                
                -- Set default values
                moveTracker := (others => '0');

                if (zeroMode = ACTIVE) then
                    nextState <= PLAYING;
                else 
                    nextState <= WAITING;
                end if;

            when PLAYING =>
                --report "State: Playing";
                
                gamePlayMode <= ACTIVE;

                if (playerMove = moveTracker) then
                    nextState <= PLAYING;
                else
                    for move in playerMove'range loop
                        if (playerMove(move) /= moveTracker(move)) then
                            moveTracker(move) := playerMove(move);
                            moveDet <= ACTIVE;
                        end if;
                    end loop;

                    nextState <= MOVEDETECTED;
                end if;

            when MOVEDETECTED =>
                --report "State: Move Detected";
                gamePlayMode <= ACTIVE;
                nextState   <= PLAYING;
        end case;        

    end process MOVEDETECT;
    
    
    

    
end architecture MineSweep_ARCH;
