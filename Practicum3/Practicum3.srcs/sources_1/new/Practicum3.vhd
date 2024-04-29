----------------------------------------------------------------------------------
-- Student: Ryan Brinson
-- Create Date: 04/29/2024 06:32:51 PM
-- Design Name: Practicum 3
-- Module Name: Practicum3 - Practicum3_ARCH
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Practicum3 is
    port ( 
        ----------------------------------------------------------- Input Ports
        clock    : in std_logic;
        reset    : in std_logic;
        dataIn   : in std_logic_vector(7 downto 0);
        setNum   : in std_logic_vector(2 downto 0);
        loadEn   : in std_logic;
        toggleEn : in std_logic;
        
        ---------------------------------------------------------- Output Ports
        dataOut : out std_logic_vector(7 downto 0)
    );
end Practicum3;

architecture Practicum3_ARCH of Practicum3 is
    constant ACTIVE : std_logic := '1';
begin

    PRACT3 : process (clock, reset) is
        variable temp : std_logic_vector(7 downto 0);
        
    begin
        if (reset = ACTIVE) then
            dataOut <= (others => '0'); 
            temp := (others => '0') ;
        elsif (rising_edge(clock)) then
            if (loadEn = ACTIVE) then
                dataOut <= dataIn;
                temp := dataIn;
            else
                if (toggleEn = ACTIVE) then
                    for i in temp'reverse_range loop
                        if i = to_integer(unsigned(setNum)) then
                            temp(i) := not temp(i);
                        end if;
                    end loop;
                    dataOut <= temp;
                end if;
            end if;
        end if;
    end process PRACT3;
    
end Practicum3_ARCH;
