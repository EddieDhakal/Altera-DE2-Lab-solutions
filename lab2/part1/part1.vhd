library ieee;
use ieee.std_logic_1164.all;

entity part1 is
	port(
		sw : in std_logic_vector(15 downto 0);
		hex0 : out std_logic_vector(0 to 6);
		hex1 : out std_logic_vector(0 to 6);
		hex2 : out std_logic_vector(0 to 6);
		hex3 : out std_logic_vector(0 to 6);
		
		hex4 : out std_logic_vector(0 to 6);
		hex5 : out std_logic_vector(0 to 6);
		hex6 : out std_logic_vector(0 to 6);
		hex7 : out std_logic_vector(0 to 6));
end part1;

architecture arc of part1 is
component seven_segment_display
port(
	s: in std_logic_vector(3 downto 0);
	display : out std_logic_vector(6 downto 0));
end component;

begin
	d0 : seven_segment_display port map (sw(15 downto 12), hex3);
	d1 : seven_segment_display port map (sw(11 downto 8), hex2);
	d2 : seven_segment_display port map (sw(7 downto 4), hex1);
	d3 : seven_segment_display port map (sw(3 downto 0), hex0);
	
	-- make the unused hex displays blank
	d4 : seven_segment_display port map("1111", hex4);
	d5 : seven_segment_display port map("1111", hex5);
	d6 : seven_segment_display port map("1111", hex6);
	d7 : seven_segment_display port map("1111", hex7);
end arc;
