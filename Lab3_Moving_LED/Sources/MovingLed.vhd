---------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 03/06/2024 
-- Design Name: Moving LED
-- Lab Name: Lab 3 - Moving Led
-- Target Devices: Basys 3
-- Description: 
-- The LED on the LED bar will move each time the left or right
-- input is detected. The led will only move by one position
-- each time. If both inputs are pressed at the same time the 
-- LED will not move and the left move has priority over the 
-- right move.
---------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--------------------------------------------------------- Entity
entity MovingLed is
	port (
		---------- Inputs 
		clock		: in std_logic;
		reset		: in std_logic;
		rightMove	: in std_logic;
		leftMove	: in std_logic;

		---------- Outputs 
		led			: out std_logic_vector(15 downto 0);
		sevenSegs	: out std_logic_vector(6 downto 0);
		anodes		: out std_logic_vector(3 downto 0)
	);
end entity MovingLed;

--------------------------------------------------------- Architecture
architecture MovingLed_ARCH of MovingLed is

	---------- Function
	-- Bin to Onehot Function --
	function bin_to_onehot (bin: std_logic_vector) 
		return std_logic_vector 
	is
		-- Constants
		constant BITON 		: std_logic := '1';
		constant BITOFF		: std_logic := '0';
		-- Variables
		variable bit_pos	: integer range 0 to 15 := 0;
		variable oneHot		: std_logic_vector (15 downto 0);	
	begin
		-- BCD for loop 
		for i in bin'range loop
			if bin(i) = BITON then
			    bit_pos := bit_pos + 2 ** i;
			end if;
		end loop;
		
		-- Decimal to Onehot converter
		for i in oneHot'range loop
			if (i = bit_pos) then
				oneHot(i) := BITON;
			else	
				oneHot(i) := BITOFF;
			end if;
		end loop;
		return oneHot;
	end function;


	---------- Constants 
	constant ACTIVE 		: std_logic := '1';
	constant PASS			: std_logic := '0';
	constant BLANK			: std_logic := '1';
	constant START			: std_logic_vector(3 downto 0):="0000";
	constant NOTSTILLACT 	: integer := 0;
	constant STILLACT		: integer := 1;
	constant ZERO			: std_logic_vector(3 downto 0):="0000";
	constant ONE			: std_logic_vector(3 downto 0):="0001";
	constant TEN			: std_logic_vector(3 downto 0):="1010";

	---------- Internal Signals 
	signal position			: std_logic_vector(3 downto 0);
	signal upperDigit		: std_logic_vector(3 downto 0);
	signal lowerDigit		: std_logic_vector(3 downto 0);
begin

	---------- Instantiation
	-- Seven Segment Driver --
	sevensegmentdriver_inst: entity work.SevenSegmentDriver
	port map (
		reset     => reset,
		clock     => clock,
		digit3    => position,
		digit2    => ZERO,
		digit1    => upperDigit,
		digit0    => lowerDigit,
		blank3    => PASS,
		blank2    => BLANK,
		blank1    => PASS,
		blank0    => PASS,
		sevenSegs => sevenSegs,
		anodes    => anodes
	);

	---------- Signal Assignments 
	-- Led Driver --
	LED_DRIVER: process (position) is
	begin
		led <= bin_to_onehot(position);
	end process;
	
	-- Led Position --
	-- Determins the led position and
	-- if the button is still being pressed or not
	LED_POSITION: process(clock, reset) is
		-- Variables
		variable location : integer range 0 to 15 := 0;
		-- stillActive tests if the move button is
		-- actively being pressed
		variable stillActive : integer := NOTSTILLACT; 
	begin
		-- On reset return everything to the start
		if (reset = ACTIVE) then
			position <= START;	
			location := 0;
		elsif (rising_edge(clock)) then
			if (leftMove = ACTIVE) then
				if (location /= 15 and stillActive = NOTSTILLACT) 
				then
					location := location + 1;
					stillActive := STILLACT;
				end if;
			elsif (rightMove = ACTIVE) then
				if (location /= 0 and stillActive = NOTSTILLACT) 
				then 
					location := location - 1;
					stillActive := STILLACT;
				end if;
			else	
				stillActive := NOTSTILLACT;
			end if;
			position <= std_logic_vector(to_unsigned(location, 4));
		end if;
	end process ;	
	
	-- Split --
	-- Turns the position signal into two
	-- so that a decimal format can be output
	-- by the seven segment
	SPLIT: process (position) is
	begin
		if (position >= TEN) then
			upperDigit <= ONE;
			lowerDigit <= std_logic_vector(unsigned(position) -10);
		else 
			upperDigit <= ZERO;
			lowerDigit <= position;
		end if;
	end process;

end architecture MovingLed_ARCH;
