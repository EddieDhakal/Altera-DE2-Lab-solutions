library ieee;
use ieee.std_logic_1164.all;

entity seven_segment_display is
port (   s: in std_logic_vector(2 downto 0);
			display : out std_logic_vector(6 downto 0)); 
end seven_segment_display;

architecture arc of seven_segment_display is
begin
  process (s) begin 
    case s is
	   when "000" => display <= "0001001" ;
		when "001" => display <= "0000110" ;
		when "010" => display <= "1000111" ;
		when "011" => display <= "1000000" ;
		when "100" => display <= "1111111" ;
		when "101" => display <= "1111111" ;
		when "110" => display <= "1111111" ;
		when "111" => display <= "1111111" ;
	 end case;
	end process;
end arc;
