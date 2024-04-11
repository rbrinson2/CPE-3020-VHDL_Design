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
-- The Module takes in the bombLocation created by the 
-- randomizer and converts them to locations in the tile array.
-- The module then outputs the bombs at that location. 
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

--====================================================================== Entity
entity TileDriver is
    port(
        clock : in std_logic;
        reset : in std_logic;
        bombLocation : in std_logic_vector(BOMBBUSWIDTH - 1 downto 0);

        tiles : out std_logic_vector(TILEBUSWIDTH - 1 downto 0)
    );
end entity TileDriver;

--================================================================ Architecture
architecture TileDriver_ARCH of TileDriver is
    ---------- Consant
    constant zero : std_logic_vector(14 downto 0) := (others => '0');
    
    --Tile-Shaper----------------------------------------------------- Function
    -- Determines if the bomb should be single wide or double wide    
    function tileShaper(width : std_logic) return std_logic_vector is
        constant DOUBLEWIDE : std_logic := '1';
        constant SINGLEWIDE : std_logic := '0';
        variable tile : std_logic_vector(1 downto 0);
    begin
        if (width = DOUBLEWIDE) then
            tile := "11";
        elsif (width = SINGLEWIDE) then
            tile := "01";
        end if;
        return tile;
    end function tileShaper;

        
begin
    --Tile-Driver-Process---------------------------------------------- Process
    process (clock, reset) is
        variable tempTiles  : std_logic_vector(TILEBUSWIDTH - 1 downto 0);
        variable tile1Shape : std_logic_vector(1 downto 0);
        variable tile2Shape : std_logic_vector(1 downto 0);
        variable tile3Shape : std_logic_vector(1 downto 0);
        variable bomb1Pos : integer range 0 to 15;
        variable bomb2Pos : integer range 0 to 15;
        variable bomb3Pos : integer range 0 to 15;
         
    begin
        if (reset = '1') then
            tempTiles := (others => '0');
            tiles <= (others => '0');  
            tile1Shape := "00";
            tile2Shape := "00";
            tile3Shape := "00";
            bomb1Pos := 0;
            bomb2Pos := 0;
            bomb3Pos := 0;
        elsif (rising_edge(clock)) then
            if (bombLocation = zero) then
                tiles <= (others => '0');
            else
                -- Convert each bombLocation into individual positions
                -- of each bomb
                bomb1Pos := to_integer(unsigned(bombLocation(13 downto 10)));
                bomb2Pos := to_integer(unsigned(bombLocation(8 downto 5)));
                bomb3Pos := to_integer(unsigned(bombLocation(3 downto 0)));
                
                -- Use bombLocation to determine the shape of each bomb
                tile1Shape := tileShaper(bombLocation(14)); 
                tile2Shape := tileShaper(bombLocation(9)); 
                tile3Shape := tileShaper(bombLocation(4)); 

                -- Push the bombs onto a temporary tile space
                tempTiles := (others => '0'); 
                for tile in 0 to (tempTiles'high - 1) loop
                    if (tile = bomb1Pos) then
                        tempTiles(tile + 1 downto tile) := tile1Shape;
                    end if;
                    if (tile = bomb2Pos) then
                        tempTiles(tile + 1 downto tile) := tile2Shape;
                    end if;
                    if (tile = bomb3Pos) then
                        tempTiles(tile + 1 downto tile) := tile3Shape;
                    end if;
                end loop;
                    
                    
                    tiles <= tempTiles;
            end if;

        end if;
    end process;
end architecture TileDriver_ARCH;
