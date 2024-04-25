library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

entity Timer is
    port(
        clock : in std_logic;
        reset : in std_logic;
        firstMove : in std_logic;
        hitDet    : in std_logic;

        upperDigit : out std_logic_vector(3 downto 0);
        lowerDigit : out std_logic_vector(3 downto 0);
        timerZeroMode : out std_logic;
        timerZeroEn  : out std_logic
    );
end entity Timer;


architecture Timer_ARCH of Timer is
    constant ZERO : unsigned(3 downto 0) := "0000";
    constant SIX  : unsigned(3 downto 0) := "0110";
    constant NINE : unsigned(3 downto 0) := "1001";
    
    type state_t is (WAITING, COUNTDOWN, DONE);
    signal nextState : state_t;
    signal currState : state_t;

    signal countDownMode : std_logic;

begin
    
    TIMER_REG : process (clock, reset) is
    begin
        if (reset = ACTIVE) then
            currState <= WAITING;
        elsif rising_edge(clock) then
            currState <= nextState;
        end if;
    end process TIMER_REG;

    TIMER_FSM : process (currState, firstMove, timerZeroMode, hitDet) is
    begin
        countDownMode <= not ACTIVE;

        case currState is 
            when WAITING =>
                nextState <= currState;
                if (firstMove = ACTIVE) then
                    nextState <= COUNTDOWN;
                end if;
            when COUNTDOWN =>
                countDownMode <= ACTIVE;
                nextState <= currState;
                if (timerZeroMode = ACTIVE or hitDet = ACTIVE) then
                    nextState <= DONE;
                end if;
            when DONE =>
                nextState <= currState;
        end case;
    end process TIMER_FSM;
    
    

    COUNT_DOWN : process (clock, reset) is
        variable count : integer range 0 to ONESECTIMER;
        variable upper : unsigned(3 downto 0);
        variable lower : unsigned(3 downto 0);
    begin
        if (reset = ACTIVE) then
            upperDigit <= (others => '0');
            lowerDigit <= (others => '0');
            timerZeroMode <= not ACTIVE;
            timerZeroEn <= not ACTIVE; 
            count := 0;
            upper := SIX;
            lower := ZERO;
        elsif rising_edge(clock) then
            if (countDownMode = ACTIVE) then
                count := count + 1;
                if (count >= 2) then
                    count := 0;
                    if (lower /= ZERO) then
                        lower := lower - 1;
                    else
                        if (upper /= ZERO) then
                            upper := upper - 1;
                            lower := NINE;
                        else 
                            timerZeroMode <= ACTIVE;
                        end if;
                    end if;
                end if;
                upperDigit <= std_logic_vector(upper);
                lowerDigit <= std_logic_vector(lower);
            end if;
        end if;
    end process COUNT_DOWN;
    
end architecture Timer_ARCH;
