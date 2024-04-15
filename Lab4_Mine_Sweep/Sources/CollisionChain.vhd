library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

entity CollisionChain is
    port(
        clock : in std_logic;
        reset : in std_logic;
        bomb1Temp : in std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb2Temp : in std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb3Temp : in std_logic_vector(BOMBSIZE - 1 downto 0);
        finalBombLocations : out std_logic_vector(BOMBBUSWIDTH - 1 downto 0)
    );
end entity CollisionChain;


architecture CollisionChain_ARCH of CollisionChain is
    constant ACTIVE : std_logic := '1';
    constant DOUBLE : std_logic := '1';
    constant ZERO : std_logic_vector(BOMBBUSWIDTH - 1 downto 0) := (others => '0') ;
    constant ONES : std_logic_vector(BOMBBUSWIDTH - 1 downto 0) := (others => '1') ;
    
    
    signal bomb2Local : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb3Local : std_logic_vector(BOMBSIZE - 1 downto 0);
    
    --Binary-To-Onehot------------------------------------------------ Function
    function bin2Hot(bomb : std_logic_vector(BOMBSIZE - 1 downto 0))
        return std_logic_vector 
    is
        variable oneHot : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable position : integer range 0 to 15;
        
    begin
        position := to_integer(unsigned(bomb(3 downto 0)));
        for i in oneHot'range loop
            if (i = position) then
                oneHot(i) := ACTIVE;
                if (bomb(4) = ACTIVE) then
                    if (position /= 0) then
                        oneHot(i - 1) := ACTIVE;
                    end if;
                end if;
            end if;
        end loop;
        
        return oneHot;
    end function bin2Hot;

    --Bomb-2-Collision-Test------------------------------------------- Function
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
        bomb1Temp := to_integer(unsigned(bomb1(3 downto 0)) + 4);
        bomb2Temp := to_integer(unsigned(bomb2(3 downto 0)) + 4);
        bomb3Temp := to_integer(unsigned(bomb3(3 downto 0)) + 4);
        if (bomb2(4) = DOUBLE) then
            if (
                -- Check to see if bomb 2 is in exclusion zone
                bomb1Temp < bomb2Temp + 2
                and bomb1Temp > bomb2Temp - 3
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb1Temp - (bomb2Temp - 3);
                bomb2Temp := bomb2Temp + displace;
            end if;
            if (
                -- Check to see if bomb 3 is in exclusion zone
                bomb3Temp < bomb2Temp + 2
                and bomb3Temp > bomb2Temp - 3
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb3Temp - (bomb2Temp - 3);
                bomb2Temp := bomb2Temp + displace;
            end if;
            if (
                -- Check to see if bomb 2 is in exclusion zone
                bomb1Temp < bomb2Temp + 2
                and bomb1Temp > bomb2Temp - 3
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb1Temp - (bomb2Temp - 3);
                bomb2Temp := bomb2Temp + displace;
            end if;
        
        else 
            if (
                -- Check to see if bomb 2 is in exclusion zone
                bomb1Temp < bomb2Temp + 2
                and bomb1Temp > bomb2Temp - 2
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb1Temp - (bomb2Temp - 2);
                bomb2Temp := bomb2Temp + displace;
            end if;
            if (
                -- Check to see if bomb 3 is in exclusion zone
                bomb3Temp < bomb2Temp + 2
                and bomb3Temp > bomb2Temp - 2
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb3Temp - (bomb2Temp - 2);
                bomb2Temp := bomb2Temp + displace;
            end if;
            if (
                -- Check to see if bomb 2 is in exclusion zone
                bomb1Temp < bomb2Temp + 2
                and bomb1Temp > bomb2Temp - 2
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb1Temp - (bomb2Temp - 2);
                bomb2Temp := bomb2Temp + displace;
            end if;
        end if;

        bomb2Final := bomb2(4) & std_logic_vector(to_unsigned(bomb2Temp, 4));
        return bomb2Final;
    end function bomb2CollDet;

    --Bomb-3-Collision-Test------------------------------------------- Function
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
        bomb1Temp := to_integer(unsigned(bomb1(3 downto 0)) + 4);
        bomb2Temp := to_integer(unsigned(bomb2(3 downto 0)) + 4);
        bomb3Temp := to_integer(unsigned(bomb3(3 downto 0)) + 4);
        if (bomb3(4) = DOUBLE) then
            if (
                -- Check to see if bomb 2 is in exclusion zone
                bomb1Temp < bomb3Temp + 2
                and bomb1Temp > bomb3Temp - 3
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb1Temp - (bomb3Temp - 3);
                bomb3Temp := bomb3Temp + displace;
            end if;
            if (
                -- Check to see if bomb 3 is in exclusion zone
                bomb2Temp < bomb3Temp + 2
                and bomb2Temp > bomb3Temp - 3
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb2Temp - (bomb3Temp - 3);
                bomb3Temp := bomb3Temp + displace;
            end if;
            if (
                -- Check to see if bomb 2 is in exclusion zone
                bomb1Temp < bomb3Temp + 2
                and bomb1Temp > bomb3Temp - 3
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb3Temp - (bomb3Temp - 3);
                bomb3Temp := bomb3Temp + displace;
            end if;
        
        else 
            if (
                -- Check to see if bomb 2 is in exclusion zone
                bomb1Temp < bomb3Temp + 2
                and bomb1Temp > bomb3Temp - 2
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb1Temp - (bomb3Temp - 2);
                bomb3Temp := bomb3Temp + displace;
            end if;
            if (
                -- Check to see if bomb 3 is in exclusion zone
                bomb2Temp < bomb3Temp + 2
                and bomb2Temp > bomb3Temp - 2
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb2Temp - (bomb3Temp - 2);
                bomb3Temp := bomb3Temp + displace;
            end if;
            if (
                -- Check to see if bomb 2 is in exclusion zone
                bomb1Temp < bomb3Temp + 2
                and bomb1Temp > bomb3Temp - 2
            ) then
                -- Temp is the value you need to add to bomb1 to move
                -- it far enough away from bomb2
                displace  := bomb1Temp - (bomb3Temp - 2);
                bomb3Temp := bomb3Temp + displace;
            end if;
        end if;

        bomb3Final := bomb3(4) & std_logic_vector(to_unsigned(bomb3Temp, 4));
        return bomb3Final;
    end function bomb3CollDet;
    
begin
    
    --Collision-Chain-Part-1------------------------------------------- Process
    COLLISIONCHAIN1 : process (clock, reset) is
    begin
        if reset = ACTIVE then
            bomb2Local <= (others => '0'); 
        elsif rising_edge(clock) then
            bomb2Local <= bomb2CollDet(bomb1Temp, bomb2Temp, bomb3Temp);
        end if;
    end process COLLISIONCHAIN1;

    --Collision-Chain-Part-2------------------------------------------- Process
    COLLISIONCHAIN2 : process (clock, reset) is
        
    begin
        if reset = ACTIVE then 
            bomb3Local <= (others => '0'); 
        elsif rising_edge(clock) then
            bomb3Local <= bomb3CollDet(bomb1Temp, bomb2Local, bomb3Temp);
        end if;
    end process COLLISIONCHAIN2;
    
    COLLISIONCHAINFINAL : process (clock, reset) is
        variable mask : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    begin
        if reset = '1' then
            mask := ZERO;
            finalBombLocations <= (others => '0'); 
        elsif rising_edge(clock) then
            mask := ZERO;
            mask := ONES and (bin2Hot(bomb1Temp) or bin2Hot(bomb2Local) or bin2Hot(bomb3Local));

            finalBombLocations <= mask;
        end if;
    end process COLLISIONCHAINFINAL;
    
    
end architecture CollisionChain_ARCH;
