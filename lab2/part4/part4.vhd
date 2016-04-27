library ieee;
use ieee.std_logic_1164.all;

entity part4 is
	port(
		sw		:	in std_logic_vector(8 downto 0);
		ledr	:	out std_logic_vector(8 downto 0);
		ledg	:	out std_logic_vector(7 downto 0);
		
		-- for BCD sum
		hex0  : out std_logic_vector(0 to 6);
		hex1  : out std_logic_vector(0 to 6);
		
		-- for BCD input
		hex4  : out std_logic_vector(0 to 6);
		hex6  : out std_logic_vector(0 to 6);
		
		-- for switching off the remaining displays
		hex2  : out std_logic_vector(0 to 6);
		hex3  : out std_logic_vector(0 to 6);
		hex5  : out std_logic_vector(0 to 6);
		hex7  : out std_logic_vector(0 to 6));
end part4;

architecture arc of part4 is
	component mux_4bit2to1 port(
		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		s : in std_logic;
		m : out std_logic_vector(3 downto 0));
	end component;
	
	component comparator port(
		v : in std_logic_vector(4 downto 0);
		z : out std_logic);
	end component;
	
	component circuit_a port(
		v : in std_logic_vector(4 downto 0);
		output : out std_logic_vector(3 downto 0));
	end component;
	
	component circuit_b port(
		z			: in std_logic;
		dispplay	: out std_logic_vector(0 to 6));
	end component;
	
	component seven_segment_display port(
		s			: in std_logic_vector(3 downto 0);
		display	: out std_logic_vector(6 downto 0));
	end component;

	component full_adder	port(
		x	: in std_logic;
		y	: in std_logic;
		ci	: in std_logic;
		co : out std_logic;
		s	: out std_logic);
	end component;
	
	component error_check port(
		bcd : in std_logic_vector(3 downto 0);
		error : out std_logic);
	end component;
	
	signal a : std_logic_vector(3 downto 0);
	signal b : std_logic_vector(3 downto 0);
	
	signal ci_init : std_logic;
	signal co : std_logic_vector(3 downto 0);
	signal s : std_logic_vector(4 downto 0);
	
	signal z : std_logic;
	signal circuit_a_output : std_logic_vector(3 downto 0);
	signal m	: std_logic_vector(3 downto 0);
	
	signal error, error0, error1 : std_logic;
	signal digit0, digit1 : std_logic_vector(0 to 6);
	
begin
	a <= sw(7 downto 4);
	b <= sw(3 downto 0);
	ci_init <= sw(8);
	
	d0 : full_adder port map(a(0), b(0), ci_init,	co(0), s(0));
	d1 : full_adder port map(a(1), b(1), co(0), 		co(1), s(1));
	d2 : full_adder port map(a(2), b(2), co(1), 		co(2), s(2));
	d3 : full_adder port map(a(3), b(3), co(2), 		co(3), s(3));
	
	s(4) <= co(3);
	
	ec0 : error_check port map(sw(7 downto 4), error0);
	ec1 : error_check port map(sw(3 downto 0), error1);
	
	error <= error0 or error1;
	-- switch off the green leds when there is an error
	ledg(4 downto 0) <= "00000" when (error = '1') else s;
	-- except the one used to indicate error
	ledg(7) <= error;
	
	ledr <= sw;
	
	comp0 : comparator port map(s, z);
	
	ca : circuit_a port map(s, circuit_a_output);
	mux: mux_4bit2to1 port map(s(3 downto 0), circuit_a_output, z, m);	
	
	disp0 : seven_segment_display port map(m, digit0);
	disp1 : circuit_b port map(z, digit1);

	-- switch off the hex displays when there is an error
	hex0 <= "1111111" when (error = '1') else digit0;
	hex1 <= "1111111" when (error = '1') else digit1;
	
	disp4 : seven_segment_display port map(sw(3 downto 0), hex4);
	disp6 : seven_segment_display port map(sw(7 downto 4), hex6);
	
	-- switch off the unused displays
	disp2 : seven_segment_display port map("1111", hex2);
	disp3 : seven_segment_display port map("1111", hex3);
	disp5 : seven_segment_display port map("1111", hex5);
	disp7 : seven_segment_display port map("1111", hex7);
end arc;
