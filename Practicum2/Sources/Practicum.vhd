library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Practicum is
    port(
        --------- Input
        clock           : in std_logic;
        reset           : in std_logic;
        dataIn          : in std_logic_vector(7 downto 0);
        load            : in std_logic;
        clearEvenBits   : in std_logic;
        setOddBits      : in std_logic;

        ---------- Output
        dataOut         : out std_logic_vector(7 downto 0)
    );
end entity Practicum;

architecture Practicum_ARCH of Practicum is
    constant ACTIVE : std_logic := '1';
    signal evenBits : std_logic_vector(3 downto 0);
    signal oddBits  : std_logic_vector(3 downto 0);
begin
    EVEN : evenBits <= "0000";
    ODD  : oddBits <= "1111";

    DATA_DRIVER : process (clock, reset) is
    begin
        if (reset = ACTIVE) then
            dataOut <= (others => '0');
        elsif rising_edge(clock) then
            if (load = ACTIVE) then
                dataOut <= dataIn;
            elsif (setOddBits = ACTIVE) then
                (dataOut(7), dataOut(5), dataOut(3), dataOut(1)) <= oddBits;
            elsif (clearEvenBits = ACTIVE) then
                (dataOut(6), dataOut(4), dataOut(2), dataOut(0)) <= evenBits;
            end if;
        end if;
    end process DATA_DRIVER;
    
end architecture Practicum_ARCH;
