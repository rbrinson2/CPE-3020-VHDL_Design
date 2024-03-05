library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

---------------------------------------------------------Entity
entity MovingLed_TB is
end entity MovingLed_TB;

---------------------------------------------------------Architecture
architecture MovingLed_TB_ARCH of MovingLed_TB is
    ---------- Procedures
    -- Sig move --
    procedure sig_move (clockCount : in integer; moveCount : inout integer; movingSignal : out std_logic) 
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

    -- Rest Test --
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

    ---------- Internal Signals 
    signal clock            : std_logic := '0';
    signal reset            : std_logic := '0';
    signal rightMove        : std_logic := '1';
    signal leftMove         : std_logic := '0';
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
    STIMULUS: process (clock, reset) is

        -------- Clock Count
        variable clockCount     : integer := 0;

        -------- Pyramid Const/Vars
        constant PYRAMIDEND     : integer := 128;
        variable pyramidCount   : integer := 0;

        -------- Reset Const/Vars
        constant RESETEND       : integer := 164;
        variable resetCount     : integer := 0;
        variable resetTest      : std_logic := '0';
        
        -------- Output Variables
        variable leftMv         : std_logic := '0';
        variable rightMv        : std_logic := '0';
        
    begin
        
        if (clockCount < PYRAMIDEND) then
            pyramid(clockCount, pyramidCount, leftMv, rightMv);
        elsif (clockCount < RESETEND) then
            reset_test(clockCount, resetCount, leftMv, rightMv, resetTest);
        else 
            std.env.stop;
        end if;

        clockCount := clockCount + 1;

        leftMove <= leftMv;
        rightMove <= rightMv;
        reset <= resetTest;

    end process;


	
end architecture MovingLed_TB_ARCH;
