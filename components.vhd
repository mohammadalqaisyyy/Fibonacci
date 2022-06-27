library ieee;
use ieee.std_logic_1164.all;

package components is

component FAdder is
port(a, b , cin:in std_logic;
	E,clk: in std_logic;
	sum, cout: out std_logic);
end component;

component reg is
generic (N:integer:=4);
port(rst,E,clk: in std_logic;
	f,s,t:buffer std_logic_vector(2*N downto 0);
	I:buffer std_logic_vector(N-1 downto 0));
end component;

component comp is
generic (N:integer:=4);
port(i, num:in std_logic_vector (N-1 downto 0);
	E,clk: in std_logic;
	Done: out std_logic);
end component;

component controller is
port(clk,s,rst,z: in std_logic; -- s=start
	Done,Er,Ea,rstR,Ec: out std_logic; -- r=reg , a=adder , d=num
	state: out std_logic_vector (1 downto 0));
end component;

end components;