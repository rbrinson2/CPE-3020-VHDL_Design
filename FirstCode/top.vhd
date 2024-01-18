
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity top is
end entity;

architecture Intro_Arch of top is
    signal switches: std_ulogic_vector (3 downto 1);
    signal leds: std_ulogic_vector (3 downto 1);
begin
    intro_tb: entity work.Intro_tb port map (sw => switches);
    intro_inst: entity work.Intro port map (sw => switches, led => leds);
end architecture;