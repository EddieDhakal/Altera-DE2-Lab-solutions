library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1 is
	port(
		x, y, s : in std_logic;
		m : out std_logic);
end mux_2to1;

architecture arc of mux_2to1 is
begin
	m <= (not (s) and x) or (s and y);
end arc;
