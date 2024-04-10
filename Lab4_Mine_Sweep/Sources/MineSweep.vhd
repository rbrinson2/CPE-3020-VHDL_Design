---------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 04/08/2024 
-- Design Name: MineSweep
-- Lab Name: Lab 4 - Mine Sweep
-- Target Devices: Basys 3
-- 
-- Description: 
-- Houses the state machine for the control signals and the 
-- individual modules. The state machine starts by waiting 
-- until the board returns to a zero state after a reset. Once
-- the zero state has been entered, the SM move to playing mode
-- and waits for a move to be made, telling the randomizer
-- to send bomb locations to the tile driver
---------------------------------------------------------------
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

begin
    
end architecture MineSweep_ARCH;
