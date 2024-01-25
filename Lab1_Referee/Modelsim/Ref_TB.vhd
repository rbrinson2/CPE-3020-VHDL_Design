library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Ref_TB is
end;

architecture ref_tb of Ref_TB is
    signal clk : std_logic := '0';
    signal rst : std_logic;
    signal outpt : std_logic;
    signal cnt : unsigned (3 downto 0) := "0000";
    signal cntvec : std_logic_vector (3 downto 0);
begin
    clk <= not clk after 10 ns;
    rst <= '1', '0' after 20 ns;
    
    dut : entity work.Referee(Ref_Arch)
        port map(href=>cntvec(0), ref2 => cntvec(1), ref3 => cntvec(2), ref4 => cntvec(3), vote => outpt);
    
    process (clk) begin
        cnt <= cnt + 1;
        cntvec <= std_logic_vector (cnt);
        if (cnt = "1111") then
          std.env.stop;
        end if;
    end process;
end;