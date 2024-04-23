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
-- it starts the timers going. Bomb 1 increments with each
-- clock pulse, bomb 2 decriments every other clock pulse,
-- then finally bomb 3 increments every third clock pulse.
-- If a move is detected, then the final process stores the 
-- current value in finalBombLocations
-- that been output by Collision Chain.
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.MineSweepPackage.all;

--Randomizer============================================================ Entity
entity Randomizer is
    port(
        ----------------------------------------------------------- Input Ports
        clock           : in std_logic;
        reset           : in std_logic;
        gamePlayMode    : in std_logic;
        firstMoveDet    : in std_logic;
        
        ---------------------------------------------------------- Output Ports
        signal bomb1    : inout std_logic_vector(BOMBSIZE - 1 downto 0);
        signal bomb2    : inout std_logic_vector(BOMBSIZE - 1 downto 0);
        signal bomb3    : inout std_logic_vector(BOMBSIZE - 1 downto 0)
    );
end entity Randomizer;

--Randomizer-Architecture========================================= Architecture
architecture Randomizer_ARCH of Randomizer is
    ------------------------------------------------------------------- Signals
    signal firstMove : std_logic;
     

    --Bomb-2-Pulse-Generator----------------------------------------- Procedure
    -- Every two clock cycles, generates a pulse
    procedure bomb2Counter(
        counter : inout integer range 0 to 1;
        clockOut : inout std_logic
    ) is
    begin
        if (counter < 1) then
            counter  := counter + 1;
            clockOut := not ACTIVE;
        elsif (counter >= 1) then
            counter  := 0;
            clockOut := ACTIVE;
        end if;

    end procedure bomb2Counter;

    --Bomb-3-Pulse-Generator----------------------------------------- Procedure
    -- Every three clock cyles, generates a pulse
    procedure bomb3Counter(
        counter : inout integer range 0 to 2;
        clockOut : inout std_logic
    ) is
    begin
        if (counter < 2) then
            counter  := counter + 1;
            clockOut := not ACTIVE;
        elsif (counter >= 2) then
            counter  := 0;
            clockOut := ACTIVE;
        end if;
    end procedure bomb3Counter;
    

begin
    ---------------------------------------------------------------- ARCH-BEGIN
    
    FIRST_MOVE : process (clock, reset) is
    begin
        if reset = '1' then
            firstMove <= not ACTIVE;
        elsif rising_edge(clock) then
            if (firstMoveDet = ACTIVE) then
                firstMove <= ACTIVE;
            end if;
        end if;
    end process FIRST_MOVE;
    
    
    --Randomzier-Process----------------------------------------------- Process
    RANDOMIZER_PROC: process(clock, reset) is
        variable bomb2Clock : std_logic;
        variable bomb3Clock : std_logic;
        variable bomb2Count : integer range 0 to 2;
        variable bomb3Count : integer range 0 to 3;
        
    begin
        if (reset = ACTIVE) then
            bomb1           <= (others => '0');
            bomb2           <= (others => '0');
            bomb3           <= (others => '0');
            bomb2Clock      := not ACTIVE;
            bomb3Clock      := not ACTIVE;
            bomb2Count      := 0;
            bomb3Count      := 0;   

        elsif (rising_edge(clock)) then
            if (
                gamePlayMode = ACTIVE
                and firstMove = not ACTIVE
            ) then

                bomb2Counter(bomb2Count, bomb2Clock);
                bomb3Counter(bomb3Count, bomb3Clock);

                -- Increment bomb 1 
                bomb1 <= std_logic_vector(unsigned(bomb1) + 1);

                -- Decriment bomb 2
                if (bomb2Clock = ACTIVE) then
                    bomb2 <= std_logic_vector(unsigned(bomb2) - 1);
                end if;
                -- Increment bomb 1
                if (bomb3Clock = ACTIVE) then
                    bomb3 <= std_logic_vector(unsigned(bomb3) + 1);
                end if;
            end if;
        end if;
    end process RANDOMIZER_PROC;

end architecture Randomizer_ARCH;
