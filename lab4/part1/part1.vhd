library ieee;
use ieee.std_logic_1164.all;

entity part1 is
	port(
		key  : in std_logic_vector(0 downto 0);
		sw   : in std_logic_vector(1 downto 0);
		
		hex0 : out std_logic_vector(0 to 6);
		hex1 : out std_logic_vector(0 to 6);
		
		-- switch off the remaining hex displays
		hex2 : out std_logic_vector(0 to 6);
		hex3 : out std_logic_vector(0 to 6);
		hex4 : out std_logic_vector(0 to 6);
		hex5 : out std_logic_vector(0 to 6);
		hex6 : out std_logic_vector(0 to 6);
		hex7 : out std_logic_vector(0 to 6));
end part1;

architecture arc of part1 is
	component t_flip_flop is port(
		t, clock, reset : in std_logic;
		q : out std_logic);
	end component;
	
	component seven_segment_display is port(
		s: in std_logic_vector(3 downto 0);
		display : out std_logic_vector(6 downto 0));
	end component;
	
	signal enable : std_logic_vector(7 downto 0);
	signal clock, reset: std_logic;
	signal q : std_logic_vector(7 downto 0);
	
	begin
		clock <= not key(0);
		reset <= not sw(0);
		
		enable(0) <= sw(1);
		d0 : t_flip_flop port map (enable(0), clock, reset, q(0));
		
		enable(1) <= enable(0) and q(0);
		d1 : t_flip_flop port map (enable(1), clock, reset, q(1));
		
		enable(2) <= enable(1) and q(1);
		d2 : t_flip_flop port map (enable(2), clock, reset, q(2));
		
		enable(3) <= enable(2) and q(2);
		d3 : t_flip_flop port map (enable(3), clock, reset, q(3));
		
		enable(4) <= enable(3) and q(3);
		d4 : t_flip_flop port map (enable(4), clock, reset, q(4));
		
		enable(5) <= enable(4) and q(4);
		d5 : t_flip_flop port map (enable(5), clock, reset, q(5));
		
		enable(6) <= enable(5) and q(5);
		d6 : t_flip_flop port map (enable(6), clock, reset, q(6));
		
		enable(7) <= enable(6) and q(6);
		d7 : t_flip_flop port map (enable(7), clock, reset, q(7));
		
		display0 : seven_segment_display port map (q(3 downto 0), hex0);
		display1 : seven_segment_display port map (q(7 downto 4), hex1);
		
		-- switch off the unused hex displays
		display2 : seven_segment_display port map ("1111", hex2);
		display3 : seven_segment_display port map ("1111", hex3);
		display4 : seven_segment_display port map ("1111", hex4);
		display5 : seven_segment_display port map ("1111", hex5);
		display6 : seven_segment_display port map ("1111", hex6);
		display7 : seven_segment_display port map ("1111", hex7);
end arc;
