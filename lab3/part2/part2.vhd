library ieee;
use ieee.std_logic_1164.all;

entity part2_main is
	port(
		sw : in std_logic_vector(1 downto 0);
		ledr : out std_logic_vector(1 downto 0));
end part2_main;

architecture arc of part2_main is
	component d_latch is
		port ( clk, d : in std_logic;
			q, qnot : out std_logic);
	end component;
	
	begin
		p: d_latch port map(sw(1), sw(0), ledr(0), ledr(1));
end arc;
