

architecture DATA_FLOW of ent is
begin
    led1 <= sw1 or sw2 or sw3;
    led2 <= (sw1 and sw2) or (sw1 and sw3) or ()
end architecture;

architecture STRUCTURAL of ent is
    component Or3Input is
      port (
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        x: out std_logic
      );
    end component;
begin

    G1: Or3Input()
end architecture;