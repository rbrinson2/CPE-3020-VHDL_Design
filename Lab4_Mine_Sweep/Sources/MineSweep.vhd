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
    constant ACTIVE : std_logic := '1';
    
    type move_t is (WAITING, PLAYING, MOVEDETECTED);
    signal currState : move_t;
    signal nextState : move_t;

    signal bombLocation : std_logic_vector(14 downto 0);
    signal gamePlayMode : std_logic;
    signal moveDet      : std_logic;
    
begin

    TILES_PROC : process (clock, reset) is
    begin
        if reset = '1' then
            tiles <= (others => '0'); 
        elsif rising_edge(clock) then
            tiles <= '0' & bombLocation;
        end if;
    end process TILES_PROC;
    

    RANDOMIZER : entity work.Randomizer
        port map(
            clock        => clock,
            reset        => reset,
            moveDet      => moveDet,
            gamePlayMode => gamePlayMode,
            bombLocation => bombLocation
        );
    
    
    MOVE_REG : process (clock, reset) is
    begin
        if reset = ACTIVE then
            currState <= WAITING;
        elsif rising_edge(clock) then
            currState <= nextState;
        end if;
    end process MOVE_REG;

    MOVE_FSM : process(currState, playerMove) is
        variable moveTraker : std_logic_vector(15 downto 0);
    begin
        moveDet <= '0';
        gamePlayMode <= '0';

        case currState is 
            when WAITING =>
                moveTraker := (others => '0');
                if (playerMove = moveTraker) then
                    nextState <= PLAYING;
                else 
                    nextState <= WAITING;
                end if;
            when PLAYING =>
                gamePlayMode <= ACTIVE;
                
                if (playerMove = moveTraker) then
                    nextState <= PLAYING;
                else
                    for move in playerMove'range loop
                        if (playerMove(move) /= moveTraker(move)) then
                            moveTraker(move) := playerMove(move);
                        end if;
                    end loop;

                    moveDet <= ACTIVE;
                    nextState <= MOVEDETECTED;
                end if;

            when MOVEDETECTED =>
                gamePlayMode <= ACTIVE;
                nextState <= PLAYING;
        end case;
        
    end process MOVE_FSM;
    
    
end architecture MineSweep_ARCH;
