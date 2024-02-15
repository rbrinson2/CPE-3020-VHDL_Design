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
    variable switchCount: unsigned(3 downto 0) := "0000";
  begin
    if rising_edge(clock) then
      switchCount := switchCount + 1;
      if (switchCount(3) = '1') then
        std.env.stop;
      end if;
    end if;
    switches <= std_logic_vector(switchCount(2 downto 0));
  end process;


end architecture;
