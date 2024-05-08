

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

entity Timer_TB is
end entity Timer_TB;


architecture Timer_TB_ARCH of Timer_TB is
    signal clock         : std_logic := '0';
    signal reset         : std_logic := '1';
    signal firstMoveDet  : std_logic := '0';
    signal hitDet        : std_logic := '0';
    signal gameOverMode  : std_logic := '0';
    signal upperDigit    : std_logic_vector(3 downto 0);
    signal lowerDigit    : std_logic_vector(3 downto 0);
    signal timerZeroMode : std_logic;
begin
    
    clock <= not clock after 10 ns;
    reset <= 
        '0' after 40 ns,
        '1' after 2800 ns,
        '0' after 2840 ns;
    firstMoveDet <= 
        '1' after 60 ns,
        '0' after 80 ns,
        '1' after 2870 ns,
        '0' after 2890 ns;
    hitDet <= '1' after 3500 ns;

    STOP : process (clock) is
        variable count : integer := 0;
    begin
        if rising_edge(clock) then
            count := count + 1;
            if (count >= 200) then
                std.env.stop;
            end if;
        end if;
    end process STOP;
    

    DUT : entity work.Timer
        port map(
            clock         => clock,
            reset         => reset,
            firstMoveDet  => firstMoveDet,
            hitDet        => hitDet,
            gameOverMode  => gameOverMode,
            upperDigit    => upperDigit,
            lowerDigit    => lowerDigit,
            timerZeroMode => timerZeroMode
        );
    
end architecture Timer_TB_ARCH;
