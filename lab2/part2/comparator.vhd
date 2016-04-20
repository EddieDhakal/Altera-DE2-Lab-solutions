library ieee;
use ieee.std_logic_1164.all;

entity comparator is
	port(
		v : in std_logic_vector(3 downto 0);
		z : out std_logic
	);
end comparator;

architecture arc of comparator is
begin
	-- by simplification we get
	-- z is true if the input is greater than decimal 9
	z <= (v(1) or v(2)) and v(3);
end arc;
