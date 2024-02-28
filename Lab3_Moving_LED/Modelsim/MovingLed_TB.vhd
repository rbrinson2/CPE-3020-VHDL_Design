library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MovingLed_TB is
end entity MovingLed_TB;


architecture MovingLed_TB_ARCH of MovingLed_TB is
    signal clock        : std_logic := '0';
    signal reset        : std_logic := '1';
    signal rightMove    : std_logic := '0';
    signal leftMove     : std_logic := '0';
    signal led          : std_logic_vector(15 downto 0);
    signal sevenSegs    : std_logic_vector(6 downto 0);
    signal anodes       : std_logic_vector(4 downto 0);
begin

    clock <= not clock after 10 ns;
    reset <= not reset after 40 ns;
	
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


    anodes <= "0000";
    sevenSegs <= "0000000";



	
end architecture MovingLed_TB_ARCH;
