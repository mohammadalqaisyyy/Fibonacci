library ieee;
use ieee.std_logic_1164.all;
library work;
use work.components.all;

entity Fibonacci is
generic (N:integer:=4);
port(start,Clk,R: in std_logic;
	num: in std_logic_vector (N-1 downto 0);
	Fnum: out std_logic_vector (2*N downto 0);
	Done: out std_logic;
	state: out std_logic_vector (1 downto 0));
end Fibonacci;


architecture Fibonacci of Fibonacci is
signal I: std_logic_vector(N-1 downto 0):=(others=>'0');
signal f,s,t: std_logic_vector(2*N downto 0):=(others=>'0');
signal Er,Ea,rstR,Ec: std_logic;
signal Lf,Ls,Lt,z: std_logic;
begin

	control: controller port map (Clk,start,R,z,Done,Er,Ea,rstR,Ec,state);

	reg1: reg generic map (N=>N) port map(rstR,Er,clk,f,s,t,I); -- rst, E, clk, Lf, Ls, Lt , f,s,t,I
	Fnum<=t;
	
	com : comp  generic map(N=>N) port map (I,num,Ec,clk,z); -- i, num, E, clk, Done
	
end Fibonacci;