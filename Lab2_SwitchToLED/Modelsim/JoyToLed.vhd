library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity JoyToLed is
  port (
    --leftJoy     : std_logic;
    --rightJoy    : std_logic;
    signal switches    : in std_logic_vector(2 downto 0);
    signal outputLed   : out std_logic_vector(15 downto 0)
    --sevenSegs   : std_logic_vector(6 downto 0)
  );
end entity;

architecture JoyToLED_ARCH of JoyToLed is
    signal leftLed  : std_logic_vector(7 downto 0);
    --signal rightLed : std_logic_vector(7 downto 0);
begin

outputLed <= (leftLed, others => '0');

LED_DRIVER: process (switches) is
    variable count: integer range 0 to 7 := 0;
begin
    if (switches(0) = '1') then
        count := count + 1;
    end if; 
    if (switches(1) = '1') then
        count := count + 2;
    end if;
    if (switches(2) = '1') then
        count := count + 4;
    end if;

    leftLed <= (std_logic_vector(to_unsigned(count, 8)) , others => '0');

end process LED_DRIVER;

end architecture;
