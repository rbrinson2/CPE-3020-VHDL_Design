
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MoveDetect_TB is
end entity MoveDetect_TB;


architecture MoveDetect_TB_ARCH of MoveDetect_TB is
    -------- Input Ports
    signal clock            : std_logic := '0';
    signal reset            : std_logic := '1';
    signal playerMoveSync   : std_logic_vector(15 downto 0) := (others => '0');

    -------- Ouput Ports
    signal gamePlayMode     : std_logic;
    signal startEn          : std_logic;
    signal zeroMode         : std_logic;
     
    
begin
    
    clock <= not clock after 10 ns;
    reset <= '0' after 40 ns, '1' after 900 ns, '0' after 940 ns; 

    MoveDetect_inst : entity work.MoveDetect
        port map(
            clock          => clock,
            reset          => reset,
            playerMoveSync => playerMoveSync,
            gamePlayMode   => gamePlayMode,
            startEn        => startEn,
            zeroMode       => zeroMode
        );
    
    STIMULUS : process(clock) is
        variable count : integer := 0;
    begin
        if (rising_edge(clock)) then
            if (count < 100) then
                count := count + 1;
                if ((count mod 5) = 0) then
                    playerMoveSync <= std_logic_vector(unsigned(playerMoveSync) + 1);
                end if;
                if (count = 50) then
                    playerMoveSync <= (others => '0');
                end if;
            else 
                std.env.stop;
            end if;
        end if;
    end process STIMULUS;
    
    
end architecture MoveDetect_TB_ARCH;
