library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

--===================================================================== ENITITY
entity Timer is
    port(
        ----------------------------------------------------------- Input Ports
        clock        : in std_logic;
        reset        : in std_logic;
        firstMoveDet : in std_logic;
        hitDet       : in std_logic;
        gameOverMode : in std_logic;

        ----------------------------------------------------------- Ouput Ports
        upperDigit    : out std_logic_vector(3 downto 0);
        lowerDigit    : out std_logic_vector(3 downto 0);
        timerZeroMode : out std_logic
    );
end entity Timer;

--================================================================ ARCHITECTURE
architecture Timer_ARCH of Timer is
    ----------------------------------------------------------------- Constants
    constant ZERO : unsigned(3 downto 0) := "0000";
    constant SIX  : unsigned(3 downto 0) := "0110";
    constant NINE : unsigned(3 downto 0) := "1001";
    
    ------------------------------------------------------------- State Signals
    type state_t is (WAITING, COUNTDOWN, DONE);
    signal nextState : state_t;
    signal currState : state_t;

    ---------------------------------------------------------- Internal Signals
    signal countDownMode         : std_logic;
    signal internalTimerZeroMode : std_logic;

begin

    timerZeroMode <= internalTimerZeroMode;
    
    --Timer-State-Machine-Register------------------------------------- Process
    TIMER_REG : process (clock, reset) is
    begin
        if (reset = ACTIVE) then
            currState <= WAITING;
        elsif rising_edge(clock) then
            currState <= nextState;
        end if;
    end process TIMER_REG;

    --Timer-State-Machine-Mechanics------------------------------------ Process
    TIMER_FSM : process (
        currState, 
        firstMoveDet, 
        internalTimerZeroMode, 
        hitDet, 
        gameOverMode
        ) is
    begin
        countDownMode <= not ACTIVE;

        case currState is 
            when WAITING =>
                nextState <= currState;
                if (firstMoveDet = ACTIVE) then
                    nextState <= COUNTDOWN;
                end if;
            when COUNTDOWN =>
                countDownMode <= ACTIVE;
                nextState <= currState;
                if (
                    internalTimerZeroMode = ACTIVE 
                    or hitDet = ACTIVE 
                    or gameOverMode = ACTIVE
                    ) then
                    nextState <= DONE;
                end if;
            when DONE =>
                nextState <= currState;
        end case;
    end process TIMER_FSM;
    
    
    --Countdown-Timer-------------------------------------------------- Process
    COUNT_DOWN : process (clock, reset) is
        variable count : integer range 0 to ONESECTIMER;
        variable upper : unsigned(3 downto 0);
        variable lower : unsigned(3 downto 0);
    begin
        if (reset = ACTIVE) then
            upperDigit <= (others => '0');
            lowerDigit <= (others => '0');
            internalTimerZeroMode <= not ACTIVE;
            count := 0;
            upper := SIX;
            lower := ZERO;
        elsif rising_edge(clock) then
            if (countDownMode = ACTIVE) then
                count := count + 1;
                if (count >= ONESECTIMER) then
                    count := 0;
                    if (lower /= ZERO) then
                        lower := lower - 1;
                    else
                        if (upper /= ZERO) then
                            upper := upper - 1;
                            lower := NINE;
                        else 
                            internalTimerZeroMode <= ACTIVE;
                        end if;
                    end if;
                end if;
                upperDigit <= std_logic_vector(upper);
                lowerDigit <= std_logic_vector(lower);
            end if;
        end if;
    end process COUNT_DOWN;
    
end architecture Timer_ARCH;
