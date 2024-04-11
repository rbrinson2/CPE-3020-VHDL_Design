library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.minesweeppackage.all;

entity Collision is
    port(
        clock : in std_logic;
        reset : in std_logic
    );
end entity Collision;


architecture Collisioin_ARCH of Collision is
    ---------- Constants
    constant ACTIVE     : std_logic := '1';
    constant EDGE       : std_logic_vector(3 downto 0) := "1111";
    constant ZERO       : std_logic_vector(BOMBBUSWIDTH - 1 downto 0) := (others => '0');
    constant BOMBSIZE   : integer := 5;
    constant DOUBLEWIDTH : std_logic := '1';
    constant SINGLEWIDTH : std_logic := '0';

    
    --BCD-to-One-Hot-------------------------------------------------- Function
    function bin2Hot(bombPos : std_logic_vector(4 downto 0))
        return std_logic_vector is
        variable oneHot : std_logic_vector(BOMBBUSWIDTH - 1 downto 0);
        variable position : integer range 0 to 2**bombPos'length;
    begin
        oneHot   := (others => '0'); 
        position := to_integer(unsigned(bombPos(3 downto 0)));
        for i in oneHot'range loop
            if (i = position) then
                -- Map the bomb to here
                oneHot(i) := ACTIVE;

                -- Check if it's a doublewide bomb and if it's at the edge
                if (bombPos(4) = DOUBLEWIDTH 
                    and bombPos(3 downto 0) = EDGE
                    ) then
                    -- If it is at the edge
                    oneHot(i - 1) := ACTIVE;
                else
                    -- If it's not at the edge
                    oneHot(i + 1) := ACTIVE;
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
    
end architecture Collisioin_ARCH;