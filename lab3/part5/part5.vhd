library ieee;
use ieee.std_logic_1164.all;

entity part5 is
	port(
		-- for setting the 16 bit numbers
		sw : in std_logic_vector(15 downto 0);
		
		-- key1 = clock input, key0 = active low asynchronous reset
		key : in std_logic_vector(1 downto 0);
		
		-- for displaying 16 bit hexadecimal value for input A
		hex7 : out std_logic_vector(0 to 6);
		hex6 : out std_logic_vector(0 to 6);
		hex5 : out std_logic_vector(0 to 6);
		hex4 : out std_logic_vector(0 to 6);
		
		-- for displaying 16 bit hexadecimal value for input B
		hex3 : out std_logic_vector(0 to 6);
		hex2 : out std_logic_vector(0 to 6);
		hex1 : out std_logic_vector(0 to 6);
		hex0 : out std_logic_vector(0 to 6));
end part5;

architecture arc of part5 is
	component flip_flop_4bit port(
		data : in std_logic_vector(3 downto 0);
		clock, reset : in std_logic;
		q : out std_logic_vector(3 downto 0));
	end component;
	
	component seven_segment_display port(
		s: in std_logic_vector(3 downto 0);
		display : out std_logic_vector(6 downto 0));
	end component;
	
	signal number3 : std_logic_vector(3 downto 0);
	signal number2 : std_logic_vector(3 downto 0);
	signal number1 : std_logic_vector(3 downto 0);
	signal number0 : std_logic_vector(3 downto 0);

	signal clock, reset : std_logic;
	
	begin
		clock <= key(1);
		reset <= not key(0);
	
		b3 : flip_flop_4bit port map (sw(15 downto 12), clock, reset, number3);
		b2 : flip_flop_4bit port map (sw(11 downto 8),  clock, reset, number2);
		b1 : flip_flop_4bit port map (sw(7 downto 4),   clock, reset, number1);
		b0 : flip_flop_4bit port map (sw(3 downto 0),   clock, reset, number0);
		
		n7 : seven_segment_display port map (number3, hex7);
		n6 : seven_segment_display port map (number2, hex6);
		n5 : seven_segment_display port map (number1, hex5);
		n4 : seven_segment_display port map (number0, hex4);
		
		n3 : seven_segment_display port map (sw(15 downto 12), hex3);
		n2 : seven_segment_display port map (sw(11 downto 8),  hex2);
		n1 : seven_segment_display port map (sw(7  downto 4),  hex1);
		n0 : seven_segment_display port map (sw(3  downto 0),  hex0);
end arc;
