

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TileDriver is
    port(
        clock : in std_logic;
        reset : in std_logic;
        bombLocations : in std_logic_vector(14 downto 0);

        tiles : out std_logic_vector(15 downto 0)
    );
end entity TileDriver;

architecture TileDriver_ARCH of TileDriver is
    --Tile-Shaper----------------------------------------------------- Function    
    function tileShaper(width : std_logic) return std_logic_vector is
        constant DOUBLEWIDE : std_logic := '1';
        constant SINGLEWIDE : std_logic := '0';
        variable tile : std_logic_vector(1 downto 0);
    begin
        if (width = DOUBLEWIDE) then
            tile := "11";
        elsif (width = SINGLEWIDE) then
            tile := "01";
        end if;
        return tile;
    end function tileShaper;

        
begin
  
    

    process (clock, reset) is
        variable tempTiles  : std_logic_vector(15 downto 0);
        variable tile1Shape : std_logic_vector(1 downto 0);
        variable tile2Shape : std_logic_vector(1 downto 0);
        variable tile3Shape : std_logic_vector(1 downto 0);
        variable bomb1Pos : integer range 0 to 15;
        variable bomb2Pos : integer range 0 to 15;
        variable bomb3Pos : integer range 0 to 15;
         
    begin
        if (reset = '1') then
            tiles <= (others => '0');  
            tile1Shape := "00";
            tile2Shape := "00";
            tile3Shape := "00";
            bomb1Pos := 0;
            bomb2Pos := 0;
            bomb3Pos := 0;
        elsif (rising_edge(clock)) then
            bomb1Pos := to_integer(unsigned(bombLocations(13 downto 10)));
            bomb2Pos := to_integer(unsigned(bombLocations(8 downto 5)));
            bomb3Pos := to_integer(unsigned(bombLocations(3 downto 0)));
            tile1Shape := tileShaper(bombLocations(14)); 
            tile2Shape := tileShaper(bombLocations(9)); 
            tile3Shape := tileShaper(bombLocations(4)); 
            tempTiles := (others => '0'); 
            for tile in 0 to (tempTiles'high - 1) loop
                if (tile = bomb1Pos) then
                    tempTiles(tile + 1 downto tile) := tile1Shape;
                end if;
                if (tile = bomb2Pos) then
                    tempTiles(tile + 1 downto tile) := tile2Shape;
                end if;
                if (tile = bomb3Pos) then
                    tempTiles(tile + 1 downto tile) := tile3Shape;
                end if;
            end loop;

            tiles <= tempTiles;
        end if;
    end process;
end architecture TileDriver_ARCH;
