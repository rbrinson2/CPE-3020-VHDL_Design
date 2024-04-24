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
-- randomizer and then outputs them onto the game board.
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
        clearTilesMask : in std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        hitDet : in std_logic;

        tiles : out std_logic_vector(TILEBUSWIDTH - 1 downto 0)
    );
end entity TileDriver;

--================================================================ Architecture
architecture TileDriver_ARCH of TileDriver is
    
begin

    --Tile-Driver-Process---------------------------------------------- Process
    process (clock, reset) is
        variable temp : std_logic_vector(TILEBUSWIDTH - 1 downto 0);
    begin
        if (reset = ACTIVE) then
            tiles <= (others => '1');
            temp := (others => '1'); 
        elsif (rising_edge(clock)) then
            if (bombLocation = ZERO) then
                temp := (others => '1');
            else
                temp := bombLocation or (not clearTilesMask);
            end if;

            tiles <= temp;
        end if;
    end process;
end architecture TileDriver_ARCH;
