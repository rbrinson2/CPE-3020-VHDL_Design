

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

entity MoveDetect is
    port(
        ----------------------------------------------------------- Input Ports
        clock           : in std_logic;
        reset           : in std_logic;
        playerMove      : in std_logic_vector(MOVEWIDTH - 1 downto 0);
        playerMoveSynch : in std_logic_vector(MOVEWIDTH - 1 downto 0);

        ---------------------------------------------------------- Output Ports
        gamePlayMode    : out std_logic := '0';
        moveDet         : out std_logic := '0';
        firstMoveDet    : out std_logic := '0'
    );
end entity MoveDetect;


architecture MoveDetect_ARCH of MoveDetect is
    type move_t is (WAITING, PLAYING, MOVEDETECTED);
    signal currState : move_t;
    signal nextState : move_t;
begin
    --Move-State-Register---------------------------------------------- Process
    MOVE_REG : process (clock, reset) is
    begin
        if reset = ACTIVE then
            currState <= WAITING;
        elsif rising_edge(clock) then
            currState <= nextState;
        end if;
    end process MOVE_REG;

    --Move-Finite-State-Machine-------------------------------------------- FSM
    -- Takes the indicidual contributions of the player moves
    -- signal and if any one of them is active, triggers a 
    -- signal to be output so that bomb locations can be 
    -- determinded. Works but barely.
    --TODO: Try to incorporate edge detection instead of sync
    MOVE_FSM : process(currState, playerMove, playerMoveSynch) is
        variable moveTraker : std_logic_vector(MOVEWIDTH - 1 downto 0);
        variable firstMove : integer range 0 to 1;
        
    begin
        moveDet <= '0';
        gamePlayMode <= '0';
        firstMoveDet <= '0';

        case currState is 

            --Waiting---------- State
            when WAITING =>
                moveTraker := (others => '0');
                firstMove  := 0;
                if (playerMove = X"0000" and playerMoveSynch = X"0000") then
                    nextState <= PLAYING;
                else 
                    nextState <= WAITING;
                end if;

            --Playing---------- State
            when PLAYING =>
                gamePlayMode <= ACTIVE;
                
                -- If there is no change detected by the 
                -- move tracker then we stay in the state.
                -- Only worked if I included both signals
                if (playerMoveSynch = moveTraker
                    and playerMove = moveTraker
                ) then
                    nextState <= PLAYING;

                -- If player move, and move tracker are different,
                -- then change state to move detected. Could only
                -- get it to work with both these signals together
                else
                    for move in playerMoveSynch'range loop
                        if (playerMoveSynch(move) /= moveTraker(move)
                            and playerMove(move) /= moveTraker(move)
                        ) then
                            moveTraker(move) := playerMoveSynch(move);
                        end if;
                    end loop;
                    if (firstMove = 0) then
                        firstMove := 1;
                        firstMoveDet <= ACTIVE;
                    end if;

                    moveDet <= ACTIVE;
                    nextState <= MOVEDETECTED;
                end if;
            
            --Move-Detected---------- State
            when MOVEDETECTED =>
                moveDet <= ACTIVE;
                gamePlayMode <= ACTIVE;
                nextState <= PLAYING;
        end case;
        
    end process MOVE_FSM;
    
end architecture MoveDetect_ARCH;
