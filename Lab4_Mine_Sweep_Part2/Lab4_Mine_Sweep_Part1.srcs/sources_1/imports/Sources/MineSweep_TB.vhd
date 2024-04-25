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
use work.minesweeppackage.all;

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
    signal anodes : std_logic_vector(3 downto 0);
    signal sevenSegs : std_logic_vector(6 downto 0);
    signal tiles : std_logic_vector(15 downto 0);

    type testArray_t is array(natural range<>) of std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    constant TEST_VECTOR : testArray_t := (
             --PlayerMove--
     "0000" & "0000" & "0000" & "0000",
     "0000" & "0000" & "0100" & "0000",
     "0000" & "0100" & "0100" & "0000",
     "0000" & "0100" & "0100" & "1000",
     "0100" & "0100" & "0100" & "1000",
     "0100" & "0100" & "0100" & "1000",
     "0000" & "0000" & "0000" & "0000",
     "0000" & "0010" & "0000" & "0000",
     "0000" & "0010" & "1000" & "0000",
     "0000" & "0010" & "1000" & "0001"
    );
    
    
begin
    
    ---------- Clock Generator
    clock <= not clock after 10 ns;

    reset <= 
        '1' after 0 ns,
        '0' after 40 ns,
        '1' after 2200 ns,
        '0' after 2240 ns;
    --Minesweep-------------------------------------------------------- Insant
    DUT : entity work.MineSweep
        port map(
            clock      => clock,
            reset      => reset,
            playerMove => playerMove,
            anodes     => anodes,
            sevenSegs  => sevenSegs,
            tiles      => tiles
        );
    
    --Stimulus--------------------------------------------------------- Process
    STIMULUS : process (clock, reset) is
        variable count : integer := 0;
        variable index : natural;
    begin
        if (reset = ACTIVE)then
            playerMove <= TEST_VECTOR(0);
            index := 0;

        elsif (rising_edge(clock)) then
            
            count := count + 1;
            if (count mod 20 = 10) then
                playerMove <= TEST_VECTOR(index);
                index := index + 1;

                if (index >= TEST_VECTOR'length) then
                    std.env.stop;
                end if;
            end if;
            
        end if;
    end process STIMULUS;
    
end architecture MineSweep_TB_ARCH;

