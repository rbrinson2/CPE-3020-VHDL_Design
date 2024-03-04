library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity MovingLed is
	port (
		clock		: in std_logic;
		reset		: in std_logic;
		rightMove	: in std_logic;
		leftMove	: in std_logic;


		led			: out std_logic_vector(15 downto 0);
		sevenSegs	: out std_logic_vector(6 downto 0);
		anodes		: out std_logic_vector(3 downto 0)
	);
end entity MovingLed;


architecture MovingLed_ARCH of MovingLed is
	function bin_to_onehot (bin: std_logic_vector) return std_logic_vector is
		variable bit_pos	: integer := 0;
		variable oneHot		: std_logic_vector (15 downto 0);	
	begin
		for i in bin'range loop
			if bin(i) = '1' then
			    bit_pos := bit_pos + 2 ** i;
			end if;
		end loop;
		
		for i in oneHot'range loop
			if (i = bit_pos) then
				oneHot(i) := '1';
			else	
				oneHot(i) := '0';
			end if;
		end loop;
		return oneHot;
	end function;



	constant ACTIVE : std_logic := '1';
	constant START	: std_logic_vector(3 downto 0) := "0000";

	signal position	: std_logic_vector(3 downto 0);
	signal upper	: std_logic_vector(3 downto 0);
	signal lower	: std_logic_vector(3 downto 0);
begin


	sevensegmentdriver_inst: entity work.SevenSegmentDriver
	port map (
		reset     => reset,
		clock     => clock,
		digit3    => position,
		digit2    => "0000",
		digit1    => upper,
		digit0    => lower,
		blank3    => '0',
		blank2    => '1',
		blank1    => '0',
		blank0    => '0',
		sevenSegs => sevenSegs,
		anodes    => anodes
	);

	LED_DRIVER: process (position) is
	begin
		led <= bin_to_onehot(position);
	end process;
	
	LED_POSITION: process(clock, reset) is
		variable location : integer range 0 to 15 := 0;
		variable stillActive : integer := 0;
	begin
		if (reset = ACTIVE) then
			position <= START;	
		elsif (rising_edge(clock)) then
			if (leftMove = ACTIVE) then
				if (location /= 15 and stillActive = 0) then
					location := location + 1;
					stillActive := 1;
				end if;
			elsif (rightMove = ACTIVE) then
				if (location /= 0 and stillActive = 0) then 
					location := location - 1;
					stillActive := 1;
				end if;
			else	
				stillActive := 0;
			end if;
		end if;
		position <= std_logic_vector(to_unsigned(location, 4));
	end process ;	
	
	SPLIT: process (position) is
	begin
		if (position >= "1010") then
			upper <= "0001";
			lower <= std_logic_vector(unsigned(position) - 10);
		else 
			upper <= "0000";
			lower <= position;
		end if;
	end process;

end architecture MovingLed_ARCH;
