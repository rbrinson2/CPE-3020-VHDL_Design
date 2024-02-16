library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity JoyToLed is
    port (
        ----- Input Ports -----
        leftJoy             : in std_logic;
        rightJoy            : in std_logic;
        signal switches     : in std_logic_vector(2 downto 0);
        signal outputLed    : out std_logic_vector(15 downto 0)

        ----- Output Ports -----
        --signal sevenSegs  : out std_logic_vector(6 downto 0)
    );
end entity;

architecture JoyToLED_ARCH of JoyToLed is
    ----- Constants -----
    constant ON: std_logic := '1';
    constant OFF: std_logic := '0';
    ----- Internal Signals -----
    signal leftLed  : std_logic_vector(7 downto 0);
    signal rightLed : std_logic_vector(7 downto 0);
begin

    -- Final Led output
    outputLed(15 downto 8) <= leftLed when (leftJoy = ON) else
                                (others => '0');
    outputLed(7 downto 0)  <= rightLed when (rightJoy = ON) else
                                (others => '0');
    
    ----- Processes -----

    -- Mirror to reflect right to left
    MIRROR: process (rightLed) is
    begin
        for i in leftLed'range loop
            leftLed(i) <= rightLed((leftLed'length - 1) - i);
        end loop;
    end process;

    -- Led Driver to convert switch count to leds
    LED_DRIVER: process (switches) is
        variable count: integer range 0 to 7 := 0;
    begin
        count := 0;

        -- For loop to count active switches
        for i in switches'range loop
            if (switches(i) = ON) then
                count := count + (2 ** i);
            end if;
        end loop;
        
        -- For loop to convert to leds active
        for i in rightLed'range loop
            if (i < count) then
                rightLed(i) <= ON;
            else
                rightLed(i) <= OFF;
            end if;
        end loop;
    end process LED_DRIVER;

end architecture;
