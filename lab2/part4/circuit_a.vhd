library ieee;
use ieee.std_logic_1164.all;

entity circuit_a is
	port(
		v : in std_logic_vector(4 downto 0);
		output : out std_logic_vector(3 downto 0));
end circuit_a;

architecture arc of circuit_a is
begin
	output(3) <= v(4) and v(1);
	output(2) <= (v(4) and (not v(1))) or (v(2) and v(1));
	output(1) <= not v(1);
	output(0) <= v(0);
end arc;
