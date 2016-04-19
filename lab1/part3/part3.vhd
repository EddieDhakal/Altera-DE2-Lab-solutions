library ieee;
use ieee.std_logic_1164.all;

entity part3 is
	port(
		sw : in std_logic_vector(17 downto 0);
		ledr : out std_logic_vector(17 downto 0);
		ledg : out std_logic_vector(2 downto 0));
end part3;

architecture arc of part3 is
component mux_5to1
	port(
		u, v, w, x, y, s0, s1, s2 : in std_logic;
		m : out std_logic);
end component;

begin
	-- switches 14 to 12 = u inputs, switches 11 to 9 = v inputs etc
	-- sw(15) = s0, sw(16) = s1, sw(17) = s2
	m0 : mux_5to1 port map(sw(14), sw(11), sw(8), sw(5), sw(2), sw(15), sw(16), sw(17), ledg(2));
	m1 : mux_5to1 port map(sw(13), sw(10), sw(7), sw(4), sw(1), sw(15), sw(16), sw(17), ledg(1));
	m2 : mux_5to1 port map(sw(12), sw( 9), sw(6), sw(3), sw(0), sw(15), sw(16), sw(17), ledg(0));

	ledr <= sw;
end arc;
