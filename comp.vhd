library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity comp is
generic (N:integer:=4);
port(i, num:in std_logic_vector (N-1 downto 0);
	E,clk: in std_logic;
	Done: out std_logic);
end comp;

architecture comp of comp is
begin
process (clk)
begin
	if (rising_edge(Clk) and E='1') then
		if(i < num ) then
			Done <= '0';
		else
			Done <= '1';
		end if;
	end if;
end process;
end comp;