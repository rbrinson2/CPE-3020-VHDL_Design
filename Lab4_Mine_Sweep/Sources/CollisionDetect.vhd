library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CollisionDetect is
    port(
        clock : in std_logic;
        reset : in std_logic
    );
end entity CollisionDetect;

architecture CollisionDetect_ARCH of CollisionDetect is
    constant DOUBLEWIDTH : integer := 1;
    constant SINGLEWIDTH : integer := 0;
    
    procedure collisionDetect (
        bomb1 : inout std_logic_vector(4 downto 0);
        bomb2 : inout std_logic_vector(4 downto 0);
        bomb3 : inout std_logic_vector(4 downto 0)
    ) 
    is
        variable bomb1Width : integer range 0 to 1;
        variable bomb2Width : integer range 0 to 1;
        variable bomb3Width : integer range 0 to 1;
        variable bomb1Pos : integer range 0 to 15;
        variable bomb2Pos : integer range 0 to 15;
        variable bomb3Pos : integer range 0 to 15;
    begin
        bomb1Width  := to_integer(unsigned(bomb1(4)));
        bomb2Width  := to_integer(unsigned(bomb2(4)));
        bomb3Width  := to_integer(unsigned(bomb3(4)));
        bomb1Pos    := to_integer(unsigned(bomb1(3 downto 0)));
        bomb2Pos    := to_integer(unsigned(bomb2(3 downto 0)));
        bomb3Pos    := to_integer(unsigned(bomb3(3 downto 0)));
        if (bomb1Width = DOUBLEWIDTH) then
            if ((bomb1Pos = bomb2Pos) or (bomb1Pos + 1 = bomb2Pos)) then  
                bomb1Pos := bomb1Pos - 3;
                bomb1(3 downto 0) := std_logic_vector(to_unsigned(bomb1Pos, 4));
            end if;
            if ((bomb1Pos = bomb3Pos) or (bomb1Pos + 1 = bomb3Pos)) then  
                bomb1Pos := bomb1Pos - 3;
                bomb1(3 downto 0) := std_logic_vector(to_unsigned(bomb1Pos, 4));
            end if;
        end if;
    end procedure;
begin
    
end architecture CollisionDetect_ARCH;
