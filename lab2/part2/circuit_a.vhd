library ieee;
use ieee.std_logic_1164.all;

entity circuit_a is
	port(
		v : in std_logic_vector(2 downto 0);
		output : out std_logic_vector(2 downto 0));
end circuit_a;

architecture arc of circuit_a is
begin
	output(0) <= v(0);
	output(1) <= not v(1);
	output(2) <= v(1) and v(2);
end arc;