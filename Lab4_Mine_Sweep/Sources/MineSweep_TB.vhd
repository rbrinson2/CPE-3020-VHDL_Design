---------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 04/08/2024 
-- Design Name: Mine Sweep Testbench
-- Lab Name: Lab 4 - Mine Sweep 
-- Target Devices: Basys 3
-- 
-- Description: 
-- Simply starts with a reset. once the reset is done, the 
-- counter counts the clocks and increments playermove every
-- 5 counts. After 100 counts the testbench ends. Has a reset
-- set to occur approximately midway in the test.
---------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--====================================================================== ENTITY
entity MineSweep_TB is
end entity MineSweep_TB;

--================================================================ ARCHITECTURE
architecture MineSweep_TB_ARCH of MineSweep_TB is
    constant ACTIVE : std_logic := '1';
    
    ---------- Input Ports
    signal clock : std_logic := '0';
    signal reset : std_logic;
    signal playerMove : std_logic_vector(15 downto 0) := (others => '0');

    --------- Output Ports
    signal tiles : std_logic_vector(15 downto 0);
begin
    
    ---------- Clock Generator
    clock <= not clock after 10 ns;
    ---------- Reset Generator
    reset <= '1', '0' after 40 ns, '1' after 800 ns, '0' after 840 ns;
    
    --Minesweep-------------------------------------------------------- Insant
    MineSweep_inst : entity work.MineSweep
        port map(
            clock      => clock,
            reset      => reset,
            playerMove => playerMove,
            tiles      => tiles
        );
    
    --Stimulus--------------------------------------------------------- Process
    STIMULUS : process (clock, reset) is
        variable count : integer := 0;
    begin
        if (reset = ACTIVE)then
            playerMove <= (others => '0');

        elsif (rising_edge(clock)) then
            if (count < 100) then
                count := count + 1;
                if (count mod 5 = 0) then
                    playerMove <= std_logic_vector(unsigned(playerMove) + 1);
                end if;
            else 
                std.env.stop;
            end if;
        end if;
    end process STIMULUS;
    
end architecture MineSweep_TB_ARCH;

