library ieee;
use ieee.std_logic_1164.all;

entity mux_5to1 is
	port(
		u, v, w, x, y, s0, s1, s2 : in std_logic;
		m : out std_logic);
end mux_5to1;

architecture arc of mux_5to1 is
component mux_2to1
	port(
		x, y, s : in std_logic;
		m : out std_logic);
end component;

signal uv, wx, uvwx : std_logic;

begin
	m0: mux_2to1 port map(u, v, s0, uv);
	m1: mux_2to1 port map(w, x, s0, wx);
	m2: mux_2to1 port map(uv, wx, s1, uvwx);
	m3: mux_2to1 port map(uvwx, y, s2, m);
end arc;
