
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

--====================================================================== ENTITY
entity ClearTiles_TB is
end entity ClearTiles_TB;

--================================================================ ARCHITECTURE
architecture ClearTiles_TB_ARCH of ClearTiles_TB is
    type StimArray_t is array (natural range <>) of std_logic_vector(BOMBBUSWIDTH - 1 downto 0);   
    constant stim : StimArray_t := (
        ---------PlayerMoveSync----------
        "0000" & "0000" & "0000" & "0000",
        "0000" & "0000" & "0000" & "0001",
        "0100" & "0000" & "0000" & "0001",
        "0100" & "0010" & "0000" & "0001",
        "0100" & "0011" & "0000" & "0001",
        "0100" & "0011" & "0000" & "1001",
        "0100" & "0011" & "0100" & "0001"
    );
    

    signal clock               : std_logic := '0';
    signal reset               : std_logic := '1'; 
    signal playerMoveSync      : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal finalBombLocations  : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal gamePlayMode        : std_logic := '0';
    signal clearTilesMask      : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);

begin

    clock <= not clock after 10 ns;
    reset <= not ACTIVE after 40 ns;
    gamePlayMode <= ACTIVE after 400 ns;
    finalBombLocations <= "0001" & "1000" & "1100" & "0010" when reset = not ACTIVE else X"0000";
    
    DUT : entity work.ClearTiles
        port map(
            clock              => clock,
            reset              => reset,
            playerMoveSync     => playerMoveSync,
            finalBombLocations => finalBombLocations,
            gamePlayMode       => gamePlayMode,
            clearTilesMask     => clearTilesMask
        );
    
    STIMULUS : process (clock, reset) is
        variable count : integer := 0;
        variable i : integer := 0;
        
    begin
        if (reset = ACTIVE) then
            playerMoveSync <= stim(0);
            count := 0;
            i := 0;
        elsif rising_edge(clock) then
            count := count + 1;
            if (count mod 10 = 5) then
                if (i < stim'length) then
                    playerMoveSync <= stim(i);
                    i := i + 1;
                else 
                    std.env.stop;
                end if;
            end if;
        end if;
    end process STIMULUS;
    

end architecture ClearTiles_TB_ARCH;
