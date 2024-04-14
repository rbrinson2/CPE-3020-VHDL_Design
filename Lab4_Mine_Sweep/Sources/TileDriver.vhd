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
    constant ZERO : std_logic_vector(BOMBBUSWIDTH - 1 downto 0) := (others => '0');
        
begin
    --Tile-Driver-Process---------------------------------------------- Process
    process (clock, reset) is
    begin
        if (reset = '1') then
            tiles <= (others => '0');
        elsif (rising_edge(clock)) then
            if (bombLocation = ZERO) then
                tiles <= (others => '0');
            else
                tiles <= bombLocation;
            end if;

        end if;
    end process;
end architecture TileDriver_ARCH;
