library ieee;
use ieee.std_logic_1164.all;

entity part3 is
	port(
		sw : in std_logic_vector(1 downto 0);
		ledr : out std_logic_vector(0 downto 0));
end part3;

architecture arc of part3 is
	signal qm : std_logic ;
	
	component d_flip_flop is
		port ( clk, d : in std_logic;
			q : out std_logic);
	end component;
	
	begin
		master : d_flip_flop port map(not sw(1), sw(0), qm);
		slave  : d_flip_flop port map(sw(1), qm, ledr(0));
end arc;
