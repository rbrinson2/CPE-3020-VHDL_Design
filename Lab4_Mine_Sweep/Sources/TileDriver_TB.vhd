

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TileDriver_TB is
    port(
        clock : in std_logic;
        reset : in std_logic
    );
end entity TileDriver_TB;

architecture TileDriver_TB_ARCH of TileDriver_TB is
    
begin
   
    
    TileDriver_inst : entity work.TileDriver
        port map(
            clock => clock,
            reset => reset
        );
    
end architecture TileDriver_TB_ARCH;

