

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity TileDriver_TB is
end entity TileDriver_TB;

architecture TileDriver_TB_ARCH of TileDriver_TB is
    constant ACTIVE : std_logic := '1';
    
    signal clock            : std_logic := '0';
    signal reset            : std_logic;
    signal bombLocations    : std_logic_vector(14 downto 0);
    signal tiles            : std_logic_vector(15 downto 0);
    
begin

    clock <= not clock after 10 ns;
    reset <= '1', '0' after 40 ns;    


    TileDriver_inst : entity work.TileDriver
        port map(
            clock         => clock,
            reset         => reset,
            bombLocations => bombLocations,
            tiles         => tiles
        );
    
    SIGNALDRIVER : process (clock) is
        variable seed : integer := 1;
        variable count : integer := 1;
        variable x : real;
        variable y : integer;
        
    begin

        if (rising_edge(clock)) then
            uniform(seed, seed, x);
            y := integer(floor(x * 32768.0));
            report "y = " & integer'image(y);
            
            if (count < 10) then
                count := count + 1;
                report "count = " & integer'image(count);
            elsif (count >= 10) then
                std.env.stop;
            end if;
            bombLocations <= std_logic_vector(to_unsigned(y, 15));
        end if;
    end process SIGNALDRIVER;
    
end architecture TileDriver_TB_ARCH;

