library ieee;
use ieee.std_logic_1164.all;
library work;
use work.components.all;

entity PAdder is
generic (N:integer:=4);
port(a, b:in std_logic_vector(N-1 downto 0);
	E,clk,cin: in std_logic;
	sum:buffer std_logic_vector(N-1 downto 0);
	cout:buffer std_logic;
	z: out std_logic);
end PAdder;

architecture PAdder of PAdder is
signal c: std_logic_vector(N-1 downto 0):=(others=>'0');
begin

	a1: FAdder port map (a(0),b(0),cin,E,clk,sum(0),c(0));
	a2: FAdder port map (a(1),b(1),c(0),E,clk,sum(1),c(1));
	a3: FAdder port map (a(2),b(2),c(1),E,clk,sum(2),c(2));
	a4: FAdder port map (a(3),b(3),c(2),E,clk,sum(3),cout);
	z<=(c(2) xor cout);
end PAdder;