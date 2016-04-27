library ieee;
use ieee.std_logic_1164.all;

entity comparator is
	port(
		v : in std_logic_vector(4 downto 0);
		z : out std_logic
	);
end comparator;

architecture arc of comparator is
begin
	z <= v(4) or (v(3) and (v(2) or v(1)));
end arc;
