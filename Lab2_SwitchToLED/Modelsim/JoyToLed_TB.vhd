library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity JoyToLed_TB is
end entity;

architecture JoyToLed_TB_ARCH of JoyToLed_TB is
  signal clock      : std_logic := '0';
  signal switches   : std_logic_vector(2 downto 0);
  signal outputLed  : std_logic_vector(15 downto 0);
begin

  clock <= not clock after 10 ns;

  DUT: entity work.JoyToLed
  port map (
    switches  => switches,
    outputLed => outputLed
  );

  process (clock) is
    variable switchCount: unsigned(2 downto 0) := 0;
  begin
    if rising_edge(clock) then
      switchCount := switchCount + 1;
      switches <= std_logic_vector(switchCount);
    end if;
  end process;


end architecture;
