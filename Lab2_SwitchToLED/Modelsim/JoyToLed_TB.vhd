library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;


------------------------------------------------ Entity
entity JoyToLed_TB is
end entity;

------------------------------------------------ Architecture
architecture JoyToLed_TB_ARCH of JoyToLed_TB is
  --------------------- Declarations
  signal clock      : std_logic := '0';
  signal switches   : std_logic_vector(2 downto 0);
  signal outputLed  : std_logic_vector(15 downto 0);
  signal leftJoy    : std_logic := '0';
  signal rightJoy   : std_logic := '1';
begin

  --------------------- Statements
  -- Testbench Clock
  clock <= not clock after 10 ns;

  -- JoyToLed Instantiation
  DUT: entity work.JoyToLed
  port map (
    switches  => switches,
    outputLed => outputLed,
    leftJoy => leftJoy,
    rightJoy => rightJoy
  );

  -- Main Input Driver
  INPUT_DRIVER: process (clock) is
    variable clockCount: integer range 0 to 35 := 0;
    variable switchCount: integer range 0 to 8 := 0;
    variable joyVar: unsigned(1 downto 0) := "00";
    constant STOP: integer := 33;
  begin
    clockCount := clockCount +1;
    if (clockCount = STOP) then 
      std.env.stop;
    end if;

    -- Cases for each instance
    case (clockCount mod 4) is
      when 0 => 
        joyVar := "00";
        switchCount := switchCount +1;
      when 1 =>
        joyVar := "01";
      when 2 =>
        joyVar := "10";
      when 3 =>
        joyVar := "11";
      when others => 
        joyVar := "00";
    end case;

    (leftJoy, rightJoy) <= std_logic_vector(joyVar);
    switches <= std_logic_vector(to_unsigned(switchCount, 3));
  end process;


end architecture;
