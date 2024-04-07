

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MoveDetect is
    port(
        clock : in std_logic;
        reset : in std_logic;

        playerMoveSync : in std_logic_vector(15 downto 0);

        gamePlayMode : out std_logic;
        startEn : out std_logic
    );
end entity MoveDetect;

architecture MoveDetect_ARCH of MoveDetect is
    constant ACTIVE : std_logic := '1';
    
begin
   
    DETECT : process (clock, reset) is
    begin
        if (reset = ACTIVE) then
           gamePlayMode <= not ACTIVE;
           startEn      <= not ACTIVE; 
        elsif (rising_edge(clock)) then
            
        end if;
    end process DETECT;
    
    
    
end architecture MoveDetect_ARCH;