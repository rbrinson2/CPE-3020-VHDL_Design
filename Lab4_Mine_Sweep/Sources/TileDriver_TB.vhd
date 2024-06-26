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
    
    signal clock            : std_logic := '0';
    signal reset            : std_logic;
    signal bombLocation   : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    signal tiles            : std_logic_vector(TILEBUSWIDTH - 1 downto 0);
    
begin

    clock <= not clock after 10 ns;
    reset <= '1', '0' after 40 ns;    

    --Tile-Driver------------------------------------------------------ Instant
    DUT : entity work.TileDriver
        port map(
            clock         => clock,
            reset         => reset,
            bombLocation => bombLocation,
            tiles         => tiles
        );
    
    --Stimulus--------------------------------------------------------- Process
    STIMULUS : process (clock) is
        variable seed   : integer := 1;
        variable count  : integer := 0;
        variable x      : real;
        variable rand   : integer;
        
    begin

        if (rising_edge(clock)) then
            -- Generate random rumber
            uniform(seed, seed, x);
            rand := integer(floor(x * 32768.0));
            report "rand = " & integer'image(rand);
            
            -- Run 10 different random numbers
            count := count + 1;
            if (count mod 5 = 0) then
                -- Update bomblocations with the random number
                bombLocation <= std_logic_vector(to_unsigned(rand, 16));
            elsif (count >= 100) then
                std.env.stop;
            end if;
        end if;
    end process STIMULUS;
    
end architecture TileDriver_TB_ARCH;

