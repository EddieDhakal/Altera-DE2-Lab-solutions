library ieee;
use ieee.std_logic_1164.all;

entity part2 is
	port(
		sw : in std_logic_vector(17 downto 0);
		ledr : out std_logic_vector(17 downto 0);
		ledg : out std_logic_vector(7 downto 0));
end part2;

architecture arc of part2 is
component mux_2to1
	port(
		x, y, s : in std_logic;
		m : out std_logic);
end component;

begin
	m0: mux_2to1 port map(sw(7), sw(15), sw(17), ledg(7));
	m1: mux_2to1 port map(sw(6), sw(14), sw(17), ledg(6));
	m2: mux_2to1 port map(sw(5), sw(13), sw(17), ledg(5));
	m3: mux_2to1 port map(sw(4), sw(12), sw(17), ledg(4));
	m4: mux_2to1 port map(sw(3), sw(11), sw(17), ledg(3));
	m5: mux_2to1 port map(sw(2), sw(10), sw(17), ledg(2));
	m6: mux_2to1 port map(sw(1), sw( 9), sw(17), ledg(1));
	m7: mux_2to1 port map(sw(0), sw( 8), sw(17), ledg(0));
	
	ledr <= sw;
end arc;
