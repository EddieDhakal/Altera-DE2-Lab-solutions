library ieee;
use ieee.std_logic_1164.all;

entity circuit_b is
	port(
		z			: in std_logic;
		dispplay	: out std_logic_vector(0 to 6));
end circuit_b;

architecture arc of circuit_b is
begin
	process (z) begin 
		if z = '0' then
			dispplay <= "0000001";
		else
			dispplay <= "1001111";
		end if;
	end process;
end arc;
