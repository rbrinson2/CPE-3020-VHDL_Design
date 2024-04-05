

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Randomizer_TB is
end entity Randomizer_TB;

architecture Randomizer_TB_ARCH of Randomizer_TB is
    signal clock : std_logic := '0';
    signal reset    : std_logic;
    signal startEn  : std_logic := '0';
    signal gamePlayMode : std_logic := '0';
    signal bombLocation : std_logic_vector(14 downto 0);
    
begin
    
    clock <= not clock after 10 ns;
    reset <= '1', '0' after 40 ns;
    gamePlayMode <= '0', '1' after 80 ns;

    Randomizer_inst : entity work.Randomizer
        port map(
            clock        => clock,
            reset        => reset,
            startEn      => startEn,
            gamePlayMode => gamePlayMode,
            bombLocation => bombLocation
        );
    
    TEST: process(clock, reset)
        variable count : integer range 0 to 100;
        
    begin
        if reset = '1' then
            startEn <= '0';
        elsif rising_edge(clock) then
            if (gamePlayMode = '1') then
                count := count + 1;
                if (count < 100) then 
                    startEn <= not startEn;
                else 
                    std.env.stop;
                end if;
            end if; 
        end if;
    end process TEST;
end architecture Randomizer_TB_ARCH;
