library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
   port(
		enabled, clock, reset : in  std_logic;
		q : out std_logic_vector(15 downto 0));
end counter;

architecture arc of counter is
   signal temp_q: std_logic_vector(15 downto 0);
	
   begin
      process (enabled, clock, reset) begin
         if reset = '0' then
            temp_q <= "0000000000000000"; -- 16 0s
         elsif rising_edge(clock) and enabled = '1' then
            temp_q <= temp_q + 1;
         end if;
      end process;
		
      q <= temp_q;
end arc;
