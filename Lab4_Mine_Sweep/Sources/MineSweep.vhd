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

use work.minesweeppackage.all;

--====================================================================== ENTITY
entity MineSweep is
    port(
        --------- Inputs
        clock       : in std_logic;
        reset       : in std_logic;
        playerMove  : in std_logic_vector(MOVEWIDTH - 1 downto 0);

        ---------- Outputs
        tiles       : out std_logic_vector(TILEBUSWIDTH - 1 downto 0)
    );
end entity MineSweep;

--================================================================ ARCHITECTURE
architecture MineSweep_ARCH of MineSweep is
    
    type move_t is (WAITING, PLAYING, MOVEDETECTED);
    signal currState : move_t;
    signal nextState : move_t;

    ---------------------------------------------------------- Internal Signals
    signal bomb1Temp               : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb2Temp               : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb3Temp               : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bombLocation            : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal finalBombLocations      : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal playerMoveSynch         : std_logic_vector(MOVEWIDTH - 1 downto 0);
    signal gamePlayMode            : std_logic := '0';
    signal moveDet                 : std_logic := '0';
    
begin
    --Final------------------------------------------------------------ Process
    FINAL: process(clock, reset)
    begin
        if (reset = ACTIVE) then
            bombLocation <= (others => '0'); 
        elsif (rising_edge(clock) )then
            if (moveDet = ACTIVE) then
                bombLocation <= finalBombLocations;
            end if;
        end if;
    end process FINAL;

    --Move-Sync-Generate---------------------------------------------- Generate
    -- Generates a sync chain process for each player move
    -- Used as a debouncer
    MOVE_SYNC : for i in playerMove'range generate
        SYNC : process (clock, reset) is
            variable syncChain : std_logic_vector(3 downto 0);
        begin
            if reset = '1' then 
                syncChain := (others => '0'); 
            elsif rising_edge(clock) then
                syncChain := syncChain(2 downto 0) & playerMove(i);
            end if;

            playerMoveSynch(i) <= syncChain(3);
        end process SYNC;
        
    end generate;    

    --Randomizer------------------------------------------------------- Instant
    RANDOM : entity work.Randomizer
        port map(
            clock        => clock,
            reset        => reset,
            gamePlayMode => gamePlayMode,
            bomb1        => bomb1Temp,
            bomb2        => bomb2Temp,
            bomb3        => bomb3Temp
        );
    
    --Tile-Driver------------------------------------------------------ Instant
    TILEDRIVE : entity work.TileDriver
        port map(
            clock         => clock,
            reset         => reset,
            bombLocation => bombLocation,
            tiles         => tiles
        );

    --Collision-Chain-------------------------------------------------- Instant
    COLLISIONCHAIN : entity work.CollisionChain
        port map(
            clock              => clock,
            reset              => reset,
            bomb1Temp          => bomb1Temp,
            bomb2Temp          => bomb2Temp,
            bomb3Temp          => bomb3Temp,
            finalBombLocations => finalBombLocations
        );

    --Move-State-Register---------------------------------------------- Process
    MOVE_REG : process (clock, reset) is
    begin
        if reset = ACTIVE then
            currState <= WAITING;
        elsif rising_edge(clock) then
            currState <= nextState;
        end if;
    end process MOVE_REG;

    --Move-Finite-State-Machine-------------------------------------------- FSM
    -- Takes the indicidual contributions of the player moves
    -- signal and if any one of them is active, triggers a 
    -- signal to be output so that bomb locations can be 
    -- determinded. Works but barely.
    --TODO: Try to incorporate edge detection instead of sync
    MOVE_FSM : process(currState, playerMove, playerMoveSynch) is
        variable moveTraker : std_logic_vector(MOVEWIDTH - 1 downto 0);
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
                
                -- If there is no change detected by the 
                -- move tracker then we stay in the state.
                -- Only worked if I included both signals
                if (playerMoveSynch = moveTraker
                    and playerMove = moveTraker
                ) then
                    nextState <= PLAYING;

                -- If player move, and move tracker are different,
                -- then change state to move detected. Could only
                -- get it to work with both these signals together
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
