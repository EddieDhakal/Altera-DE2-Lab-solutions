library ieee;
use ieee.std_logic_1164.all;

entity part2_main is
	port(
		sw : in std_logic_vector(1 downto 0);
		ledr : out std_logic_vector(0 downto 0));
end part2_main;

architecture arc of part2_main is
	signal e, d, q : std_logic;

	component d_latch is
		port ( clk, d : in std_logic;
			q : out std_logic);
	end component;
	
	begin
		p: d_latch port map(e, d, q);
		
		e <= sw(1);
		d <= sw(0);
		ledr(0) <= q;
end arc;
