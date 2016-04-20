library ieee;
use ieee.std_logic_1164.all;

entity mux_3bit8to1 is
	port(
		aa, bb, cc, dd, ee, ff, gg, hh : in std_logic_vector(2 downto 0);
		ss : in std_logic_vector(2 downto 0);
		mm : out std_logic_vector(2 downto 0));
end mux_3bit8to1;

architecture arc of mux_3bit8to1 is
component mux_8to1
	port(
		a, b, c, d, e, f, g, h, s0, s1, s2 : in std_logic;
		m : out std_logic);
end component;

begin
	m0 : mux_8to1 port map(aa(0), bb(0), cc(0), dd(0), ee(0), ff(0), gg(0), hh(0), ss(0), ss(1), ss(2), mm(0));
	m1 : mux_8to1 port map(aa(1), bb(1), cc(1), dd(1), ee(1), ff(1), gg(1), hh(1), ss(0), ss(1), ss(2), mm(1));
	m2 : mux_8to1 port map(aa(2), bb(2), cc(2), dd(2), ee(2), ff(2), gg(2), hh(2), ss(0), ss(1), ss(2), mm(2));
end arc;
