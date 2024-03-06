---------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 03/06/2024 
-- Design Name: Moving Led Testbench
-- Lab Name: Lab 3 - Moving Led
-- Target Devices: Basys 3
-- Description: 
-- Test the Moving Led entity in three ways: 
-- 1) Creates a pyramid to test each left to right position of 
-- the led bar.
-- 2) Tests the reset by moving the led to the middle of the 
-- led bar then turning the reset signal on.
-- 3) Tests what happens if both buttons are pressed at the 
-- same time.
---------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

---------------------------------------------------------Entity
entity MovingLed_TB is
end entity MovingLed_TB;

---------------------------------------------------Architecture
architecture MovingLed_TB_ARCH of MovingLed_TB is
    ---------- Procedures
    -- Sig move --
    -- Moves the signal in either direction depending on if left
    -- or right is passed to it
    procedure sig_move (clockCount : in integer; 
        moveCount : inout integer; movingSignal : out std_logic) 
    is
    begin
        if (clockCount mod 4 = 0) then
            movingSignal := '1';
            moveCount := moveCount + 1;
        elsif (clockCount mod 4 = 1) then
            movingSignal := '1';
        elsif (clockCount mod 4 = 2) then
            movingSignal := '0';
        elsif (clockCount mod 4 = 3) then
            movingSignal := '0';
        end if;
    end procedure;

    -- Pyramid Test --
    -- Moves the led all the way to the left, then all the way
    -- back to the right
    procedure pyramid (clockCount : in integer; moveCount : inout integer;
        leftMv : out std_logic; rightMv : out std_logic) 
    is
    begin
        if (moveCount < 16) then   
            sig_move (clockCount, moveCount, leftMv);
            rightMv := '0';
        elsif (moveCount >= 16) then
            sig_move (clockCount, moveCount, rightMv);
            leftMv := '0';
        end if;
    end procedure;

    -- Reset Test --
    -- Tests the reset signal by moving the led to the middle
    -- then turning the reset signal on
    procedure reset_test (clockCount : in integer; moveCount : inout integer;
    leftMv : out std_logic; rightMv : out std_logic; reset : out std_logic) 
    is
    begin
        if (moveCount < 8) then
            sig_move(clockCount, moveCount, leftMv);
            reset := '0';
        elsif (moveCount >= 8) then
            sig_move(clockCount, moveCount, leftMv);
            reset := '1';
        end if;
        rightMv := '0';
    end procedure;

    -- Double Press Test --
    -- Tests various states of the signals being high and low
    -- at the same time
    procedure double_press (doubleCount : inout integer;
    leftMv : out std_logic; rightMv : out std_logic) is
    begin
        if (doubleCount < 8) then
            leftMv := '0';
            rightMv := '0';
        elsif (doubleCount < 16) then
            leftMv := '1';
            rightMv := '0';
        elsif (doubleCount < 20) then
            leftMv := '1';
            rightMv := '1';
        elsif (doubleCount < 24) then
            leftMv := '0';
            rightMv := '1';
        elsif (doubleCount < 28) then
            leftMv := '1';
            rightMv := '1';
        elsif (doubleCount < 32) then
            leftMv := '1';
            rightMv := '0';
        else
            leftMv := '0';
            rightMv := '0';
        end if;

        doubleCount := doubleCount + 1;
    end procedure;

    ---------- Internal Signals 
    ---- DUT Inputs
    signal clock            : std_logic := '0';
    signal reset            : std_logic := '0';
    signal rightMove        : std_logic := '1';
    signal leftMove         : std_logic := '0';

    ----- DUT Outputs
    signal led              : std_logic_vector(15 downto 0);
    signal sevenSegs        : std_logic_vector(6 downto 0);
    signal anodes           : std_logic_vector(3 downto 0);
begin
    ---------- Clock Generator
    clock <= not clock after 10 ns;
	
    ---------- Instantiation
	DUT: entity work.MovingLed
    port map (
        clock     => clock,
        reset     => reset,
        rightMove => rightMove,
        leftMove  => leftMove,
        led       => led,
        sevenSegs => sevenSegs,
        anodes    => anodes
    );
    
    ---------- Signal Assignments
    -- Stimulus --
    STIMULUS: process (clock) is

        -------- Clock Count
        variable clockCount     : integer := 0;

        -------- Pyramid Const/Vars
        constant PYRAMIDEND     : integer := 128;
        variable pyramidCount   : integer := 0;

        -------- Reset Const/Vars
        constant RESETEND       : integer := 164;
        variable resetCount     : integer := 0;
        variable resetTest      : std_logic := '0';

        -------- Double Input Const/Vars
        constant DOUBLEEND      : integer := 216;
        variable doubleCount    : integer := 0;
        
        -------- Output Variables
        variable leftMv         : std_logic := '0';
        variable rightMv        : std_logic := '0';
        
    begin
        
        -- Testing Procedures Order:
        -- 1) Pyramid
        -- 2) Reset
        -- 3) Double Inputs

        if (clockCount < PYRAMIDEND) then
            pyramid(clockCount, pyramidCount, leftMv, rightMv);
        elsif (clockCount < RESETEND) then
            reset_test(clockCount, resetCount, leftMv, rightMv, resetTest);
        elsif (clockCount < DOUBLEEND) then
            double_press(doubleCount, leftMv, rightMv);
            resetTest := '0';
        else 
            std.env.stop;
        end if;

        clockCount := clockCount + 1;

        -- Updates signals to the DUT
        leftMove <= leftMv;
        rightMove <= rightMv;
        reset <= resetTest;

    end process;


	
end architecture MovingLed_TB_ARCH;
