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
-- Tests the randomizer by every clock period, cycling the 
-- move detected signal. We can then see if there is a random
-- output or not.
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--====================================================================== ENTITY
entity Randomizer_TB is
end entity Randomizer_TB;

--================================================================ ARCHITECTURE
architecture Randomizer_TB_ARCH of Randomizer_TB is
    signal clock : std_logic := '0';
    signal reset    : std_logic;
    signal moveDet  : std_logic := '0';
    signal gamePlayMode : std_logic := '0';
    signal bombLocation : std_logic_vector(14 downto 0);
    
begin
    
    ---------- Clock Generator
    clock <= not clock after 10 ns;
    ---------- Reset Generator
    reset <= '1', '0' after 40 ns;

    --Gameplay mode enable
    gamePlayMode <= '0', '1' after 80 ns;

    --Randomizer-------------------------------------------------------- Insant
    DUT : entity work.Randomizer
        port map(
            clock        => clock,
            reset        => reset,
            moveDet      => moveDet,
            gamePlayMode => gamePlayMode,
            bombLocation => bombLocation
        );
    
    --Stimulus--------------------------------------------------------- Process
    STIMULUS: process(clock, reset)
        variable count : integer range 0 to 100;
        
    begin
        if reset = '1' then
            moveDet <= '0';
        elsif rising_edge(clock) then
            if (gamePlayMode = '1') then
                count := count + 1;
                if (count mod 5 = 0) then 
                    moveDet <= '1';
                elsif (count >= 99) then
                    std.env.stop;
                else 
                    moveDet <= '0';
                end if; 
            end if; 
        end if;
    end process STIMULUS;
end architecture Randomizer_TB_ARCH;
