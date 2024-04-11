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

use work.minesweeppackage.all;

--Randomizer============================================================ Entity
entity Randomizer is
    port(
        ---------- Input Ports
        clock           : in std_logic;
        reset           : in std_logic;
        moveDet         : in std_logic;
        gamePlayMode    : in std_logic;
        
        ---------- Output Ports
        bombLocation    : out std_logic_vector (BOMBBUSWIDTH - 1 downto 0)
    );
end entity Randomizer;

--Randomizer-Architecture========================================= Architecture
architecture Randomizer_ARCH of Randomizer is
    ---------- Constants
    constant ACTIVE     : std_logic := '1';
    constant EDGE       : std_logic_vector(3 downto 0) := "1111";
    constant ZERO       : std_logic_vector(BOMBBUSWIDTH - 1 downto 0) := (others => '0');
    constant BOMBSIZE   : integer := 5;
    constant DOUBLEWIDTH : std_logic := '1';
    constant SINGLEWIDTH : std_logic := '0';
    
     
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

    --Collision-Detection--------------------------------------------- Function
    -- Determines if two bombs are overlapping
    function collisionDetect (
        bomb1 : std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb2 : std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb3 : std_logic_vector(BOMBSIZE - 1 downto 0)
    )
        return std_logic_vector 
    is
        variable temp : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        
    begin
        
        --TODO: Create the Collision detector
    
        return temp;
    end function;

    --BCD-to-One-Hot-------------------------------------------------- Function
    function bin2Hot(bombPos : std_logic_vector(4 downto 0))
        return std_logic_vector is
        variable oneHot : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable position : integer range 0 to 2**bombPos'length;
    begin
        oneHot   := (others => '0'); 
        position := to_integer(unsigned(bombPos(3 downto 0)));
        for i in oneHot'range loop
            if (i = position) then
                -- Map the bomb to here
                oneHot(i) := ACTIVE;

                -- Check if it's a doublewide bomb and if it's at the edge
                if (bombPos(4) = DOUBLEWIDTH 
                    and bombPos(3 downto 0) = EDGE
                    ) then
                    -- If it is at the edge
                    oneHot(i - 1) := ACTIVE;
                else
                    -- If it's not at the edge
                    oneHot(i + 1) := ACTIVE;
                end if;
            end if;
        end loop;
        return oneHot;
    end function bin2Hot;
    
    --Mask-Generator-------------------------------------------------- Function
    function maskGen(bomb : std_logic_vector(BOMBBUSWIDTH - 1 downto 0))
        return std_logic_vector is
        variable mask : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable leftShift : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable rightShift : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    begin
        leftShift := bomb(bomb'length - 2 downto 0) & '0';
        rightShift := '0' & bomb(bomb'length - 1 downto 1);
        mask := bomb or leftShift or rightShift;

        return mask;
    end function maskGen;
    
begin
    --Randomzier-Process----------------------------------------------- Process
    RANDOMIZER_PROC: process(clock, reset) is
        variable bomb1      : std_logic_vector(BOMBSIZE - 1 downto 0);
        variable bomb2      : std_logic_vector(BOMBSIZE - 1 downto 0);
        variable bomb3      : std_logic_vector(BOMBSIZE - 1 downto 0);
        
        variable bomb2Clock : std_logic;
        variable bomb3Clock : std_logic;
        variable bomb2Count : integer range 0 to 2;
        variable bomb3Count : integer range 0 to 3;
        
    begin
        if (reset = ACTIVE) then
            bombLocation    <= (others => '0');
            bomb1           := (others => '0');
            bomb2           := (others => '0');
            bomb3           := (others => '0');
            bomb2Clock      := not ACTIVE;
            bomb3Clock      := not ACTIVE;
            bomb2Count      := 0;
            bomb3Count      := 0;

        elsif (rising_edge(clock)) then
            if (gamePlayMode = ACTIVE) then
                -- Call counting procedures for bomb2 and bomb3
                bomb2Counter(bomb2Count, bomb2Clock);
                bomb3Counter(bomb3Count, bomb3Clock);

                bomb1 := std_logic_vector(unsigned(bomb1) + 1);
                if (bomb2Clock = ACTIVE) then
                    bomb2 := std_logic_vector(unsigned(bomb2) - 1);
                end if;
                if (bomb3Clock = ACTIVE) then
                    bomb3 := std_logic_vector(unsigned(bomb3) + 1);
                end if;

                if (moveDet = ACTIVE) then
                    bombLocation <= collisionDetect(bomb1, bomb2, bomb3);
                end if;
            end if;
        end if;
    end process RANDOMIZER_PROC;

end architecture Randomizer_ARCH;
