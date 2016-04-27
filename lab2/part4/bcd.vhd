library ieee;
use ieee.std_logic_1164.all;

entity bcd is port(
	binary_input :	in std_logic_vector(3 downto 0);
	bcd_output	 :	out std_logic_vector(3 downto 0));
end bcd;

architecture arc of bcd is
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

	--signal v	: std_logic_vector(3 downto 0);
	signal circuit_a_output : std_logic_vector(2 downto 0);
	signal mux_input2 : std_logic_vector(3 downto 0);

	-- output of the comparator is used as a selector for muxes and input for circuit b
	signal z	: std_logic;
	--signal m	: std_logic_vector(3 downto 0);
	
begin
	mux_input2(3) <= '0'; -- as displayed on the diagram input2 for m3 is 0
	
	c : comparator port map(binary_input, z);
	
	ca : circuit_a port map(binary_input(2 downto 0), circuit_a_output);
	mux_input2(2 downto 0) <= circuit_a_output;
	
	mux: mux_4bit2to1 port map(binary_input, mux_input2, z, bcd_output);
end arc;
