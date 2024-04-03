

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Randomizer_TB is
end entity Randomizer_TB;

architecture Randomizer_TB_ARCH of Randomizer_TB is
    signal clock : std_logic;
    signal reset    : std_logic;
    signal startEn  : std_logic;
    signal gamePlayMode : std_logic;
    signal bombLocation : std_logic_vector(14 downto 0);
    
begin
    
    Randomizer_inst : entity work.Randomizer
        port map(
            clock        => clock,
            reset        => reset,
            startEn      => startEn,
            gamePlayMode => gamePlayMode,
            bombLocation => bombLocation
        );
    
    
end architecture Randomizer_TB_ARCH;
