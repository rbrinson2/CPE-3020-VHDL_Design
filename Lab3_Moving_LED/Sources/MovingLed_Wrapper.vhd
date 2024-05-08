---------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 03/06/2024 
-- Design Name: Moving LED
-- Lab Name: Lab 3 - Moving Led
-- Target Devices: Basys 3
-- Description: 
-- Converts the signals of the Moving Led enitity into Basys3
-- specific signals.
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

--------------------------------------------------------- Entity
entity MovingLed_Wrapper is
    port ( 
        signal clk  : in std_logic;
        signal btnU : in std_logic;
        signal btnR : in std_logic;
        signal btnL : in std_logic;

        signal led  : out std_logic_vector (15 downto 0);
        signal an   : out std_logic_vector (3 downto 0);
        signal seg  : out std_logic_vector (6 downto 0)
    );
end entity MovingLed_Wrapper;

---------------------------------------------------Architecture
architecture MovingLed_Wrapper_ARCH of MovingLed_Wrapper is

begin

    ---------- Insantiation
    MovingLed_inst: entity work.MovingLed
        port map(
            clock => clk,
            reset => btnU,
            rightMove => btnR,
            leftMove => btnL,
            led => led,
            sevenSegs => seg,
            anodes => an
    );

end architecture;