library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity Practicum1 is
    port (
        ----- Inputs
        switches    : in std_logic_vector (7 downto 0);

        ----- Outputs
        led         : out std_logic_vector (1 downto 0)
    );
end entity;

architecture Practicum1_ARCH of Practicum1 is
begin

    

    ZERO_COUNT: process (switches) is
        variable even       : std_logic;
        variable odd        : std_logic;
        variable zeroCount  : integer range 0 to 7 := 0;
    begin
        for i in switches'range loop
            if (switches(i) = '0') then
                zeroCount := zeroCount + 1;
            end if;
        end loop;
        
        if (zeroCount = 0) then
            even    := '0';
            odd     := '0';
        elsif (zeroCount mod 2 = 0) then
            even    := '1';
            odd     := '0';
        elsif (zeroCount mod 2 = 1) then
            even    := '0';
            odd     := '1';
        end if;

        zeroCount := 0;
        led <= odd & even;
    end process;

end architecture;
