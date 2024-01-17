
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity top is
end entity;

architecture Intro_Arch of top is
    
begin
    intro_tb: entity work.Intro_tb port map ();
    intro_inst: entity work.Intro port map (sw  => sw,led => led);
end architecture;