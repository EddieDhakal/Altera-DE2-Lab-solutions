library ieee;
use ieee.std_logic_1164.all;

entity part1 is
	port(
		sw : in std_logic_vector(17 downto 0);
		ledr : out std_logic_vector(17 downto 0));
end part1;

architecture arc of part1 is
begin
	ledr <= sw;
end arc;
