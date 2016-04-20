library ieee;
use ieee.std_logic_1164.all;

entity part4 is
	port(
		d, clk : in std_logic;
		q1, q1not : out std_logic;
		q2, q2not : out std_logic;
		q3, q3not : out std_logic);
end part4;

architecture arc of part4 is
begin
	process (d, clk)
	begin
		if clk = '1' then
			q1 <= d;
			q1not <= not d;
		end if;
	end process;
 
	process (clk)
	begin
		if rising_edge(clk) then
			q2 <= d ;
			q2not <= not d;
		end if;
	end process;

	process (clk)
	begin
		if falling_edge(clk) then
			q3 <= d;
			q3not <= not d;
		end if;
	end process;
end arc;
