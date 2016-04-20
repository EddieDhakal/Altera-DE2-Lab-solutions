library ieee;
use ieee.std_logic_1164.all;

entity part2 is
	port(
		sw	  : in std_logic_vector(3 downto 0);
		hex0 : out std_logic_vector(0 to 6);
		hex1 : out std_logic_vector(0 to 6);
		
		hex2 : out std_logic_vector(0 to 6);
		hex3 : out std_logic_vector(0 to 6);
		hex4 : out std_logic_vector(0 to 6);
		hex5 : out std_logic_vector(0 to 6);
		hex6 : out std_logic_vector(0 to 6);
		hex7 : out std_logic_vector(0 to 6));
end part2;

architecture arc of part2 is
	component mux_4bit2to1 port(
		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		s : in std_logic;
		m : out std_logic_vector(3 downto 0));
	end component;

	component comparator port(
		v : in std_logic_vector(3 downto 0);
		z : out std_logic);
	end component;

	component circuit_a port(
		v : in std_logic_vector(2 downto 0);
		output : out std_logic_vector(2 downto 0));
	end component;

	component circuit_b port(
		z			: in std_logic;	-- output from comparator
		dispplay	: out std_logic_vector(0 to 6));
	end component;

	component seven_segment_display port(
		s			: in std_logic_vector(3 downto 0);
		display	: out std_logic_vector(6 downto 0));
	end component;

	signal v	: std_logic_vector(3 downto 0);	-- v3 to v0
	signal circuit_a_output : std_logic_vector(2 downto 0);
	signal mux_input2 : std_logic_vector(3 downto 0);
	
	-- output of the comparator is used as a selector for muxes and input for circuit b
	signal z	: std_logic;
	signal m	: std_logic_vector(3 downto 0);

begin
	v <= sw(3 downto 0);
	mux_input2(3) <= '0'; -- as displayed on the diagram input2 for m3 is 0
	
	c : comparator port map(v, z);
	
	ca : circuit_a port map(v(2 downto 0), circuit_a_output);
	mux_input2(2 downto 0) <= circuit_a_output;
	
	mux: mux_4bit2to1 port map(v, mux_input2, z, m);
	
	d0 : seven_segment_display port map(m, hex0);
	d1 : circuit_b port map(z, hex1);
	
	-- switch the remaining hex displays off
	--	so it becomes more readable.
	d2 : seven_segment_display port map("1111", hex2);
	d3 : seven_segment_display port map("1111", hex3);
	d4 : seven_segment_display port map("1111", hex4);
	d5 : seven_segment_display port map("1111", hex5);
	d6 : seven_segment_display port map("1111", hex6);
	d7 : seven_segment_display port map("1111", hex7);
end arc;
