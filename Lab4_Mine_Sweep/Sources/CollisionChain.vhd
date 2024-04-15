---------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 04/15/2024 
-- Design Name: Collision Chain
-- Lab Name: Lab 4 - Mine Sweep
-- Target Devices: Basys 3
-- 
-- Description: 
-- 
-- Uses a left, right, left model to detect collisions for bomb
-- 2 and 3. Take bomb 2 as an example. It first checks if there
-- is a collision with bomb 1, then checks for bomb 3, and then
-- checks for bomb 1 again. This way if bomb 2 moves after 
-- colliding with bomb 3, it can check again for a collision.
-- These collision checks are then chained together going from
-- and input to the module to the final ouput so that timing
-- violations can be avoided.
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

--====================================================================== ENTITY
entity CollisionChain is
    port(
        ----------------------------------------------------------- Input Ports
        clock       : in std_logic;
        reset       : in std_logic;
        bomb1Temp   : in std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb2Temp   : in std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb3Temp   : in std_logic_vector(BOMBSIZE - 1 downto 0);

        ---------------------------------------------------------- Output Ports
        finalBombLocations : out std_logic_vector(BOMBBUSWIDTH - 1 downto 0)
    );
end entity CollisionChain;

--================================================================ ARCHITECTURE
architecture CollisionChain_ARCH of CollisionChain is
    
    ------------------------------------------------------------------- Signals
    signal bomb2Local : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb3Local : std_logic_vector(BOMBSIZE - 1 downto 0);
    

    --Bomb-2-Collision-Test------------------------------------------- Function
    -- Uses the left, right, left model to detect collisions.
    -- Done by checking if there is another bomb within a range
    -- depending on the width of the bomb. If there is a bomb
    -- in that range, it moves. It then checks the other and 
    -- then the first. 
    function bomb2CollDet(
        bomb1 : std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb2 : std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb3 : std_logic_vector(BOMBSIZE - 1 downto 0)

    ) 
    return std_logic_vector
    is
        variable displace  : integer range 0 to 20;
        variable bomb1Temp : integer range 0 to 20;
        variable bomb2Temp : integer range 0 to 20;
        variable bomb3Temp : integer range 0 to 20;
        variable bomb2Final : std_logic_vector(BOMBSIZE - 1 downto 0);
    begin
        bomb1Temp := to_integer(unsigned(bomb1(3 downto 0)));
        bomb2Temp := to_integer(unsigned(bomb2(3 downto 0)));
        bomb3Temp := to_integer(unsigned(bomb3(3 downto 0)));
        if (bomb2(4) = DOUBLE) then
            -- Check left
            if (
                bomb1Temp < bomb2Temp + 2
                and bomb1Temp > bomb2Temp - 3
            ) then
                displace  := bomb1Temp - (bomb2Temp - 3);
                bomb2Temp := bomb2Temp + displace;
            end if;
            -- Check right
            if (
                bomb3Temp < bomb2Temp + 2
                and bomb3Temp > bomb2Temp - 3
            ) then  
                displace  := bomb3Temp - (bomb2Temp - 3);
                bomb2Temp := bomb2Temp + displace;
            end if;
            -- Check left
            if (     
                bomb1Temp < bomb2Temp + 2
                and bomb1Temp > bomb2Temp - 3
            ) then
                displace  := bomb1Temp - (bomb2Temp - 3);
                bomb2Temp := bomb2Temp + displace;
            end if;
        
        else 
            -- Check left
            if (
                bomb1Temp < bomb2Temp + 2
                and bomb1Temp > bomb2Temp - 2
            ) then
                displace  := bomb1Temp - (bomb2Temp - 2);
                bomb2Temp := bomb2Temp + displace;
            end if;
            -- Check right
            if (
                bomb3Temp < bomb2Temp + 2
                and bomb3Temp > bomb2Temp - 2
            ) then
                displace  := bomb3Temp - (bomb2Temp - 2);
                bomb2Temp := bomb2Temp + displace;
            end if;
            -- Check left
            if ( 
                bomb1Temp < bomb2Temp + 2
                and bomb1Temp > bomb2Temp - 2
            ) then
                displace  := bomb1Temp - (bomb2Temp - 2);
                bomb2Temp := bomb2Temp + displace;
            end if;
        end if;

        bomb2Final := bomb2(4) & std_logic_vector(to_unsigned(bomb2Temp, 4));
        report "Bomb 2 Final = " & integer'image(to_integer(unsigned(bomb2Final(3 downto 0))));
        return bomb2Final;
    end function bomb2CollDet;

    --Bomb-3-Collision-Test------------------------------------------- Function
    -- Uses the left, right, left model to detect collisions.
    -- Done by checking if there is another bomb within a range
    -- depending on the width of the bomb. If there is a bomb
    -- in that range, it moves. It then checks the other and 
    -- then the first. 
    function bomb3CollDet(
        bomb1 : std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb2 : std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb3 : std_logic_vector(BOMBSIZE - 1 downto 0)

    ) 
    return std_logic_vector
    is
        variable displace  : integer range 0 to 20;
        variable bomb1Temp : integer range 0 to 20;
        variable bomb2Temp : integer range 0 to 20;
        variable bomb3Temp : integer range 0 to 20;
        variable bomb3Final : std_logic_vector(BOMBSIZE - 1 downto 0);
    begin
        bomb1Temp := to_integer(unsigned(bomb1(3 downto 0)));
        bomb2Temp := to_integer(unsigned(bomb2(3 downto 0)));
        bomb3Temp := to_integer(unsigned(bomb3(3 downto 0)));
        if (bomb3(4) = DOUBLE) then
            -- Check left
            if (
                bomb1Temp < bomb3Temp + 2
                and bomb1Temp > bomb3Temp - 3
            ) then
                displace  := bomb1Temp - (bomb3Temp - 3);
                bomb3Temp := bomb3Temp + displace;
            end if;
            -- Check right
            if (
                bomb2Temp < bomb3Temp + 2
                and bomb2Temp > bomb3Temp - 3
            ) then
                displace  := bomb2Temp - (bomb3Temp - 3);
                bomb3Temp := bomb3Temp + displace;
            end if;
            -- Check left
            if (
                bomb1Temp < bomb3Temp + 2
                and bomb1Temp > bomb3Temp - 3
            ) then

                displace  := bomb3Temp - (bomb3Temp - 3);
                bomb3Temp := bomb3Temp + displace;
            end if;
        
        else 
            -- Check left
            if (
                bomb1Temp < bomb3Temp + 2
                and bomb1Temp > bomb3Temp - 2
            ) then
                displace  := bomb1Temp - (bomb3Temp - 2);
                bomb3Temp := bomb3Temp + displace;
            end if;
            -- Check right
            if (
                bomb2Temp < bomb3Temp + 2
                and bomb2Temp > bomb3Temp - 2
            ) then
                displace  := bomb2Temp - (bomb3Temp - 2);
                bomb3Temp := bomb3Temp + displace;
            end if;
            -- Check left
            if (
                bomb1Temp < bomb3Temp + 2
                and bomb1Temp > bomb3Temp - 2
            ) then
                displace  := bomb1Temp - (bomb3Temp - 2);
                bomb3Temp := bomb3Temp + displace;
            end if;
        end if;

        bomb3Final := bomb3(4) & std_logic_vector(to_unsigned(bomb3Temp, 4));
        report "Bomb 3 Final = " & integer'image(to_integer(unsigned(bomb3Final(3 downto 0))));
        return bomb3Final;
    end function bomb3CollDet;
    
begin
    ---------------------------------------------------------------- ARCH-BEGIN
    
    --Collision-Chain-Part-1------------------------------------------- Process
    -- First chain does collision detection on bomb 2
    COLLISIONCHAIN1 : process (clock, reset) is
    begin
        if reset = ACTIVE then
            bomb2Local <= (others => '0'); 
        elsif rising_edge(clock) then
            bomb2Local <= bomb2CollDet(bomb1Temp, bomb2Temp, bomb3Temp);
        end if;
    end process COLLISIONCHAIN1;

    --Collision-Chain-Part-2------------------------------------------- Process
    -- Second chain does collision detection on bomb 3
    COLLISIONCHAIN2 : process (clock, reset) is
        
    begin
        if reset = ACTIVE then 
            bomb3Local <= (others => '0'); 
        elsif rising_edge(clock) then
            bomb3Local <= bomb3CollDet(bomb1Temp, bomb2Local, bomb3Temp);
        end if;
    end process COLLISIONCHAIN2;
    
    --Collision-Chain-Final-------------------------------------------- Process
    -- Final chain assigns the relative locations to the mask
    -- depending on position and width of each bomb.
    -- The final composite mask is then assigned to the 
    -- finalBombLocation signal.
    COLLISIONCHAINFINAL : process (clock, reset) is
        variable mask : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable bomb1Pos : integer range 0 to 15;
        variable bomb2Pos : integer range 0 to 15;
        variable bomb3Pos : integer range 0 to 15;
    begin
        if reset = '1' then
            mask := ZERO;
            finalBombLocations <= (others => '0'); 
        elsif rising_edge(clock) then
            mask := ZERO;
            bomb1Pos := to_integer(unsigned(bomb1Temp(3 downto 0)));
            bomb2Pos := to_integer(unsigned(bomb2Local(3 downto 0)));
            bomb3Pos := to_integer(unsigned(bomb3Local(3 downto 0)));

            -- Set position of bomb 1
            mask(bomb1Pos) := ACTIVE;
            if (bomb1Temp(4) = DOUBLE and bomb1Pos /= 0) then
                mask(bomb1Pos - 1) := ACTIVE;
            end if;

            -- Set position of bomb 2
            mask(bomb2Pos) := ACTIVE;
            if (bomb2Local(4) = DOUBLE and bomb2Pos /= 0) then
                mask(bomb2Pos - 1) := ACTIVE;
            end if;

            -- Set position of bomb 3
            mask(bomb3Pos) := ACTIVE;
            if (bomb3Local(4) = DOUBLE and bomb3Pos /= 0) then
                mask(bomb3Pos - 1) := ACTIVE;
            end if;

            finalBombLocations <= mask;
        end if;
    end process COLLISIONCHAINFINAL;
    
    
end architecture CollisionChain_ARCH;
