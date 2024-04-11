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
    signal playerMoveSynch : std_logic_vector(15 downto 0);
    signal gamePlayMode : std_logic := '0';
    signal moveDet      : std_logic := '0';
    
begin
    
    MOVE_SYNC2 : for i in playerMove'range generate
        SYNC2 : process (clock, reset) is
            variable syncChain : std_logic_vector(3 downto 0);
        begin
            if reset = '1' then 
                syncChain := (others => '0'); 
            elsif rising_edge(clock) then
                syncChain := syncChain(2 downto 0) & playerMove(i);
            end if;

            playerMoveSynch(i) <= syncChain(3);
        end process SYNC2;
        
    end generate;    
    
    RANDOM : entity work.Randomizer
        port map(
            clock        => clock,
            reset        => reset,
            moveDet      => moveDet,
            gamePlayMode => gamePlayMode,
            bombLocation => bombLocation
        );
    

    TEST : process (clock, reset) is
    begin
        if reset = '1' then
            tiles <= (others => '0');  
        elsif rising_edge(clock) then
            if (moveDet = ACTIVE) then
                tiles <= '0' & bombLocation;
            end if;
        end if;
    end process TEST;

    MOVE_REG : process (clock, reset) is
    begin
        if reset = ACTIVE then
            currState <= WAITING;
        elsif rising_edge(clock) then
            currState <= nextState;
        end if;
    end process MOVE_REG;

    MOVE_FSM : process(currState, playerMove, playerMoveSynch) is
        variable moveTraker : std_logic_vector(15 downto 0);
    begin
        moveDet <= '0';
        gamePlayMode <= '0';

        case currState is 

            --Waiting---------- State
            when WAITING =>
                moveTraker := (others => '0');

                if (playerMove = X"0000" and playerMoveSynch = X"0000") then
                    nextState <= PLAYING;
                else 
                    nextState <= WAITING;
                end if;

            --Playing---------- State
            when PLAYING =>
                gamePlayMode <= ACTIVE;
                
                if (playerMoveSynch = moveTraker
                    and playerMove = moveTraker
                ) then
                    nextState <= PLAYING;
                else
                    for move in playerMoveSynch'range loop
                        if (playerMoveSynch(move) /= moveTraker(move)
                            and playerMove(move) /= moveTraker(move)
                        ) then
                            moveTraker(move) := playerMoveSynch(move);
                        end if;
                    end loop;

                    moveDet <= ACTIVE;
                    nextState <= MOVEDETECTED;
                end if;
            
            --Move-Detected---------- State
            when MOVEDETECTED =>
                moveDet <= ACTIVE;
                gamePlayMode <= ACTIVE;
                nextState <= PLAYING;
        end case;
        
    end process MOVE_FSM;
    
    
end architecture MineSweep_ARCH;
