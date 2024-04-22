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

    ---------------------------------------------------------- Internal Signals
    signal bomb1Temp               : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb2Temp               : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb3Temp               : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bombLocation            : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal finalBombLocations      : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal playerMoveSynch         : std_logic_vector(MOVEWIDTH - 1 downto 0);
    signal gamePlayMode            : std_logic := '0';
    signal moveDet                 : std_logic := '0';
    signal firstMoveDet            : std_logic := '0';
    
    
begin
    --Final-Bomb-Location---------------------------------------------- Process
    FINALBOMBLOCATION: process(clock, reset)
    begin
        if (reset = ACTIVE) then
            bombLocation <= (others => '0'); 
        elsif (rising_edge(clock) )then
            if (
                moveDet = ACTIVE
                and firstMoveDet = ACTIVE
            ) then
                bombLocation <= finalBombLocations;
            end if;
        end if;
    end process FINALBOMBLOCATION;

    --First-Move-Detection--------------------------------------------- Process
    FIRST_MOVE : process (clock, reset) is
        variable count : integer range 0 to 2;
        variable first : integer range 0 to 1;
    begin
        if reset = '1' then
            firstMoveDet <= not ACTIVE;
            count := 0;
            first := 0;
        elsif rising_edge(clock) then
            if (moveDet = ACTIVE) then
                if (first = 0) then
                    if (count < 2) then
                        firstMoveDet <= ACTIVE;
                        count := count + 1;
                    else 
                        first := 1;
                    end if;
                elsif (first = 1) then
                    firstMoveDet <= not ACTIVE;
                end if;
            end if;
        end if;
    end process FIRST_MOVE;
    
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
            firstMoveDet => firstMoveDet,
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

    --Move-Detect------------------------------------------------------ Instant
    MOVEDETECT : entity work.MoveDetect
        port map(
            clock           => clock,
            reset           => reset,
            playerMove      => playerMove,
            playerMoveSynch => playerMoveSynch,
            gamePlayMode    => gamePlayMode,
            moveDet         => moveDet
        );
    
    
    
end architecture MineSweep_ARCH;
