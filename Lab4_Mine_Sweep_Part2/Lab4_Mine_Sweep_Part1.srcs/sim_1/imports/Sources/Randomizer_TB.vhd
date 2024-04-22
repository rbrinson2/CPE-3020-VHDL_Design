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

use work.minesweeppackage.all;

--====================================================================== ENTITY
entity Randomizer_TB is
end entity Randomizer_TB;

--================================================================ ARCHITECTURE
architecture Randomizer_TB_ARCH of Randomizer_TB is
    signal clock : std_logic := '0';
    signal reset    : std_logic;
    signal moveDet  : std_logic := '0';
    signal gamePlayMode : std_logic := '0';
    signal firstMoveDet : std_logic := '0';
    signal bomb1Temp : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb2Temp : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb3Temp : std_logic_vector(BOMBSIZE - 1 downto 0);
    
begin
    
    ---------- Clock Generator
    clock <= not clock after 10 ns;
    ---------- Reset Generator
    reset <= '1', '0' after 40 ns;

    --Gameplay mode enable
    gamePlayMode <= '0', '1' after 80 ns;

    --Randomizer------------------------------------------------------- Instant
    DUT : entity work.Randomizer
        port map(
            clock        => clock,
            reset        => reset,
            gamePlayMode => gamePlayMode,
            firstMoveDet => firstMoveDet,
            bomb1        => bomb1Temp,
            bomb2        => bomb2Temp,
            bomb3        => bomb3Temp
        );
    
    --Stimulus--------------------------------------------------------- Process
    STIMULUS: process(clock, reset)
        variable count : integer range 0 to 100;
        variable firstMove : integer range 0 to 1;
    begin
        if reset = '1' then
            moveDet <= '0';
            firstMoveDet <= '0';
            count := 0;
            firstMove := 0;
        elsif rising_edge(clock) then
            firstMoveDet <= '0';
            if (gamePlayMode = '1') then
                count := count + 1;
                if (count mod 5 = 0) then 
                    moveDet <= '1';
                    if (firstMove = 0) then
                        firstMove := 1;
                        firstMoveDet <= ACTIVE;
                    end if;
                elsif (count >= 99) then
                    std.env.stop;
                else 
                    moveDet <= '0';
                end if; 
            end if; 
        end if;
    end process STIMULUS;
end architecture Randomizer_TB_ARCH;
