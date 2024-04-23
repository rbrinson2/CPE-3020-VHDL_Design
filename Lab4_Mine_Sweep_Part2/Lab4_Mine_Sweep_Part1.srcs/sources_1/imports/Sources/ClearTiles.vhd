

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
    signal mask1 : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal mask2 : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal mask3 : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal mask4 : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
begin


    MASK1_GEN : process (finalBombLocations) is
        variable mask1Temp : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable mask1Flag : integer range 0 to 1;
    begin
        for i in finalBombLocations'range loop
            if (mask1Flag = FLAGGED) then
                mask1Temp(i) := '0';
            elsif (finalBombLocations(i) = '0') then
                mask1Temp(i) := '1';
            elsif (
                finalBombLocations(i) = '1'
                and mask1Flag = NOTFLAGGED
            ) then
                mask1Temp(i) := '0';
                mask1Flag := FLAGGED;
            end if;
        end loop;

        mask1 <= mask1Temp;
    end process MASK1_GEN;

    MASK2_GEN : process(finalBombLocations) is
    begin
        
    end process MASK2_GEN;
    
    
    
end architecture ClearTiles_ARCH;
