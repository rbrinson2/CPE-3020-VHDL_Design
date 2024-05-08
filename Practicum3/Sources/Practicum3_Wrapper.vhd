----------------------------------------------------------------------------------
-- Student: Ryan Brinson
-- Create Date: 04/29/2024 06:32:51 PM
-- Design Name: Practicum 3
-- Module Name: Practicum3 - Practicum3_ARCH
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Practicum3_Wrapper is
    port (
        ----------------------------------------------------------- Input Ports
        clk     : in std_logic;
        sw      : in std_logic_vector(15 downto 0);
        btnU    : in std_logic;
        btnD    : in std_logic;
        btnC    : in std_logic;

        ----------------------------------------------------------- Ouput Ports
        led     : out std_logic_vector(7 downto 0)
     );
end Practicum3_Wrapper;

architecture Practicum3_Wrapper_ARCH of Practicum3_Wrapper is

begin

    Practicum3_inst : entity work.Practicum3
        port map(
            clock    => clk,
            reset    => btnC,
            dataIn   => sw(7 downto 0),
            setNum   => sw(15 downto 13),
            loadEn   => btnU,
            toggleEn => btnD,
            dataOut  => led
        );
    

end Practicum3_Wrapper_ARCH;
