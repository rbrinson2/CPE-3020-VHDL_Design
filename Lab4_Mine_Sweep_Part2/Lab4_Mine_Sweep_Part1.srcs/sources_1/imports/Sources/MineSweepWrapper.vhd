---------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 04/08/2024 
-- Design Name: MineSweep Wrapper
-- Lab Name: Lab 4 - Mine Sweep
-- Target Devices: Basys 3
-- 
-- Description: 
-- Converts the top level ports to signals and ports native
-- to the Basys 3 board.
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--====================================================================== ENTITY
entity MineSweepWrapper is
    port(
        clk     : in std_logic;
        btnU    : in std_logic;
        sw      : in std_logic_vector(15 downto 0);
        an      : out std_logic_vector(3 downto 0);
        seg     : out std_logic_vector(6 downto 0);
        led     : out std_logic_vector(15 downto 0)
    );
end entity MineSweepWrapper;

--================================================================ ARCHITECTURE
architecture MineSweepWrapper_ARCH of MineSweepWrapper is
      
begin

    --MineSweep-------------------------------------------------------- Instant
    MINESWEEP : entity work.MineSweep
        port map(
            clock           => clk,
            reset           => btnU,
            playerMove      => sw,
            anodes          => an,
            sevenSegs       => seg,
            tiles           => led 
        );
    
end architecture MineSweepWrapper_ARCH;
