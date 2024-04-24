

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
        moveDet         : out std_logic := '0'
    );
end entity MoveDetect;


architecture MoveDetect_ARCH of MoveDetect is
    type move_t is (WAITING, PLAYING, MOVEDETECTED);
    signal currState            : move_t;
    signal nextState            : move_t;   
    signal playerMoveZeroEn     : std_logic;
    signal playerMoveSyncZeroEn : std_logic;
begin

    PLAYER_MOVE_ZERO_EN: with playerMove select
        playerMoveZeroEn <= ACTIVE when X"0000",
            not ACTIVE when others;
    
    PLAYER_MOVE_SYNC_ZERO_EN:with playerMoveSynch select
        playerMoveSyncZeroEn <= ACTIVE when X"0000",
            not ACTIVE when others;
    
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
    MOVE_FSM : process(
        currState, playerMove, playerMoveSynch, 
        playerMoveZeroEn, playerMoveSyncZeroEn
    ) is
        variable moveTraker : std_logic_vector(MOVEWIDTH - 1 downto 0);        
    begin
        moveDet <= '0';
        gamePlayMode <= '0';

        case currState is 

            --Waiting---------- State
            when WAITING =>
                moveTraker := (others => '0');
                if (
                    playerMoveZeroEn = ACTIVE 
                    and playerMoveSyncZeroEn = ACTIVE
                ) then
                    nextState <= PLAYING;
                else 
                    nextState <= currState;
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
                    nextState <= currState;

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
                    
                    nextState <= MOVEDETECTED;
                    moveDet  <= ACTIVE;
                end if;
            
            --Move-Detected---------- State
            when MOVEDETECTED =>
                moveDet      <= ACTIVE;
                gamePlayMode  <= ACTIVE;
                nextState     <= PLAYING;
        end case;
        
    end process MOVE_FSM;
    
end architecture MoveDetect_ARCH;
