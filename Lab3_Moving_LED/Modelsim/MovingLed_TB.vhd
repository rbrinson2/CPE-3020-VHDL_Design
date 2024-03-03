library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MovingLed_TB is
end entity MovingLed_TB;


architecture MovingLed_TB_ARCH of MovingLed_TB is

    signal clock        : std_logic := '0';
    signal reset        : std_logic := '1';
    signal rightMove    : std_logic := '1';
    signal leftMove     : std_logic := '0';
    signal led          : std_logic_vector(15 downto 0);
    signal sevenSegs    : std_logic_vector(6 downto 0);
    signal anodes       : std_logic_vector(3 downto 0);
  
begin

    clock <= not clock after 10 ns;
    reset <= '0' after 20 ns;
	
	movingled_inst: entity work.MovingLed
    port map (
        clock     => clock,
        reset     => reset,
        rightMove => rightMove,
        leftMove  => leftMove,
        led       => led,
        sevenSegs => sevenSegs,
        anodes    => anodes
    );
    
    STIMULUS: process (clock) is
        variable clockCount : integer := 0;
        variable moveCount : integer := 0;
    begin
        if (clockCount mod 4 = 0) then
            if (moveCount < 16) then
                leftMove <= '1';
            elsif (moveCount >= 16) then
                rightMove <= '1';
            end if;
            moveCount := moveCount + 1;
        elsif (clockCount mod 4 = 2) then
            if (moveCount < 16) then
                leftMove <= '0';
            elsif (moveCount >= 16) then   
                rightMove <= '0';
            end if;
        end if;
        
        if (moveCount >= 16) then
            leftMove <= '0';
        end if;
        if (moveCount < 16) then
            rightMove <= '0';
        end if;
        clockCount := clockCount + 1;
    end process;

	
end architecture MovingLed_TB_ARCH;
