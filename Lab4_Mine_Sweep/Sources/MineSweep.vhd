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

    ---------- Constants
    constant ACTIVE : std_logic := '1';
    
    ---------- Signals
    signal bombLocation     : std_logic_vector(14 downto 0);
    signal gamePlayMode     : std_logic;    
    signal startEn          : std_logic;
    signal playerMoveSync   : std_logic_vector(15 downto 0);
begin
    

    --Move-Syncronizer----------------------------------------------- Component
    MOVE_SYNC: for i in 0 to 15 generate
        SynchronizerChain_inst: SynchronizerChain
            generic map(
                CHAIN_SIZE => 8
            )
            port map(
                reset   => reset,
                clock   => clock,
                asyncIn => playerMove(i),
                syncOut => playerMoveSync(i)
            );
    end generate;
    
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
            playerMoveSync => playerMoveSync,
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
    

    --Game-Timer------------------------------------------------------- Process
    
     
    
end architecture MineSweep_ARCH;
