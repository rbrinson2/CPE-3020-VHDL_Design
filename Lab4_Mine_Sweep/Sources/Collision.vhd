library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

entity Collision is
    port(
        ---------- Input Ports
        clock : in std_logic;
        reset : in std_logic;
        bomb1 : in std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb2 : in std_logic_vector(BOMBSIZE - 1 downto 0);
        bomb3 : in std_logic_vector(BOMBSIZE - 1 downto 0);

        ---------- Ouput Ports
        finalBombLocations : out std_logic_vector(BOMBBUSWIDTH - 1 downto 0)

    );
end entity Collision;


architecture Collisioin_ARCH of Collision is
    ---------- Constants
    constant ACTIVE     : std_logic := '1';
    constant EDGE       : integer := 15;
    constant DOUBLEWIDTH : std_logic := '1';
    constant ZERO : std_logic_vector(BOMBBUSWIDTH - 1 downto 0) := X"0000";

    --Collision-Resolution-------------------------------------------- Function
    procedure collisionRes(
        bomb2Hot    : inout std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        bomb3Hot    : inout std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        bomb1Mask   : in std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        bomb2Mask   : inout std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        bomb3Mask   : in std_logic_vector(BOMBBUSWIDTH - 1 downto 0)
    ) 
    is
        variable bomb12Collision  : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable bomb12Mask       : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable bomb123Collision : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable max              : integer range 0 to 15;
        variable min              : integer range 0 to 15;
        variable diff             : integer range 0 to 15;
    begin
        diff := 0;
        max := 0;
        min := 15;
        bomb12Collision := bomb1Mask and bomb2Hot;
        if (bomb12Collision /= ZERO) then
            for i in bomb1Mask'reverse_range loop
                if (bomb1Mask(i) = ACTIVE) then
                    max := i;
                end if;
            end loop;
            for i in bomb2Hot'range loop
                if (bomb1Mask(i) = ACTIVE) then
                    min := i;
                end if;
            end loop;    
            diff := max - min + 1;
            bomb2Hot := bomb2Hot((diff - 1) downto 0) & bomb2Hot(15 downto diff);
            bomb2Mask := bomb2Hot 
                        or bomb2Hot(bomb2Hot'length - 2 downto 0) & '0'
                        or '0' & bomb2Hot(bomb2Hot'length - 1 downto 0);
            
        end if;
        
        diff :=0;
        max := 0;
        min := 15;

        bomb12Mask := bomb1Mask or bomb2Mask;
        bomb123Collision := bomb12Mask and bomb3Mask;
        if (bomb123Collision /= ZERO) then
            for i in bomb12Mask'reverse_range loop
                if (bomb1Mask(i) = ACTIVE) then
                    max := i;
                end if;
            end loop;
            for i in bomb3Hot'range loop
                if (bomb12Mask(i) = ACTIVE) then
                    min := i;
                end if;
            end loop;  
            diff := max - min + 1; 
            bomb3Hot := bomb3Hot((diff - 1) downto 0) & bomb3Hot(15 downto diff); 
        end if;
    end procedure collisionRes;
    
    --BCD-to-One-Hot-------------------------------------------------- Function
    function bin2Hot(bombPos : std_logic_vector(4 downto 0))
        return std_logic_vector is
        variable oneHot : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable position : integer range 0 to 2**bombPos'length - 1;
    begin
        oneHot   := (others => '0'); 
        position := to_integer(unsigned(bombPos(3 downto 0)));
        for i in oneHot'range loop
            if (i = position) then
                -- Map the bomb to here
                oneHot(i) := ACTIVE;

                -- Check if it's a doublewide bomb and if it's at the edge
                if (bombPos(4) = DOUBLEWIDTH) then
                    if (position >= EDGE) then
                        null;
                    else
                        oneHot(i + 1) := ACTIVE;
                    end if;
                end if;
            end if;
        end loop;
        return oneHot;
    end function bin2Hot;

    --Mask-Generator-------------------------------------------------- Function
    function maskGen(bomb : std_logic_vector(BOMBBUSWIDTH - 1 downto 0))
        return std_logic_vector is
        variable mask : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable leftShift : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable rightShift : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    begin
        leftShift := bomb(bomb'length - 2 downto 0) & '0';
        rightShift := '0' & bomb(bomb'length - 1 downto 1);
        mask := bomb or leftShift or rightShift;

        return mask;
    end function maskGen;
begin

    COLL_DET : process (clock, reset) is
        variable bomb1Hot   : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable bomb2Hot   : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable bomb3Hot   : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable bomb1Mask  : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable bomb2Mask  : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable bomb3Mask  : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
    begin
        if (reset = ACTIVE) then
            finalBombLocations <= (others => '0'); 
            bomb1Hot    := (others => '0'); 
            bomb2Hot    := (others => '0'); 
            bomb3Hot    := (others => '0'); 
            bomb1Mask   := (others => '0');
            bomb2Mask   := (others => '0');
            bomb3Mask   := (others => '0');
        elsif rising_edge(clock) then
            bomb1Hot := bin2Hot(bomb1);
            bomb2Hot := bin2Hot(bomb2);
            bomb3Hot := bin2Hot(bomb3);

            bomb1Mask := maskGen(bomb1Hot);
            bomb2Mask := maskGen(bomb2Hot);
            bomb3Mask := maskGen(bomb3Hot);


            collisionRes(
                bomb2Hot,
                bomb3Hot,
                bomb1Mask,
                bomb2Mask,
                bomb3Mask
            );
            finalBombLocations <= bomb1Hot or bomb2Hot or bomb3Hot;

        end if;
    end process COLL_DET;
    
    
end architecture Collisioin_ARCH;
