library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity Intro is
    port (
        sw: in std_ulogic_vector(3 downto 1);
        led: out std_ulogic_vector(3 downto 1)
    );
end entity Intro;

architecture Intro_ARCH of Intro is
    
begin
    led(1) <= sw(1) or sw(2) or sw(3);
    led(2) <= (sw(1) and sw(2)) or (sw(1) and sw(3)) or (sw(2) and sw(3));
    led(3) <= sw(1) and sw(2) and sw(3);
    
end architecture Intro_ARCH;