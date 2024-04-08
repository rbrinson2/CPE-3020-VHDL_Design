library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.physical_io_package.all;

--====================================================================== ENTITY
entity MineSweep is
    port(
        --------- Inputs
        clock       : in std_logic;
        reset       : in std_logic;
        playerMove  : in std_logic_vector(15 downto 0);

        ---------- Outputs
        tiles       : out std_logic_vector(15 downto 0)
    );
end entity MineSweep;

--================================================================ ARCHITECTURE
architecture MineSweep_ARCH of MineSweep is

    ---------- Signals
    signal bombLocation     : std_logic_vector(14 downto 0);
    signal gamePlayMode     : std_logic;    
    signal startEn          : std_logic;
begin
    

    
    --Randomizer------------------------------------------------------- Instant 
    RANDOMIZER : entity work.Randomizer
        port map(
            clock        => clock,
            reset        => reset,
            startEn      => startEn,
            gamePlayMode => gamePlayMode,
            bombLocation => bombLocation
        );
    
    --Move-Detect------------------------------------------------------ Instant 
    MoveDetect_inst : entity work.MoveDetect
        port map(
            clock          => clock,
            reset          => reset,
            playerMoveSync => playerMove,
            gamePlayMode   => gamePlayMode,
            startEn        => startEn
        );
    
    --Tile-Driver------------------------------------------------------ Instant
    TileDriver_inst : entity work.TileDriver
        port map(
            clock         => clock,
            reset         => reset,
            bombLocations => bombLocation,
            tiles         => tiles
        );
    

    
end architecture MineSweep_ARCH;
