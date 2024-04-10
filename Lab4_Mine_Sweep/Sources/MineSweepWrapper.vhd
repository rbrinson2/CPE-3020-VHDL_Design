library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.physical_io_package.all;

entity MineSweepWrapper is
    port(
        clk : in std_logic;
        btnU : in std_logic;
        sw  : in std_logic_vector(15 downto 0);
        led : out std_logic_vector(15 downto 0)
    );
end entity MineSweepWrapper;

architecture MineSweepWrapper_ARCH of MineSweepWrapper is
      
begin
    
    
    MINESWEEP : entity work.MineSweep
        port map(
            clock      => clk,
            reset      => btnU,
            playerMove => sw,
            tiles      => led 
        );
    
end architecture MineSweepWrapper_ARCH;
