library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

---------------------------------------------------------Entity
entity MovingLed_TB is
end entity MovingLed_TB;

---------------------------------------------------------Architecture
architecture MovingLed_TB_ARCH of MovingLed_TB is
    ---------- Internal Signals 
    signal clock            : std_logic := '0';
    signal reset            : std_logic := '0';
    signal rightMove        : std_logic := '1';
    signal leftMove         : std_logic := '0';
    signal led              : std_logic_vector(15 downto 0);
    signal sevenSegs        : std_logic_vector(6 downto 0);
    signal anodes           : std_logic_vector(3 downto 0);
begin
    ---------- Clock Generator
    clock <= not clock after 10 ns;
	
    ---------- Instantiation
	DUT: entity work.MovingLed
    port map (
        clock     => clock,
        reset     => reset,
        rightMove => rightMove,
        leftMove  => leftMove,
        led       => led,
        sevenSegs => sevenSegs,
        anodes    => anodes
    );
    
    ---------- Signal Assignments
    -- Stimulus --
    STIMULUS: process (clock, reset) is
        variable clockCount : integer range 0 to 1 := 0;
        variable moveCount  : integer range 0 to 31 := 0;
    begin
        if (clockCount < 128) then
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

            if (moveCount > 32) then
                rightMove <= '1';
            end if;
        else    
            if (clockCount > 128 and clockCount < 132) then
                leftMove <= '1';
                rightMove <= '0';
            elsif (clockCount >= 132 and clockCount < 136) then
                leftMove <= '1';
                rightMove <= '1';
            elsif (clockCount >= 136 and clockCount < 140) then
                leftMove <= '0';
                rightMove <= '1';
            elsif (clockCount >= 140 and clockCount < 144) then
                leftMove <= '0';
                rightMove <= '0';
            elsif (clockCount >= 144 and clockCount < 148) then
                leftMove <= '0';
                rightMove <= '1';
            elsif (clockCount >= 148 and clockCount < 162) then
                leftMove <= '1';
                rightMove <= '1';
            elsif (clockCount >= 160) then
                std.env.stop;
            end if;
        end if;

        clockCount := clockCount + 1;
    end process;


	
end architecture MovingLed_TB_ARCH;
