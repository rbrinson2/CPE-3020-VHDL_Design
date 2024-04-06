library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.physical_io_package.all;

--====================================================================== ENTITY
entity MineSweep is
    port(
        --------- Inputs
        clock       : in std_logic;
        reset       : in std_logic;
        playerMove  : in std_logic_vector(15 downto 0);

        ---------- Outputs
        tiles       : out std_logic_vector(15 downto 0);
        timer       : out std_logic_vector(6 downto 0);
        refreshRate : out std_logic_vector(3 downto 0)
    );
end entity MineSweep;

--================================================================ ARCHITECTURE
architecture MineSweep_ARCH of MineSweep is

    ---------- Constants
    constant ACTIVE : std_logic := '1';
    
    ---------- Signals
    signal bombLocation     : std_logic_vector(14 downto 0);
    signal gamePlayMode     : std_logic;    
    signal startEn          : std_logic;
    signal playerMoveSync   : std_logic_vector(15 downto 0);
    signal moveDetected     : std_logic;
begin
    

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
    
    --Randomizer------------------------------------------------------- Process
    RANDOMIZER : entity work.Randomizer
        port map(
            clock        => clock,
            reset        => reset,
            startEn      => startEn,
            gamePlayMode => gamePlayMode,
            bombLocation => bombLocation
        );
    
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
    
     
    
end architecture MineSweep_ARCH;
