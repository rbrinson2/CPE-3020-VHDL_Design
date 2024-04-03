

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Clear-Tiles=========================================================== Entity
entity ClearTiles is
    port(
        ---------- Inputs
        clock           : in std_logic;
        reset           : in std_logic;
        bombLocation    : in std_logic_vector(14 downto 0);
        playerMoveSync  : in std_logic_vector(15 downto 0);

        ---------- Outputs
        bombsCleardEn   : out std_logic;
        bombHitEn       : out std_logic;
        clearTilesEn    : out std_logic;
        clearPositions  : out std_logic_vector(15 downto 0) 
    );
end entity ClearTiles;

--Clear-Tiles===================================================== Architecture
architecture ClearTiles_ARCH of ClearTiles is
    constant ACTIVE : std_logic := '1';
    
    signal bomb1 : std_logic_vector(3 downto 0);
    signal bomb2 : std_logic_vector(3 downto 0);
    signal bomb3 : std_logic_vector(3 downto 0);
    signal bomb1Width : std_logic;
    signal bomb2Width : std_logic;
    signal bomb3Width : std_logic;

    function checkHit(move : std_logic_vector(15 downto 0))
        return std_logic 
    is
        variable hit : std_logic;
    begin
        
        return hit;
    end function checkHit;
    
begin
    bomb1Width <= bombLocation(14);
    bomb2Width <= bombLocation(9);
    bomb3Width <= bombLocation(4);
    bomb1 <= bombLocation(13 downto 10);
    bomb2 <= bombLocation(8 downto 5);
    bomb3 <= bombLocation(3 downto 0);

    CLEARTILESPROC: process(clock, reset)
        
    begin
        if (reset = ACTIVE) then
            bombHitEn <= not ACTIVE;
        elsif (rising_edge(clock)) then
            for i in playerMoveSync'range loop
                if (playerMoveSync(i) = ACTIVE) then
                    if (
                        i = to_integer(unsigned(bomb1))
                        or i = to_integer(unsigned(bomb2))
                        or i = to_integer(unsigned(bomb3))
                        ) then
                        bombHitEn <= ACTIVE;
                    end if;
                end if;
            end loop;
            
        end if;
    end process CLEARTILESPROC;
end architecture ClearTiles_ARCH;
