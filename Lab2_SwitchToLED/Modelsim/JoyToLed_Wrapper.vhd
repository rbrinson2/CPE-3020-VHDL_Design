----------------------------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 02/21/2024 
-- Design Name: JoyToLed Wrapper
-- Lab Name: Lab 2 - Switches and LEDs
-- Target Devices: Basys 3
-- Description: Converts main design into Basys 3 inputs
----------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

------------------------------------------------ Entity
entity JoyToLed_Wrapper is
    --------------------- Ports
    port (
        signal btnL : in std_logic;
        signal btnR : in std_logic;
        signal sw   : in std_logic_vector(2 downto 0);
        signal led  : out std_logic_vector(15 downto 0);
        signal an   : out std_logic_vector(3 downto 0);
        signal seg  : out std_logic_vector(6 downto 0)
    );
end entity;

------------------------------------------------ Architecture
architecture JoyToLed_Wrapper_ARCH of JoyToLed_Wrapper is
    --------------------- Declarations
begin
    --------------------- Statements

    -- Instantiation of design
    joytoled_inst: entity work.JoyToLed
    port map (
        leftJoy   => btnL,
        rightJoy  => btnR,
        switches  => sw,
        outputLed => led,
        sevenSegs => seg
    );

    an <= (0 => '0', others => '1');
    
end architecture;
