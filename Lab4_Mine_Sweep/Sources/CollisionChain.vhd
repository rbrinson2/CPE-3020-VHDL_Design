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
    
    
    signal bomb2Local : std_logic_vector(BOMBSIZE - 1 downto 0);
    signal bomb3Local : std_logic_vector(BOMBSIZE - 1 downto 0);
    

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
        bomb1Temp := to_integer(unsigned(bomb1(3 downto 0)));
        bomb2Temp := to_integer(unsigned(bomb2(3 downto 0)));
        bomb3Temp := to_integer(unsigned(bomb3(3 downto 0)));
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
        report "Bomb 2 Final = " & integer'image(to_integer(unsigned(bomb2Final(3 downto 0))));
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
        bomb1Temp := to_integer(unsigned(bomb1(3 downto 0)));
        bomb2Temp := to_integer(unsigned(bomb2(3 downto 0)));
        bomb3Temp := to_integer(unsigned(bomb3(3 downto 0)));
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
        report "Bomb 3 Final = " & integer'image(to_integer(unsigned(bomb3Final(3 downto 0))));
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

            mask(bomb1Pos) := ACTIVE;
            if (bomb1Temp(4) = DOUBLE and bomb1Pos /= 0) then
                mask(bomb1Pos - 1) := ACTIVE;
            end if;
            mask(bomb2Pos) := ACTIVE;
            if (bomb2Local(4) = DOUBLE and bomb2Pos /= 0) then
                mask(bomb2Pos - 1) := ACTIVE;
            end if;
            mask(bomb3Pos) := ACTIVE;
            if (bomb3Local(4) = DOUBLE and bomb3Pos /= 0) then
                mask(bomb3Pos - 1) := ACTIVE;
            end if;

            finalBombLocations <= mask;
        end if;
    end process COLLISIONCHAINFINAL;
    
    
end architecture CollisionChain_ARCH;
