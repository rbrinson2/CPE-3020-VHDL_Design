library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity Practicum1_TB is
end entity;

architecture Practicum1_TB_ARCH of Practicum1_TB is
    signal clock    : std_logic := '0';
    signal switches : std_logic_vector (7 downto 0) := (others => '0');
    signal led      : std_logic_vector (1 downto 0) := (others => '0');
begin

    clock <= not clock after 10 ns;

    practicum1_inst: entity work.Practicum1
    port map (
        switches => switches,
        led      => led
    );
    
    STIMULUS: process (clock) is
        variable count : integer := 0;
    begin
        if (rising_edge(clock)) then
            switches <= std_logic_vector(to_unsigned(count, 8));
            count := count + 1;
        end if;
        

        if (count >= 260) then
            std.env.stop;
        end if;
    end process;
end architecture;
