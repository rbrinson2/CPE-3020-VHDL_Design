---------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 04/08/2024 
-- Design Name: Tile Driver Testbench
-- Lab Name: Lab 4 - Mine Sweep 
-- Target Devices: Basys 3
-- 
-- Description: 
-- Generates a random nubember using the math_real packages
-- uniform function then passes that into the tile driver
-- using the bomblocations port
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.minesweeppackage.all;

--======================================================================= ENITY
entity TileDriver_TB is
end entity TileDriver_TB;

--================================================================ ARCHITECTURE
architecture TileDriver_TB_ARCH of TileDriver_TB is

    type StimStruct_t is record
        hit : std_logic;
        move : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    end record StimStruct_t;
    
    type StimArray_t is array (natural range <>) of StimStruct_t;   
    constant stim : StimArray_t := (
        ---Hits|--------PlayerMoveSync----------
        -------|"0001" & "1000" & "1100" & "0010"--Bomb-Location
          ('0', "0000" & "0000" & "0000" & "0000"),
          ('0', "1110" & "0000" & "0000" & "0000"),
          ('0', "1110" & "0111" & "0000" & "0000"),
          ('0', "1110" & "0111" & "0000" & "0001"),
          ('1', "1110" & "0111" & "0000" & "0001"),
          ('1', "1110" & "0111" & "0000" & "0001"),
          ('1', "1110" & "0111" & "0000" & "0001"),
          ('1', "1110" & "0111" & "0000" & "0001"),
          ('1', "1110" & "0111" & "0000" & "0001"),
          ('1', "1110" & "0111" & "0000" & "0001")
    );
    
    signal clock            : std_logic := '0';
    signal reset            : std_logic;
    signal bombLocation     : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal tiles            : std_logic_vector(TILEBUSWIDTH - 1 downto 0);
    signal hitDet           : std_logic;
    signal doneMode         : std_logic;
    signal clearTilesMask   : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    
begin

    clock <= not clock after 10 ns;
    reset <= '1', '0' after 40 ns;    
    bombLocation <= "0001" & "1000" & "1100" & "0010" when reset = not ACTIVE else X"0000";

    --Tile-Driver------------------------------------------------------ Instant
    DUT : entity work.TileDriver
        port map(
            clock          => clock,
            reset          => reset,
            bombLocation   => bombLocation,
            clearTilesMask => clearTilesMask,
            hitDet         => hitDet,
            doneMode       => doneMode,
            tiles          => tiles
        );
    
    --Stimulus--------------------------------------------------------- Process
    STIMULUS : process (clock, reset) is
        variable index  : integer := 0;
        variable count  : integer := 0;
    begin
        if (reset = ACTIVE) then
            count := 0;
            index := 0;
            clearTilesMask <= stim(0).move;
            hitDet <= stim(0).hit;
        elsif (rising_edge(clock)) then
            count := count + 1;
            if (count mod 10 = 5) then
                clearTilesMask <= stim(index).move;
                hitDet <= stim(index).hit;
                if (index < stim'length - 1) then
                    index := index + 1;
                elsif (count >= 150) then
                    std.env.stop;
                end if;
            end if;
        end if;
    end process STIMULUS;
    
end architecture TileDriver_TB_ARCH;

