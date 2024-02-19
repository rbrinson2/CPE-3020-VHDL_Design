library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
------------------------------------------------ Entity
entity JoyToLed is
    port (
        ----- Input Ports 
        leftJoy             : in std_logic;
        rightJoy            : in std_logic;
        signal switches     : in std_logic_vector(2 downto 0);
        

        ----- Output Ports 

        signal outputLed    : out std_logic_vector(15 downto 0);
        signal sevenSegs    : out std_logic_vector(6 downto 0)
    );
end entity;

------------------------------------------------ Architecture
architecture JoyToLED_ARCH of JoyToLed is
    --------------------- Declarations

    ----- Constants
    constant PRESS  : std_logic := '1';
    constant ZERO   : std_logic_vector (6 downto 0) := "1000000";
    constant ONE    : std_logic_vector (6 downto 0) := "1111001";
    constant TWO    : std_logic_vector (6 downto 0) := "0100100";
    constant THREE  : std_logic_vector (6 downto 0) := "0110000";
    constant FOUR   : std_logic_vector (6 downto 0) := "0011001";
    constant FIVE   : std_logic_vector (6 downto 0) := "0010010";
    constant SIX    : std_logic_vector (6 downto 0) := "0000010";
    constant SEVEN  : std_logic_vector (6 downto 0) := "1111000";
    constant OTHER  : std_logic_vector (6 downto 0) := "0111111";

    ----- Internal Signals
    signal leftLed  : std_logic_vector(7 downto 0);
    signal rightLed : std_logic_vector(7 downto 0);
begin

    --------------------- Statements
    -- Final Led output
    with leftJoy select
        outputLed(15 downto 8) <=
            leftLed when PRESS,
            (others => '0') when others;
    with rightJoy select
        outputLed(7 downto 0)  <=
            rightLed when PRESS,
            (others => '0') when others;
    
    ----- Processes

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
            if (switches(i) = '1') then
                count := count + (2 ** i);
            end if;
        end loop;
        
        -- For loop to convert to leds active
        for i in rightLed'range loop
            if (i < count) then
                rightLed(i) <= '1';
            else
                rightLed(i) <= '0';
            end if;
        end loop;
    end process LED_DRIVER;

    -- Seven Segment Driver
    with switches select
        sevenSegs <= 
            ZERO    when "000",
            ONE     when "001",
            TWO     when "010",
            THREE   when "011",
            FOUR    when "100",
            FIVE    when "101",
            SIX     when "110",
            SEVEN   when "111",
            OTHER   when others;



end architecture;
