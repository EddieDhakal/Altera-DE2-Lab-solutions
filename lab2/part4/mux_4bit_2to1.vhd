library ieee;
use ieee.std_logic_1164.all;

entity mux_4bit2to1 is
	port(
		a, b : in std_logic_vector(3 downto 0);
		s : in std_logic;
		m : out std_logic_vector(3 downto 0));
end mux_4bit2to1;

architecture arc of mux_4bit2to1 is
component mux_2to1
	port(
		x, y, s : in std_logic;
		m : out std_logic);
end component;

begin
	m0 : mux_2to1 port map(a(0), b(0), s, m(0));
	m1 : mux_2to1 port map(a(1), b(1), s, m(1));
	m2 : mux_2to1 port map(a(2), b(2), s, m(2));
	m3 : mux_2to1 port map(a(3), b(3), s, m(3));
end arc;
