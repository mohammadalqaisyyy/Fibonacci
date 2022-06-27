library ieee;
use ieee.std_logic_1164.all;

entity FAdder is
port(a, b , cin:in std_logic;
	E,clk: in std_logic;
	sum, cout: out std_logic);
end FAdder;

architecture FAdder of FAdder is
begin
process (clk)
begin
	if (rising_edge(Clk) and E='1') then
		sum <= ((a xor b) xor cin);
		cout <= ((a xor b) and cin) or (a and b);
	end if;
end process;
end FAdder;