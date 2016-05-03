library ieee;
use ieee.std_logic_1164.all;

entity flip_flop is
	port(
		data, clock, reset : in std_logic;
		q : out std_logic);
end flip_flop;

architecture arc of flip_flop is
begin
	process (clock, reset)
	begin
		-- directly resetting makes it asynchronous
		if (reset = '1') then
			q <= '0';
		elsif falling_edge(clock) then
			q <= data;
		end if;
	end process;
end arc;
