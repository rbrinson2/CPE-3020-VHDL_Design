

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
        bombCleardEn    : out std_logic;
        bombHitEn       : out std_logic;
        clearTilesEn    : out std_logic;
        clearPositions  : out std_logic_vector(15 downto 0) 
    );
end entity ClearTiles;

--Clear-Tiles===================================================== Architecture
architecture ClearTiles_ARCH of ClearTiles is
    
begin

    
    
end architecture ClearTiles_ARCH;
