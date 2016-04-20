library ieee;
use ieee.std_logic_1164.all;

entity part3 is
	port(
		sw		:	in std_logic_vector(8 downto 0);
		ledr	:	out std_logic_vector(8 downto 0);
		ledg	:	out std_logic_vector(4 downto 0));
end part3;

architecture arc of part3 is
component full_adder	port(
	x	: in std_logic;
	y	: in std_logic;
	ci	: in std_logic;
	co : out std_logic;
	s	: out std_logic);
end component;

signal a : std_logic_vector(3 downto 0);
signal b : std_logic_vector(3 downto 0);

-- initial default carry input, not sure why we want this but the question has asked to
signal ci_init : std_logic;
signal co : std_logic_vector(3 downto 0);
signal s : std_logic_vector(3 downto 0);

begin
	a <= sw(7 downto 4);
	b <= sw(3 downto 0);
	ci_init <= sw(8);
	
	d0 : full_adder port map(a(0), b(0), ci_init,	co(0), s(0));
	d1 : full_adder port map(a(1), b(1), co(0), 		co(1), s(1));
	d2 : full_adder port map(a(2), b(2), co(1), 		co(2), s(2));
	d3 : full_adder port map(a(3), b(3), co(2), 		co(3), s(3));
	
	ledg(3 downto 0) <= s;
	
	-- manually connect the ledg4 to the last carry out
	ledg(4) <= co(3);
	ledr <= sw;
end arc;
