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
	constant ACTIVE : std_logic := '1';
	constant START	: std_logic_vector(3 downto 0) := "0000";

	signal position	: std_logic_vector(3 downto 0);
begin
	sevenSegs <= "0000000";
	anodes <= "0000";


	LED_DRIVER: process (position) is
		variable ledPos : integer range 0 to 15 := 0;
	begin
		ledPos := 0;
		for i in position'range loop
			if position(i) = '1' then
			    ledPos := ledPos + 2 ** i;
			end if;
		end loop;
		
		led <= (ledPos => '1', others => '0');
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
	


end architecture MovingLed_ARCH;
