library ieee;
use ieee.std_logic_1164.all;

entity flip_flop_4bit is
	port(
		data : in std_logic_vector(3 downto 0);
		clock, reset : in std_logic;
		q : out std_logic_vector(3 downto 0));
end flip_flop_4bit;

architecture arc of flip_flop_4bit is
	component flip_flop port(
		data, clock, reset : in std_logic;
		q : out std_logic);
	end component;

	begin
		ff3 : flip_flop port map(data(3), clock, reset, q(3));
		ff2 : flip_flop port map(data(2), clock, reset, q(2));
		ff1 : flip_flop port map(data(1), clock, reset, q(1));
		ff0 : flip_flop port map(data(0), clock, reset, q(0));
end arc;
