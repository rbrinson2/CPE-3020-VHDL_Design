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
    signal flashDone        : std_logic :='0';
    signal startEn          : std_logic := '0';
    signal countDown        : std_logic_vector(6 downto 0); 
    signal playerMoveSync   : std_logic_vector(15 downto 0);
    
begin
    
       
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
    
    SynchronizerChain_inst : SynchronizerChain
        generic map(
            CHAIN_SIZE => CHAIN_SIZE
        )
        port map(
            reset   => reset,
            clock   => clock,
            asyncIn => asyncIn,
            syncOut => syncOut
        );
    
        LevelDetector_inst : LevelDetector
            port map(
                reset    => reset,
                clock    => clock,
                trigger  => trigger,
                pulseOut => pulseOut
            );
        
    

    MOVE_DET : process(playerMoveSync, flashDone) is
    begin
        
    end process MOVE_DET;
    

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
