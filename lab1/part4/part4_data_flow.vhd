-- alternative implementation
library ieee;
use ieee.std_logic_1164.all;

entity part4_data_flow is
	port(
		sw : in std_logic_vector(2 downto 0);
		hex0 : out std_logic_vector(6 downto 0));
end part4_data_flow;

architecture arc of part4_data_flow is

signal a, b, c : std_logic;

begin
	a <= sw(2);
	b <= sw(1);
	c <= sw(0);
	
	-- simplified using boolean algebra
	hex0(0) <= a or not (c);
	hex0(1) <= a or (b xor c);
	hex0(2) <= a or (b xor c);
	hex0(3) <= a or (not b and not c);
	hex0(4) <= a;
	hex0(5) <= a;
	hex0(6) <= a or b;
end arc;
