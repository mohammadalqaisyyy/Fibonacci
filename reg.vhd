library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg is
generic (N:integer:=4);
port(rst,E,clk: in std_logic;
	f,s,t:buffer std_logic_vector(2*N downto 0);
	I:buffer std_logic_vector(N-1 downto 0));
end reg;

architecture reg of reg is

begin
process (clk)
variable ft: std_logic_vector(2*N downto 0):=(others=>'0');
variable st,tt: std_logic_vector(2*N downto 0):="000000001";
begin
	if(rst = '1') then
		I<="0010";
		f<="000000000";
		s<= "000000001";
	elsif (rising_edge(Clk) and E='1') then
			t <= tt;
			f <= ft;
			s <= st;
			tt := ft + st;
			ft := st;
			st := tt;
			I <= I + '1';
		end if;
end process;
end reg;