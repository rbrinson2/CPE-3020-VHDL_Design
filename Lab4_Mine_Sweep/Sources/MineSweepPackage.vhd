library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package MineSweepPackage is
    constant ACTIVE         : std_logic := '1';
    constant BOMBBUSWIDTH   : integer := 16;
    constant BOMBSIZE       : integer := 5;
    constant DOUBLE         : std_logic := '1';
    constant MOVEWIDTH      : integer := 16;
    constant TILEBUSWIDTH   : integer := 16;
    constant ZERO           : std_logic_vector(BOMBBUSWIDTH - 1 downto 0) 
                                := (others => '0');
end package MineSweepPackage;
