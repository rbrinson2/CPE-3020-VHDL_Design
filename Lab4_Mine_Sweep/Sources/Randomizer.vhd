---------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 04/08/2024 
-- Design Name: Randomizer
-- Lab Name: Lab 4 - Mine Sweep
-- Target Devices: Basys 3
-- 
-- Description: 
-- Waits for the gameplay mode to activate. Once that occurs
-- it starts the timers going. If a move is detected, it then
-- updates the bomblocation based on where the timers are at 
-- that moment
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Randomizer============================================================ Entity
entity Randomizer is
    port(
        ---------- Input Ports
        clock           : in std_logic;
        reset           : in std_logic;
        moveDet         : in std_logic;
        gamePlayMode    : in std_logic;
        
        ---------- Output Ports
        bombLocation    : out std_logic_vector (14 downto 0)
    );
end entity Randomizer;

--Randomizer-Architecture========================================= Architecture
architecture Randomizer_ARCH of Randomizer is
    constant ACTIVE : std_logic := '1';
begin

    RANDO_PROC : process (clock, reset) is
    begin
        if reset = '1' then
            bombLocation <= (others => '0'); 
        elsif rising_edge(clock) then
            if (moveDet = ACTIVE) then
                bombLocation <= (others => '1'); 
            end if;
        end if;
    end process RANDO_PROC;
    

end architecture Randomizer_ARCH;
