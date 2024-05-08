---------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 04/08/2024 
-- Design Name: Tile Driver
-- Lab Name: Lab 4 - Mine Sweep
-- Target Devices: Basys 3
-- 
-- Description: 
-- Tile Driver takes in bombLocations and clearTileMask and 
--  combines them to create the final tile output. It also uses
--  a simple state machine to know when to display the tiles as
--  normal or to flash the bombs location. Once it enters the 
--  flashing state, Tile Driver will blink the bomb locations
--  every 0.5s for 4 cycles, and then enter done where it can
--  wait for a reset to occur.
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

--====================================================================== Entity
entity TileDriver is
    port(
        ----------------------------------------------------------- Input Ports
        clock          : in std_logic;
        reset          : in std_logic;
        bombLocation   : in std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        clearTilesMask : in std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        gameOverMode   : in std_logic;
        
        ---------------------------------------------------------- Output Ports
        doneMode       : out std_logic;
        tiles          : out std_logic_vector(TILEBUSWIDTH - 1 downto 0)
    );
end entity TileDriver;

--================================================================ Architecture
architecture TileDriver_ARCH of TileDriver is
    ------------------------------------------------------------- State Signals
    type state_t is (NORMAL, FLASHING, DONE);
    signal currState    : state_t;
    signal nextState    : state_t;

    ------------------------------------------------------------------- Signals
    signal normalMode   : std_logic;
    signal flashMode    : std_logic;
    signal flashDone    : std_logic;
    signal timerPulse   : std_logic;
    
begin

    --State-Register--------------------------------------------------- Process
    STATE_REG : process (clock, reset) is
    begin
        if (reset = ACTIVE) then
            currState <= NORMAL;
        elsif rising_edge(clock) then
            currState <= nextState;
        end if;
    end process STATE_REG;
    

    --State-Machine-------------------------------------------------------- FSM
    STATE_MACHINE : process(currstate, gameOverMode, flashDone) is
    begin
        normalMode <= not ACTIVE;
        flashMode  <= not ACTIVE;
        doneMode   <= not ACTIVE;
        case currState is 
            when NORMAL =>
                if (gameOverMode = ACTIVE) then
                    nextState <= FLASHING;
                else 
                    normalMode <= ACTIVE;
                    nextState <= currState;
                end if;
            when FLASHING =>
                if (flashDone = ACTIVE) then
                    nextState <= DONE;
                else
                    flashMode <= ACTIVE;
                    nextState <= currState;
                end if;
            when DONE =>
                doneMode <= ACTIVE;
                nextState <= currState;
        end case;
        
    end process STATE_MACHINE;
    
    --Flash-Timer------------------------------------------------------ Process
    FLASH_TIMER : process (clock, reset) is
        variable count      : integer range 0 to ONESECTIMER/2;
        variable flashCount : integer range 0 to 8;
    begin
        if (reset = ACTIVE) then
            timerPulse <= not ACTIVE;
            flashDone  <= not ACTIVE;
            count      := 0;
            flashCount := 0;
        elsif rising_edge(clock) then
            
            timerPulse <= not ACTIVE;
            flashDone <= not ACTIVE;

            if (flashMode = ACTIVE) then
                count := count + 1;
                if (count >= ONESECTIMER/2) then
                    timerPulse <= ACTIVE;
                    count := 0;
                    flashCount := flashCount + 1;
                    if (flashCount >= 8) then
                        flashDone <= ACTIVE;
                    end if;
                end if;
            end if;
        end if;
    end process FLASH_TIMER;
    


    --Tile-Driver-Process---------------------------------------------- Process
    -- Depending on the state of the state machine, the 
    --  driver will output differently.
    TILE_DRIVE: process (clock, reset) is
        variable tileFlashFlag : Flag_t;
    begin
        if (reset = ACTIVE) then
            tiles <= (others => '1');
            tileFlashFlag := NOTFLAGGED_S;
        elsif (rising_edge(clock)) then
            -- Normal mode logic or's the bombLocation and
            --  the not clearTilesMask together
            if (normalMode = ACTIVE) then
                tiles <= bombLocation or (not clearTilesMask);
            
            -- Flashing mode uses a flag to toggle the 
            --  bombLocations on and off.
            elsif (flashMode = ACTIVE) then
                if (timerPulse = ACTIVE) then
                    if (tileFlashFlag = NOTFLAGGED_S) then
                        tiles <= (not bombLocation) and (not clearTilesMask);
                        tileFlashFlag := FLAGGED_S;
                    else 
                        tiles <= bombLocation or (not clearTilesMask);
                        tileFlashFlag := NOTFLAGGED_S;
                    end if;
                    
                end if;
            end if;
        end if;
    end process TILE_DRIVE;
end architecture TileDriver_ARCH;
