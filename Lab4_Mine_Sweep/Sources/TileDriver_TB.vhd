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

--======================================================================= ENITY
entity TileDriver_TB is
end entity TileDriver_TB;

--================================================================ ARCHITECTURE
architecture TileDriver_TB_ARCH of TileDriver_TB is
    
    signal clock            : std_logic := '0';
    signal reset            : std_logic;
    signal bombLocations    : std_logic_vector(14 downto 0);
    signal tiles            : std_logic_vector(15 downto 0);
    
begin

    clock <= not clock after 10 ns;
    reset <= '1', '0' after 40 ns;    

    --Tile-Driver------------------------------------------------------ Instant
    DUT : entity work.TileDriver
        port map(
            clock         => clock,
            reset         => reset,
            bombLocations => bombLocations,
            tiles         => tiles
        );
    
    --Stimulus--------------------------------------------------------- Process
    STIMULUS : process (clock) is
        variable seed   : integer := 1;
        variable count  : integer := 1;
        variable x      : real;
        variable rand   : integer;
        
    begin

        if (rising_edge(clock)) then
            -- Generate random rumber
            uniform(seed, seed, x);
            rand := integer(floor(x * 32768.0));
            report "rand = " & integer'image(rand);
            
            -- Run 10 different random numbers
            if (count < 10) then
                count := count + 1;
            elsif (count >= 10) then
                std.env.stop;
            end if;

            -- Update bomblocations with the random number
            bombLocations <= std_logic_vector(to_unsigned(rand, 15));
        end if;
    end process STIMULUS;
    
end architecture TileDriver_TB_ARCH;

