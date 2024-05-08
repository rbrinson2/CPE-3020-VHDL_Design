-------- Libraries -------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-------- Entity -------
entity Referee is
port(
    ----- In -----
    --The 4 different refs, cleverly named
    href, ref2, ref3, ref4 : in std_logic;

    ----- Out -----
    --The outcome of the vote
    vote : out std_logic 
    );
end Referee;

------- Architectures -------

architecture Ref_Arch of Referee is
    ----- Declarations -----
    
begin
    ----- Statements -----

    --Logic to decide the outcome
    vote <= (href and ref2)
            or (href and ref3)
            or (ref2 and ref3 and ref4)
            or (href and not ref2 and ref4);

end Ref_Arch;
