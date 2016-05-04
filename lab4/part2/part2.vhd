library ieee;
use ieee.std_logic_1164.all;

entity part2 is
	port(		
		key : in std_logic_vector(0 downto 0);
		sw  : in std_logic_vector(1 downto 0);
		
		hex0 : out std_logic_vector(0 to 6);
		hex1 : out std_logic_vector(0 to 6);
		hex2 : out std_logic_vector(0 to 6);
		hex3 : out std_logic_vector(0 to 6));
end part2;

architecture arc of part2 is
	component counter port(
		enabled, clock, reset : in  std_logic;
		q : out std_logic_vector(15 downto 0));
	end component;
	
	component seven_segment_display port(
		s: in std_logic_vector(3 downto 0);
		display : out std_logic_vector(6 downto 0));
	end component;

	signal enable, clock, reset: std_logic;
	signal q : std_logic_vector(15 downto 0);
	
	begin
		enable <= sw(1);
		clock  <= not key(0);
		reset  <= not sw(0);
		
		c : counter port map (enable, clock, reset, q);
		
		display0 : seven_segment_display port map (q( 3 downto  0), hex0);
		display1 : seven_segment_display port map (q( 7 downto  4), hex1);
		display2 : seven_segment_display port map (q(11 downto  8), hex2);
		display3 : seven_segment_display port map (q(15 downto 12), hex3);
end arc;
