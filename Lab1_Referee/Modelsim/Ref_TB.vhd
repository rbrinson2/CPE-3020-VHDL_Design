# ----- Libraries ----- #
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

# ----- Entity ----- #
entity Ref_TB is
end;

# ----- Architecture ----- #
architecture ref_tb of Ref_TB is

# --- Declarations --- #
    # Wires
    signal clk : std_logic := '0';
    signal rst : std_logic;
    signal output : std_logic;
    signal cntVec : std_logic_vector (3 downto 0);

    # Variables
    signal cnt : unsigned (3 downto 0) := "0000";
begin

# --- Statements --- #
    # Clock Generator
    clk <= not clk after 10 ns;

    # Start the simulation with a reset signal
    rst <= '1', '0' after 20 ns;
    
    # Instatiation of the Referee module
    dut : entity work.Referee(Ref_Arch)
        port map(href=>cntVec(0), ref2 => cntVec(1), 
            ref3 => cntVec(2), ref4 => cntVec(3), 
            vote => output);
    
    # Testbench process
    process (clk) begin
        # Increment the count
        cnt <= cnt + 1;

        # Convert count to count vector
        cntVec <= std_logic_vector (cnt);

        # Stop condition when count is complete
        if (cnt = "1111") then
          std.env.stop;
        end if;
    end process;
end;