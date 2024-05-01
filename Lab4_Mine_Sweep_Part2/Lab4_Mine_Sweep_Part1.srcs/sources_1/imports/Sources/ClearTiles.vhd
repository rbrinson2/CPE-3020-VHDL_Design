-----------------------------------------------------------------
-- Class: CPE 3020
-- Student: Ryan Brinson
-- 
-- Date: 5/1/24
-- Design Name: Clear Tiles
-- Lab Name: Lab 4 - Mine Sweep
-- Target Devices: Basys 3
-- 
-- Description: 
-- When the module gets the signal that it is in gameplay mode,
-- it compares the bomblocation bus to the playermove bus. If
-- there is a difference then ClearTiles will either create a
-- mask to be sent to TileDriver, or it will send a signal 
-- out signalling that a hit has been detected.
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

--Clear-Tiles=========================================================== Entity
entity ClearTiles is
    port(
        ----------------------------------------------------------- Input Ports
        clock               : in std_logic;
        reset               : in std_logic;
        playerMoveSync      : in std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        finalBombLocations  : in std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        gamePlayMode        : in std_logic;
        
        ---------------------------------------------------------- Output Ports
        clearTilesMask      : out std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        hitDet              : out std_logic

    );
end entity ClearTiles;

--Clear-Tiles===================================================== Architecture
architecture ClearTiles_ARCH of ClearTiles is
    signal newMove : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);

    --Left-Clear----------------------------------------------------- Procedure
    -- Algorithmically sets individual bits in the vector to active
    --  starting at the players move location (i), increments
    --  and ends when it reaches an active bit or 15 on the 
    --  bombLocation vector.
    procedure ClearLeft(
        clear         : inout std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        bombLocations : in std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        i             : in integer range 0 to 15
    ) is
        variable j : integer range 0 to 15;
    begin
        j := i;
        while (bombLocations(j) /= '1') loop
            clear(j) := '1';
            if (j = 15) then
                exit;
            end if;
            j := j + 1;
        end loop;
    end procedure ClearLeft;

    --Right-Clear---------------------------------------------------- Procedure
    -- Algorithmically sets individual bits in the vector to active
    --  starting at the players move location (i), decrincrements
    --  and ends when it reaches an active bit or 0 on the 
    --  bombLocation vector.
    procedure ClearRight(
        clear         : inout std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        bombLocations : in std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        i             : in integer range 0 to 15
    ) is
        variable j : integer range 0 to 15;
    begin
        j := i;
        while (bombLocations(j) /= '1') loop
            clear(j) := '1';
            if (j = 0) then
                exit;
            end if;
            j := j - 1;
        end loop;
    end procedure ClearRight;

-------------------------------------------------------------------- Arch Begin    
begin
    --Edge-Detection--------------------------------------------------- Instant
    -- Creates an edge detection for each time playerMoveSycn
    --  changes and outputs it as newMove.
    PLAYER_EDGE : for i in playerMoveSync'range generate
        LEVEL_DETECT : entity work.LevelDetector
            port map(
                reset    => reset,
                clock    => clock,
                trigger  => playerMoveSync(i),
                pulseOut => newMove(i)
            );
    end generate PLAYER_EDGE;
    
    --Hit-Scan--------------------------------------------------------- Process
    -- When gamplayMode is active, this process compares the 
    --  location of the bombs with what move the player just
    --  made. If the move is the same as a bomb location,
    --  it activates hitDet, otherwise it calls the clearing
    --  procedures.
    HIT_SCAN : process (clock, reset) is
        variable clearTemp : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    begin
        if (reset = ACTIVE) then
            hitDet <= not ACTIVE;
            clearTemp := (others => '0'); 
        elsif rising_edge(clock) then
            if (gamePlayMode = not ACTIVE) then
                hitDet <= not ACTIVE;
                clearTemp := (others => '0'); 
            else 
                for i in finalBombLocations'reverse_range loop
                    if (finalBombLocations(i) = '1' and newMove(i) = '1') then
                        hitDet <= ACTIVE;
                    elsif (newMove(i) = '1') then
                        ClearLeft(clearTemp, finalBombLocations, i);
                        ClearRight(clearTemp, finalBombLocations, i);
                    end if;
                end loop;
            end if;
        end if;

        clearTilesMask <= clearTemp;
    end process HIT_SCAN;
    
    
    
end architecture ClearTiles_ARCH;
