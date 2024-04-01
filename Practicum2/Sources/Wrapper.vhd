library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BasysWrapper is
    port(
        clk : in std_logic;
        sw  : in std_logic_vector(7 downto 0);
        btnU : in std_logic;
        btnL : in std_logic;
        btnR : in std_logic;
        btnC : in std_logic;

        led  : out std_logic_vector(7 downto 0)
    );
end entity BasysWrapper;

architecture BasysWrapper_ARCH of BasysWrapper is
    
begin
    

    Practicum_inst : entity work.Practicum
        port map(
            clock         => clk,
            reset         => btnC,
            dataIn        => sw,
            load          => btnU,
            clearEvenBits => btnL,
            setOddBits    => btnR,
            dataOut       => led
        );
    
end architecture BasysWrapper_ARCH;
