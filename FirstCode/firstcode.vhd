library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity firstcode is
    port (
        sw1: in std_ulogic;
        sw2: in std_ulogic;
        sw3: in std_ulogic;
        led1: out std_ulogic;
        led2: out std_ulogic;
        led3: out std_ulogic
    );
end entity firstcode;

architecture rtl of firstcode is
    
begin
    
    led1 <= sw1 or sw2 or sw3;
    led2 <= (sw1 and sw2) or (sw1 and sw3) or (sw2 and sw3);
    led3 <= sw1 and sw2 and sw3;
    
end architecture rtl;