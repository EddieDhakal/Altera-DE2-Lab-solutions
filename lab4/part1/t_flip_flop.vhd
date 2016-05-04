library ieee;
use ieee.std_logic_1164.all;

entity t_flip_flop is
	port(
		t, clock, reset : in std_logic;
		q : out std_logic);
end t_flip_flop;

architecture arc of t_flip_flop is
	signal temp_q : std_logic;

	begin
		process (t, clock, reset) begin
			if reset = '0' then
				temp_q <= '0';
			elsif rising_edge(clock) and t = '1' then
				temp_q <= not temp_q;
			end if;
			
			q <= temp_q;
		end process;
end architecture;
