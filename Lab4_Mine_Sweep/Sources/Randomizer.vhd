library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Randomizer is
    port(
        clock           : in std_logic;
        reset           : in std_logic;


        startEn         : in std_logic;
        gamePlayMode    : in std_logic;  
        bombLocation    : out std_logic_vector (14 downto 0)
    );
end entity Randomizer;

architecture Randomizer_ARCH of Randomizer is
    --Bomb-2-Pulse-Generator----------------------------------------- Procedure
    procedure bomb2Counter(
        clockIn : in std_logic;
        counter : inout integer range 0 to 2;
        clockOut : out std_logic
    ) is
    begin
        if (rising_edge(clockIn)) then
            if (counter < 2) then
                counter  := counter + 1;
            elsif (counter >= 2) then
                counter  := 0;
                clockOut := '1';
            end if;
        end if;
    end procedure bomb2Counter;

    --Bomb-3-Pulse-Generator----------------------------------------- Procedure
    procedure bomb3Counter(
        clockIn : in std_logic;
        counter : inout integer range 0 to 3;
        clockOut : out std_logic
    ) is
    begin
        if (rising_edge(clockIn)) then
            if (counter < 2) then
                counter  := counter + 1;
            elsif (counter >= 2) then
                counter  := 0;
                clockOut := '1';
            end if;
        end if;
    end procedure bomb3Counter;
    
    constant ACTIVE : std_logic := '0';
    
begin
    RANDOMIZER_PROC: process(clock, reset) is
        variable bomb1 : std_logic_vector(4 downto 0);
        variable bomb2 : std_logic_vector(4 downto 0);
        variable bomb3 : std_logic_vector(4 downto 0);
        variable bomb2Clock : std_logic;
        variable bomb3Clock : std_logic;
        variable bomb2Count : integer range 0 to 2;
        variable bomb3Count : integer range 0 to 3;
        
    begin
        if (reset = ACTIVE) then
            bombLocation <= (others => '0');
        elsif (rising_edge(clock)) then
            if (gamePlayMode = ACTIVE) then
                bomb2Counter(clock, bomb2Count, bomb2Clock);
                bomb3Counter(clock, bomb3Count, bomb3Clock);
            end if;
        end if;

        bombLocation <= bomb1 & bomb2 & bomb3;
    end process RANDOMIZER_PROC;

end architecture Randomizer_ARCH;
