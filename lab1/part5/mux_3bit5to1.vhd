library ieee;
use ieee.std_logic_1164.all;

entity mux_3bit5to1 is
	port(
		uu, vv, ww, xx, yy : in std_logic_vector(2 downto 0);
		ss : in std_logic_vector(2 downto 0);
		mm : out std_logic_vector(2 downto 0));
end mux_3bit5to1;

architecture arc of mux_3bit5to1 is
component mux_5to1
	port(
		u, v, w, x, y, s0, s1, s2 : in std_logic;
		m : out std_logic);
end component;

begin
	m0 : mux_5to1 port map(uu(0), vv(0), ww(0), xx(0), yy(0), ss(0), ss(1), ss(2), mm(0));
	m1 : mux_5to1 port map(uu(1), vv(1), ww(1), xx(1), yy(1), ss(0), ss(1), ss(2), mm(1));
	m2 : mux_5to1 port map(uu(2), vv(2), ww(2), xx(2), yy(2), ss(0), ss(1), ss(2), mm(2));
end arc;
