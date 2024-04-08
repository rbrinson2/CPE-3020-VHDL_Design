library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MineSweep_TB is
end entity MineSweep_TB;

architecture MineSweep_TB_ARCH of MineSweep_TB is
    constant ACTIVE : std_logic := '1';
    
    ---------- Input Ports
    signal clock : std_logic := '0';
    signal reset : std_logic;
    signal playerMove : std_logic_vector(15 downto 0) := (others => '0');

    --------- Output Ports
    signal tiles : std_logic_vector(15 downto 0);
begin
    
    clock <= not clock after 10 ns;
    reset <= '1', '0' after 40 ns;
    
    MineSweep_inst : entity work.MineSweep
        port map(
            clock      => clock,
            reset      => reset,
            playerMove => playerMove,
            tiles      => tiles
        );
    
    STIMULUS : process (clock, reset) is
        variable count : integer := 0;
    begin
        if (reset = ACTIVE)then
            playerMove <= (others => '0');
        elsif (rising_edge(clock)) then
            if (count < 100) then
                count := count + 1;
                playerMove <= std_logic_vector(unsigned(playerMove) + 1);
            else 
                std.env.stop;
            end if;
        end if;
    end process STIMULUS;
    
end architecture MineSweep_TB_ARCH;

