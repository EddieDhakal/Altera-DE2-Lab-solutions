library ieee;

use ieee.std_logic_1164.all;

entity part6 is
	port(
		sw : in std_logic_vector(17 downto 0);
		hex0 : out std_logic_vector(6 downto 0);
		hex1 : out std_logic_vector(6 downto 0);
		hex2 : out std_logic_vector(6 downto 0);
		hex3 : out std_logic_vector(6 downto 0);
		hex4 : out std_logic_vector(6 downto 0);
		hex5 : out std_logic_vector(6 downto 0);
		hex6 : out std_logic_vector(6 downto 0);
		hex7 : out std_logic_vector(6 downto 0));
end part6;

architecture arc of part6 is
component mux_3bit8to1
	port(
		aa, bb, cc, dd, ee, ff, gg, hh : in std_logic_vector(2 downto 0);
		ss : in std_logic_vector(2 downto 0);
		mm : out std_logic_vector(2 downto 0));
end component;

component seven_segment_display
	port(
		s: in std_logic_vector(2 downto 0);
		display : out std_logic_vector(6 downto 0));
end component;

signal mm0, mm1, mm2, mm3, mm4, mm5, mm6, mm7 : std_logic_vector(2 downto 0);
signal blank : std_logic_vector(2 downto 0);

begin
	blank <= "111";
	
	--									000					001					010					011					100					101					110					111					selectors			3 bit output
	m0: mux_3bit8to1 port map(	blank,				blank,				blank,				sw(14 downto 12),	sw(11 downto 9),	sw(8 downto 6),	sw(5 downto 3),	sw(2 downto 0),	sw(17 downto 15), mm0);
	m1: mux_3bit8to1 port map(	blank,				blank,				sw(14 downto 12),	sw(11 downto 9),	sw(8 downto 6),	sw(5 downto 3),	sw(2 downto 0),	blank,				sw(17 downto 15), mm1);
	m2: mux_3bit8to1 port map(	blank,				sw(14 downto 12),	sw(11 downto 9),	sw(8 downto 6),	sw(5 downto 3),	sw(2 downto 0),	blank,				blank,				sw(17 downto 15), mm2);
	m3: mux_3bit8to1 port map(	sw(14 downto 12), sw(11 downto 9), 	sw(8 downto 6), 	sw(5 downto 3),	sw(2 downto 0),	blank,				blank,				blank,				sw(17 downto 15), mm3);
	m4: mux_3bit8to1 port map(	sw(11 downto 9), 	sw(8 downto 6), 	sw(5 downto 3), 	sw(2 downto 0),	blank,				blank,				blank,				sw(14 downto 12),	sw(17 downto 15), mm4);
	m5: mux_3bit8to1 port map(	sw(8 downto 6), 	sw(5 downto 3), 	sw(2 downto 0), 	blank,				blank,				blank,				sw(14 downto 12),	sw(11 downto 9),	sw(17 downto 15), mm5);
	m6: mux_3bit8to1 port map(	sw(5 downto 3), 	sw(2 downto 0), 	blank,				blank,				blank,				sw(14 downto 12),	sw(11 downto 9),	sw(8 downto 6),	sw(17 downto 15), mm6);
	m7: mux_3bit8to1 port map(	sw(2 downto 0), 	blank,				blank,				blank,				sw(14 downto 12),	sw(11 downto 9),	sw(8 downto 6),	sw(5 downto 3),	sw(17 downto 15), mm7);
	
	-- use the 3 bit output from above to feed into the corresponding 7 segment hex display
	h0: seven_segment_display port map(mm0, hex7);
	h1: seven_segment_display port map(mm1, hex6);
	h2: seven_segment_display port map(mm2, hex5);
	h3: seven_segment_display port map(mm3, hex4);
	h4: seven_segment_display port map(mm4, hex3);
	h5: seven_segment_display port map(mm5, hex2);
	h6: seven_segment_display port map(mm6, hex1);
	h7: seven_segment_display port map(mm7, hex0);
end architecture;
