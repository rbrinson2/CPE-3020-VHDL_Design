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
    --signal leftLed  : std_logic_vector(7 downto 0);
    signal rightLed : std_logic_vector(7 downto 0);
begin

    outputLed(7 downto 0) <= rightLed;
    outputLed(15 downto 8) <= (others => '0');


    LED_DRIVER: process (switches) is
        variable count: integer range 0 to 7 := 0;
    begin
        count := 0;
        for i in switches'range loop
            if (switches(i) = '1') then
                count := count + (2 ** i);
            end if;
        end loop;
        
        for i in rightLed'range loop
            if (i < count) then
                rightLed(i) <= '1';
            else
                rightLed(i) <= '0';
            end if;
        end loop;
    end process LED_DRIVER;

end architecture;
