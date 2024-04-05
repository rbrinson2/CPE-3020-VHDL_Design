library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Randomizer============================================================ Entity
entity Randomizer is
    port(
        ---------- Inputs
        clock           : in std_logic;
        reset           : in std_logic;
        startEn         : in std_logic;
        gamePlayMode    : in std_logic;
        
        ---------- Outputs
        bombLocation    : out std_logic_vector (14 downto 0)
    );
end entity Randomizer;

--Randomizer-Architecture========================================= Architecture
architecture Randomizer_ARCH of Randomizer is
    constant ACTIVE : std_logic := '1';
    
    --Bomb-2-Pulse-Generator----------------------------------------- Procedure
    procedure bomb2Counter(
        clockIn : in std_logic;
        counter : inout integer range 0 to 1;
        clockOut : out std_logic
    ) is
    begin
        clockOut := not ACTIVE;
        if (clockIn = ACTIVE) then
            if (counter < 1) then
                counter  := counter + 1;
            elsif (counter >= 1) then
                counter  := 0;
                clockOut := ACTIVE;
            end if;
        end if;
    end procedure bomb2Counter;

    --Bomb-3-Pulse-Generator----------------------------------------- Procedure
    procedure bomb3Counter(
        clockIn : in std_logic;
        counter : inout integer range 0 to 2;
        clockOut : out std_logic
    ) is
    begin
        clockOut := not ACTIVE;
        if (clockIn = ACTIVE) then
            if (counter < 2) then
                counter  := counter + 1;
            elsif (counter >= 2) then
                counter  := 0;
                clockOut := ACTIVE;
            end if;
        end if;
    end procedure bomb3Counter;
    
begin
    --Randomzier-Process----------------------------------------------- Process
    RANDOMIZER_PROC: process(clock, reset) is
        variable bomb1      : std_logic_vector(4 downto 0);
        variable bomb2      : std_logic_vector(4 downto 0);
        variable bomb3      : std_logic_vector(4 downto 0);
        variable bomb2Clock : std_logic;
        variable bomb3Clock : std_logic;
        variable bomb2Count : integer range 0 to 2;
        variable bomb3Count : integer range 0 to 3;
        
    begin
        if (reset = ACTIVE) then
            bombLocation    <= (others => '0');
            bomb1           := (others => '0');
            bomb2           := (others => '0');
            bomb3           := (others => '0');
            bomb2Clock      := not ACTIVE;
            bomb3Clock      := not ACTIVE;
            bomb2Count      := 0;
            bomb3Count      := 0;

        elsif (rising_edge(clock)) then
            if (gamePlayMode = ACTIVE) then
                -- Call counting procedures for bomb2 and bomb3
                bomb2Counter(clock, bomb2Count, bomb2Clock);
                bomb3Counter(clock, bomb3Count, bomb3Clock);

                -- Increment bomb1 on each clock
                bomb1 := std_logic_vector(unsigned(bomb1) + 1);

                -- Decrement bomb2 on bomb2Clock pulse
                if (bomb2Clock = ACTIVE) then
                    bomb2 := std_logic_vector(unsigned(bomb2) - 1);
                end if;

                -- Increment bomb3 on bomb3Clock pulse
                if (bomb3Clock = ACTIVE) then
                    bomb3 := std_logic_vector(unsigned(bomb3) + 1);
                end if;

                -- If startEn activates, latch the bomb positions
                if (startEn = ACTIVE) then
                    bombLocation <= bomb1 & bomb2 & bomb3;
                end if;
            end if;
        end if;
    end process RANDOMIZER_PROC;

end architecture Randomizer_ARCH;
