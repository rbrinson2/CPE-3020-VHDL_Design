
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Intro_tb is
    port (
        sw: out std_ulogic_vector(3 downto 1)
    );
end entity Intro_tb;

architecture Intro_ARCH of Intro_tb is
    
begin
    
    SWITCH_DRIVER: process is
    begin
        sw <= "000";
        wait for 100 ns;
        sw <= "001";
        wait for 100 ns;
        sw <= "010";
        wait for 100 ns;
        sw <= "011";
        wait for 100 ns;
        sw <= "100";
        wait for 100 ns;
        sw <= "101";
        wait for 100 ns;
        sw <= "110";
        wait for 100 ns;
        sw <= "111";

    end process SWITCH_DRIVER;
    
end architecture Intro_ARCH;