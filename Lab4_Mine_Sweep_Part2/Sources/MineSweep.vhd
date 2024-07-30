-----------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 04/08/2024 
-- Design Name: MineSweep
-- Lab Name: Lab 4 - Mine Sweep
-- Target Devices: Basys 3
-- 
-- Description: 
-- The primary job of this module is to iteract with the 
--  external signals as well as route all the internal signals
--  to the appropriate entities. 

-- It also manages the game over, game win, first move, and
--  debouncing. Game over and game win are based off internal 
--  signals recieved from various entities. The move synch 
--  process uses a synch chain to limit bouncing of the switches.
--  and finally the first move lets multiple modules know that 
--  game has started.
---------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

--====================================================================== ENTITY
entity MineSweep is
    port(
        ----------------------------------------------------------- Input Ports
        clock       : in std_logic;
        reset       : in std_logic;
        playerMove  : in std_logic_vector(MOVEWIDTH - 1 downto 0);

        ---------------------------------------------------------- Output Ports
        anodes      : out std_logic_vector(3 downto 0);
        sevenSegs   : out std_logic_vector(6 downto 0);
        tiles       : out std_logic_vector(TILEBUSWIDTH - 1 downto 0)
    );
end entity MineSweep;

--================================================================ ARCHITECTURE
architecture MineSweep_ARCH of MineSweep is
    
    ---------------------------------------------------------- Internal Signals
    ----- B
    signal bomb1Temp          : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb2Temp          : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb3Temp          : std_logic_vector(BOMBSIZE - 1 downto 0);
    ----- C
    signal clearTilesMask     : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    ----- D
    signal doneMode           : std_logic;
    ----- F
    signal finalBombLocations : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal firstMoveDet       : std_logic := '0';
    ----- G
    signal gameOverMode       : std_logic;
    signal gamePlayMode       : std_logic := '0';
    signal gameWinMode       : std_logic;
    ----- H
    signal hitDet             : std_logic;
    ----- L
    signal lowerDigit         : std_logic_vector(3 downto 0);
    ----- M
    signal moveDet            : std_logic := '0';
    ----- P
    signal playerMoveSync     : std_logic_vector(MOVEWIDTH - 1 downto 0);
    ----- T
    signal tempBombLocation   : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal timerZeroMode      : std_logic;
    ----- U
    signal upperDigit         : std_logic_vector(3 downto 0);
    

begin

    GAME_OVER: gameOverMode <= hitDet or timerZeroMode or gameWinMode;
    GAME_WIN : process (finalBombLocations, clearTilesMask) is
    begin
        gameWinMode <= not ACTIVE;
        if ((finalBombLocations or clearTilesMask) = ONES) then
            gameWinMode <= ACTIVE;
        end if;
    end process GAME_WIN;
    
    
    --Final-Bomb-Location---------------------------------------------- Process
    FINALBOMBLOCATION: process(clock, reset)
    begin
        if (reset = ACTIVE) then
            finalBombLocations <= (others => '0'); 
        elsif (rising_edge(clock) )then
            if (
                moveDet = ACTIVE
                and firstMoveDet = ACTIVE
            ) then
                finalBombLocations <= tempBombLocation;
            end if;
        end if;
    end process FINALBOMBLOCATION;

    --First-Move-Detection--------------------------------------------- Process
    FIRST_MOVE : process (clock, reset) is
        variable count : integer range 0 to 2;
        variable first : integer range 0 to 1;
    begin
        if (reset = ACTIVE) then
            firstMoveDet <= not ACTIVE;
            count := 0;
            first := NOTFLAGGED;
        elsif (rising_edge(clock) )then
            if (moveDet = ACTIVE) then
                if (first = NOTFLAGGED) then
                    if (count < 2) then
                        firstMoveDet <= ACTIVE;
                        count := count + 1;
                    else 
                        first := FLAGGED;
                    end if;
                elsif (first = FLAGGED) then
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
            variable syncChain : std_logic_vector(15 downto 0);
        begin
            if reset = ACTIVE then 
                syncChain := (others => '0'); 
            elsif rising_edge(clock) then
                syncChain := syncChain(14 downto 0) & playerMove(i);
            end if;

            playerMoveSync(i) <= syncChain(15);
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
            clock          => clock,
            reset          => reset,
            bombLocation   => finalBombLocations,
            clearTilesMask => clearTilesMask,
            gameOverMode   => gameOverMode,
            doneMode       => doneMode,
            tiles          => tiles
        );

    --Collision-Chain-------------------------------------------------- Instant
    COLLISIONCHAIN : entity work.CollisionChain
        port map(
            clock              => clock,
            reset              => reset,
            bomb1Temp          => bomb1Temp,
            bomb2Temp          => bomb2Temp,
            bomb3Temp          => bomb3Temp,
            finalBombLocations => tempBombLocation
        );

    --Move-Detect------------------------------------------------------ Instant
    MOVEDETECT : entity work.MoveDetect
        port map(
            clock           => clock,
            reset           => reset,
            playerMove      => playerMove,
            playerMoveSynch => playerMoveSync,
            doneMode        => doneMode,
            gamePlayMode    => gamePlayMode,
            moveDet         => moveDet
        );
    
    --Clear-Tiles------------------------------------------------------ Instant
    CLEARTILE : entity work.ClearTiles
        port map(
            clock              => clock,
            reset              => reset,
            playerMoveSync     => playerMoveSync,
            finalBombLocations => finalBombLocations,
            gamePlayMode       => gamePlayMode,
            clearTilesMask     => clearTilesMask,
            hitDet             => hitDet
        );

    --Timer------------------------------------------------------------ Instant
    TIMER : entity work.Timer
        port map(
            clock         => clock,
            reset         => reset,
            firstMoveDet  => firstMoveDet,
            hitDet        => hitDet,
            gameOverMode  => gameOverMode,
            upperDigit    => upperDigit,
            lowerDigit    => lowerDigit,
            timerZeroMode => timerZeroMode
        );
    
    --Seven-Segment---------------------------------------------------- Instant
    SEVEN_SEG : entity work.SevenSegmentDriver
        port map(
            reset     => reset,
            clock     => clock,
            digit3    => upperDigit,
            digit2    => lowerDigit,
            digit1    => "0000",
            digit0    => "0000",
            blank3    => '0',
            blank2    => '0',
            blank1    => '1',
            blank0    => '1',
            sevenSegs => sevenSegs,
            anodes    => anodes
        );
    
end architecture MineSweep_ARCH;
