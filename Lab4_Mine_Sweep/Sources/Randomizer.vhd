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
    ---------- Constants
    constant ACTIVE : std_logic := '1';
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

    --Collision-Detection-------------------------------------------- Procedure
    -- Determines if two bombs are overlapping
    procedure collisionDetect (
        bomb1 : inout std_logic_vector(4 downto 0);
        bomb2 : inout std_logic_vector(4 downto 0);
        bomb3 : inout std_logic_vector(4 downto 0)
    ) 
    is
        variable bomb1Pos : integer range 0 to 15;
        variable bomb2Pos : integer range 0 to 15;
        variable bomb3Pos : integer range 0 to 15;
    begin
        bomb1Pos    := to_integer(unsigned(bomb1(3 downto 0)));
        bomb2Pos    := to_integer(unsigned(bomb2(3 downto 0)));
        bomb3Pos    := to_integer(unsigned(bomb3(3 downto 0)));

        -- Bomb (1,2) and bomb (1,3) collisions
        -- If doublewide
        if (bomb1(4) = DOUBLEWIDTH) then
            if ((bomb1Pos = bomb2Pos) or (bomb1Pos + 1 = bomb2Pos)) then  
                --report "Collision between bomb1 and bomb2";
                bomb1(3 downto 0) 
                    := std_logic_vector(unsigned(bomb1(3 downto 0)) - 3);
            end if;
            if ((bomb1Pos = bomb3Pos) or (bomb1Pos + 1 = bomb3Pos)) then  
                --report "Collision between bomb1 and bomb3";
                bomb1(3 downto 0) 
                    := std_logic_vector(unsigned(bomb1(3 downto 0)) - 3);
            end if;
        
        -- If singlewide
        elsif (bomb1(4) = SINGLEWIDTH) then 
            if ((bomb1Pos = bomb2Pos)) then  
                --report "Collsion between bomb1 and bomb2";
                bomb1(3 downto 0) 
                    := std_logic_vector(unsigned(bomb1(3 downto 0)) - 2);
            end if;
            if ((bomb1Pos = bomb3Pos)) then  
                --report "Collision between bomb1 and bomb3";
                bomb1(3 downto 0) 
                    :=  std_logic_vector(unsigned(bomb1(3 downto 0)) - 2);
            end if;
        end if;

        -- Bomb (2,3) collisions
        -- If doublewide
        if (bomb2(4) = DOUBLEWIDTH) then
            if ((bomb2Pos = bomb3Pos) or (bomb2Pos + 1 = bomb3Pos)) then
                --report "Collision between bomb2 and bomb3";
                bomb2(3 downto 0) 
                    := std_logic_vector(unsigned(bomb2(3 downto 0)) + 3);
            end if;
            if ((bomb2Pos = bomb1Pos) or (bomb2Pos + 1 = bomb1Pos)) then
                --report "Collision between bomb2 and bomb1";
                bomb2(3 downto 0) 
                    := std_logic_vector(unsigned(bomb2(3 downto 0)) + 3);
            end if;
        
        -- If singlewid
        elsif (bomb2(4) = SINGLEWIDTH) then
            if ((bomb2Pos = bomb3Pos)) then
                --report "Collision between bomb2 and bomb3";
                bomb2(3 downto 0) 
                    := std_logic_vector(unsigned(bomb2(3 downto 0)) + 2);
            end if;
            if ((bomb2Pos = bomb1Pos)) then
                --report "Collision between bomb2 and bomb1";
                bomb2(3 downto 0) 
                    := std_logic_vector(unsigned(bomb2(3 downto 0)) + 2);
            end if;
        end if;
    end procedure;
begin
    --Randomzier-Process----------------------------------------------- Process
    RANDOMIZER_PROC: process(clock, reset) is
        variable bomb1      : std_logic_vector(4 downto 0);
        variable bomb2      : std_logic_vector(4 downto 0);
        variable bomb3      : std_logic_vector(4 downto 0);
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

                -- Increment bomb1 on each clock
                bomb1 := std_logic_vector(unsigned(bomb1) + 1);

                -- Decrement bomb2 on bomb2Clock pulse
                if (bomb2Clock = ACTIVE) then
                    bomb2 := std_logic_vector(unsigned(bomb2) - 1);
                end if;

                -- Increment bomb3 on bomb3Clock pulse
                if (bomb3Clock = ACTIVE) then
                    bomb3 := std_logic_vector(unsigned(bomb3) + 1);
                end if;

                -- If moveDet activates, latch the bomb positions
                if (moveDet = ACTIVE) then
                    collisionDetect(bomb1, bomb2, bomb3);
                    --bombLocation <= bomb1 & bomb2 & bomb3;
                    bombLocation <= (others => '1'); 
                end if;
            end if;
        end if;
    end process RANDOMIZER_PROC;

end architecture Randomizer_ARCH;
