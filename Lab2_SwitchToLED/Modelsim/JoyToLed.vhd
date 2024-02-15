library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity JoyToLed is
  port (
    leftJoy     : std_logic;
    rightJoy    : std_logic;
    switches    : std_logic_vector(2 downto 0);
    outputLed   : std_logic_vector(15 downto 0);
    sevenSegs   : std_logic_vector(6 downto 0)
  );
end entity;

architecture JoyToLED_ARCH of JoyToLed is
    signal leftLed  : std_logic_vector(7 downto 0);
    signal rightLed : std_logic_vector(7 downto 0);
begin


LED_DRIVER: process (switches) is
begin
end process LED_DRIVER;

MIRROR: process (leftLed) is
begin
end process MIRROR;

SEGMENT_DRIVER: process (switches) is
begin
end process SEGMENT_DRIVER;

end architecture;
