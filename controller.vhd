library ieee;
use ieee.std_logic_1164.all;

entity controller is
port(clk,s,rst,z: in std_logic; -- s=start
	Done,Er,Ea,rstR,Ec: out std_logic; -- r=reg , a=adder , d=num
	state: out std_logic_vector (1 downto 0));
end controller;

architecture controller of controller is
type states is (s1,s2,s3);
signal currentState,nextState:states:=s1;

begin

process (CLK,rst)
begin
	if (rst='1') then
		currentState<=s1;
	elsif(rising_edge(clk)) then
		currentState<=nextState;
	end if;
end process;

process (currentState,s)
	begin

	case currentState is
		when s1=>
			state<="01";
			Er <= '0';
			Ea <= '0';
			Done<='0';
			rstR <='1';
			Ec<='0';
			if(s='0') then
				nextState<=s1;
			elsif(s='1') then
				nextState<=s2;
			end if;
			
		when s2=>
			state<="10";
			Er<='1';
			Ea<='1';
			rstR<='0';
			Ec<='1';
			Done<='0';
			if (z='1') then
				nextState<=s3;
				Er<='0';
				Ea<='0';
			elsif (z='0') then
				nextState<=s2;
			end if;
			
		when s3=>
			state<="11";
			Er<='0';
			Ea<='0';
			Ec<='0';
			rstR<='0';
			Done<='1';
			if(s='1') then
				nextState<=s3;
			else
				nextState<=s1;
		end if;
		end case;
	end process;
end controller;