
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Referee is
port(
    href, ref2, ref3, ref4 : in std_logic;
    vote :   out     std_logic 
    );
end Referee;

architecture Ref_Arch of Referee is
begin

vote <= (href and (not ref3) and ref4) 
        or (href and (not ref2) and ref4)
        or (href and ref3 and (not ref4)) 
        or ((not href) and ref2 and ref3 and ref4);

end Ref_Arch;
