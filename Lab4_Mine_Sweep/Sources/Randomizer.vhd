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


use work.MineSweepPackage.all;
use work.physical_io_package.all;

--Randomizer============================================================ Entity
entity Randomizer is
    port(
        ----------------------------------------------------------- Input Ports
        clock           : in std_logic;
        reset           : in std_logic;
        moveDet         : in std_logic;
        gamePlayMode    : in std_logic;
        
        ---------------------------------------------------------- Output Ports
        bombLocation    : out std_logic_vector (BOMBBUSWIDTH - 1 downto 0)
    );
end entity Randomizer;

--Randomizer-Architecture========================================= Architecture
architecture Randomizer_ARCH of Randomizer is
    ----------------------------------------------------------------- Constants
    constant ACTIVE     : std_logic := '1';
    constant DOUBLE     : std_logic := '1';
    
    
    ------------------------------------------------------------------- Signals
    signal moveDetEdge          : std_logic;
    signal bomb1                : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb2                : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb3                : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb1Temp            : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb2Temp            : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal interBombLocations   : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal finalBombLocations   : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
     
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
    
    --Bomb-1-Collision-Test------------------------------------------- Function
    function bomb1CollDet(
        bomb1 : std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb2 : std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb3 : std_logic_vector(BOMBSIZE - 1 downto 0)

    ) 
    return std_logic_vector
    is
        variable displace  : integer range -15 to 15;
        variable bomb1Temp : integer range 0 to 15;
        variable bomb2Temp : integer range 0 to 15;
        variable bomb3Temp : integer range 0 to 15;
        variable bomb1Final : std_logic_vector(BOMBSIZE - 1 downto 0);
    begin
        bomb1Temp := to_integer(unsigned(bomb1(3 downto 0)));
        bomb2Temp := to_integer(unsigned(bomb2(3 downto 0)));
        bomb3Temp := to_integer(unsigned(bomb3(3 downto 0)));
        if (bomb1(4) = DOUBLE) then
            if (
                -- Check to see if bomb 2 is in exclusion zone
                bomb2Temp < bomb1Temp + 2
                and bomb2Temp > bomb1Temp - 3
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb2Temp - bomb1Temp - 3;
                if (displace < 0) then
                    displace := 0;
                end if;
                bomb1Temp := bomb1Temp + displace;
            end if;
            if (
                -- Check to see if bomb 3 is in exclusion zone
                bomb3Temp < bomb1Temp + 2
                and bomb3Temp > bomb1Temp - 3
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb3Temp - bomb1Temp - 3;
                if (displace < 0) then
                    displace := 0;
                end if;
                bomb1Temp := bomb1Temp + displace;
            end if;
            if (
                -- Check to see if bomb 2 is in exclusion zone
                bomb2Temp < bomb1Temp + 2
                and bomb2Temp > bomb1Temp - 3
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb2Temp - bomb1Temp - 3;
                if (displace < 0) then
                    displace := 0;
                end if;
                bomb1Temp := bomb1Temp + displace;
            end if;
        
        else 
            if (
                -- Check to see if bomb 2 is in exclusion zone
                bomb2Temp < bomb1Temp + 2
                and bomb2Temp > bomb1Temp - 2
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb2Temp - bomb1Temp - 3;
                if (displace < 0) then
                    displace := 0;
                end if;
                bomb1Temp := bomb1Temp + displace;
            end if;
            if (
                -- Check to see if bomb 3 is in exclusion zone
                bomb3Temp < bomb1Temp + 2
                and bomb3Temp > bomb1Temp - 2
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace := bomb3Temp - bomb1Temp - 2;
                if (displace < 0) then
                    displace := 0;
                end if;
                bomb1Temp := bomb1Temp + displace;
            end if;
            if (
                -- Check to see if bomb 2 is in exclusion zone
                bomb2Temp < bomb1Temp + 2
                and bomb2Temp > bomb1Temp - 2
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb2Temp - bomb1Temp - 2;
                if (displace < 0) then
                    displace := 0;
                end if;
                bomb1Temp := bomb1Temp + displace;
            end if;
        end if;

        bomb1Final := bomb1(4) & std_logic_vector(to_unsigned(bomb1Temp, 4));
        return bomb1Final;
    end function bomb1CollDet;
    
begin

    
    
    FINAL: process(clock, reset)
    begin
        if (reset = ACTIVE) then
            bombLocation <= (others => '0'); 
        elsif (rising_edge(clock) )then
            if (moveDet = ACTIVE) then
                bombLocation <= finalBombLocations;
            end if;
        end if;
    end process FINAL;


    MOVELEVELDET : entity work.LevelDetector
        port map(
            reset    => reset,
            clock    => clock,
            trigger  => moveDet,
            pulseOut => moveDetEdge
        );

    
    --Collision-Chain-Part-1------------------------------------------- Process
    COLLISIONCHAIN1 : process (clock, reset) is
        variable bomb1Local : std_logic_vector(BOMBSIZE - 1 downto 0);
        variable bomb2Local : std_logic_vector(BOMBSIZE - 1 downto 0);
        variable bomb3Local : std_logic_vector(BOMBSIZE - 1 downto 0);
    begin
        if reset = ACTIVE then
            interBombLocations <= (others => '0'); 
            bomb1Local := (others => '0'); 
            bomb2Local := (others => '0'); 
            bomb3Local := (others => '0'); 
        elsif rising_edge(clock) then
            if (moveDetEdge = ACTIVE) then
                bomb1Local := bomb1;
                bomb2Local := bomb2;
                bomb3Local := bomb3;
            end if;
        end if;
    end process COLLISIONCHAIN1;

    --Collision-Chain-Part-2------------------------------------------- Process
    COLLISIONCHAIN2 : process (clock, reset) is
    begin
        if reset = ACTIVE then
            finalBombLocations <= (others => '0'); 
        elsif rising_edge(clock) then
            finalBombLocations <= interBombLocations;
        end if;
    end process COLLISIONCHAIN2;

    
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
            if (gamePlayMode = ACTIVE) then
                -- Call counting procedures for bomb2 and bomb3
                bomb2Counter(bomb2Count, bomb2Clock);
                bomb3Counter(bomb3Count, bomb3Clock);

                bomb1 <= bomb1CollDet(
                    std_logic_vector(unsigned(bomb1) + 1), 
                    bomb2, 
                    bomb3
                );

                if (bomb2Clock = ACTIVE) then
                    bomb2 <= std_logic_vector(unsigned(bomb2) - 1);
                end if;
                if (bomb3Clock = ACTIVE) then
                    bomb3 <= std_logic_vector(unsigned(bomb3) + 1);
                end if;
            end if;
        end if;
    end process RANDOMIZER_PROC;

end architecture Randomizer_ARCH;
