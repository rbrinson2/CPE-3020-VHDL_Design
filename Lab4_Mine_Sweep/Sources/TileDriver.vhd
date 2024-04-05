

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TileDriver is
    port(
        clock : in std_logic;
        reset : in std_logic;
        bombLocations : in std_logic_vector(14 downto 0);

        tiles : out std_logic_vector(15 downto 0)
    );
end entity TileDriver;

architecture TileDriver_ARCH of TileDriver is
    
begin
    
end architecture TileDriver_ARCH;
