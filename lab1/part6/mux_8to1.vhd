library ieee;
use ieee.std_logic_1164.all;

entity mux_8to1 is
	port(
		a, b, c, d, e, f, g, h, s0, s1, s2 : in std_logic;
		m : out std_logic);
end mux_8to1;

architecture arc of mux_8to1 is
component mux_2to1
	port(
		x, y, s : in std_logic;
		m : out std_logic);
end component;

signal ab, cd, ef, gh, abcd, efgh: std_logic;

begin
	m0: mux_2to1 port map(a, b, s0, ab);
	m1: mux_2to1 port map(c, d, s0, cd);
	m2: mux_2to1 port map(e, f, s0, ef);
	m3: mux_2to1 port map(g, h, s0, gh);
	m4: mux_2to1 port map(ab, cd, s1, abcd);
	m5: mux_2to1 port map(ef, gh, s1, efgh);
	m6: mux_2to1 port map(abcd, efgh, s2, m);
end arc;
