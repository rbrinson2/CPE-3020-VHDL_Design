library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.physical_io_package.all;

entity MineSweep is
    port(
        clock       : in std_logic;
        reset       : in std_logic;
        playerMove  : in std_logic_vector(15 downto 0);

        tiles       : out std_logic_vector(15 downto 0);
        timer       : out std_logic_vector(6 downto 0);
        refreshRate : out std_logic_vector(3 downto 0)
    );
end entity MineSweep;

architecture MineSweep_ARCH of MineSweep is
    constant ACTIVE : std_logic := '1';
    
    signal flashDone        : std_logic :='0';
    signal startEn          : std_logic := '0';
    signal countDown        : std_logic_vector(6 downto 0); 
    signal playerMoveSync   : std_logic_vector(15 downto 0);
    signal moveDetected     : std_logic;
begin
    
    --Seven-Segment-Driver------------------------------------------- Component
    SEVEN_SEG: SevenSegmentDriver
        port map(
            reset     => reset,
            clock     => clock,
            digit3    => '0' & countDown(6 downto 4),
            digit2    => countDown(3 downto 0),
            digit1    => "0000",
            digit0    => "0000",
            blank3    => '0',
            blank2    => '0',
            blank1    => '0',
            blank0    => '0',
            sevenSegs => timer,
            anodes    => refreshRate
        );

    --Move-Syncronizer----------------------------------------------- Component
    MOVE_SYNC: for i in 0 to 15 generate
        SynchronizerChain_inst: SynchronizerChain
            generic map(
                CHAIN_SIZE => 8
            )
            port map(
                reset   => reset,
                clock   => clock,
                asyncIn => playerMove(i),
                syncOut => playerMoveSync(i)
            );
    end generate;
    
    --Move-Detect------------------------------------------------------ Process
    MOVE_DET: process(clock, reset) is
        variable hold : std_logic_vector(15 downto 0) := (others => '0');
    begin
        if (reset = ACTIVE) then
            moveDetected    <= not ACTIVE;
            hold            := (others => not ACTIVE);
        elsif rising_edge(clock) then
            moveDetected    <= not ACTIVE;
            for i in playerMoveSync'range loop
                if (playerMoveSync(i) = ACTIVE) then
                    if (hold(i) = not ACTIVE) then
                        moveDetected <= ACTIVE;
                        hold(i)      := ACTIVE;
                    end if;
                else
                    hold(i) := not ACTIVE;
                end if;
            end loop;
        end if;
    end process;

    --Game-Timer------------------------------------------------------- Process
    GAME_TIMER : process (clock, reset) is
        variable upperDigit : integer range 0 to 6 := 0;
        variable lowerDigit : integer range 0 to 9 := 0;
    begin
        if reset = '1' then
            startEn <= '0';
        elsif rising_edge(clock) then
            
        end if;

        countDown <= std_logic_vector(to_unsigned(upperDigit, 3)) 
                     & std_logic_vector(to_unsigned(lowerDigit, 4));
    end process GAME_TIMER;
     
    
end architecture MineSweep_ARCH;
