

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

--Clear-Tiles=========================================================== Entity
entity ClearTiles is
    port(
        ----------------------------------------------------------- Input Ports
        clock               : in std_logic;
        reset               : in std_logic;
        playerMoveSync      : in std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        finalBombLocations  : in std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        
        ---------------------------------------------------------- Output Ports
        clearTilesMask      : out std_logic_vector(BOMBBUSWIDTH - 1 downto 0)

    );
end entity ClearTiles;

--Clear-Tiles===================================================== Architecture
architecture ClearTiles_ARCH of ClearTiles is
begin
end architecture ClearTiles_ARCH;
