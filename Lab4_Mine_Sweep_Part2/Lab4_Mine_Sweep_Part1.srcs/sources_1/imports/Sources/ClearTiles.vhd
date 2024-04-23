

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
        clearTilesMask      : out std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        hitDet              : out std_logic

    );
end entity ClearTiles;

--Clear-Tiles===================================================== Architecture
architecture ClearTiles_ARCH of ClearTiles is
    signal newMove : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
begin
    PLAYER_EDGE : for i in playerMoveSync'range generate
        LEVEL_DETECT : entity work.LevelDetector
            port map(
                reset    => reset,
                clock    => clock,
                trigger  => playerMoveSync(i),
                pulseOut => newMove(i)
            );
    end generate PLAYER_EDGE;
    
    HIT_SCAN : process (clock, reset) is
        variable clearTemp : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable j : integer range 0 to 16;
    begin
        if (reset = ACTIVE) then
            hitDet <= not ACTIVE;
            clearTemp := (others => '0'); 
            j := 0;
        elsif rising_edge(clock) then
            for i in finalBombLocations'reverse_range loop
                if (finalBombLocations(i) = '1' and newMove(i) = '1') then
                    hitDet <= ACTIVE;
                elsif (newMove(i) = '1') then
                    j := i;
                    while (finalBombLocations(j) /= '1') loop
                        clearTemp(j) := '1';
                        if (j = 15) then
                            exit;
                        end if;
                        j := j + 1;
                    end loop;
                    j := i;
                    while (finalBombLocations(j) /= '1') loop
                        clearTemp(j) := '1';
                        if (j = 0) then
                            exit;
                        end if;
                        j := j - 1;
                    end loop;
                end if;
            end loop;
        end if;

        clearTilesMask <= clearTemp;
    end process HIT_SCAN;
    
    
    
end architecture ClearTiles_ARCH;
