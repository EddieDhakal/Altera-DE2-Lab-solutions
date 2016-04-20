library ieee;
use ieee.std_logic_1164.all;

entity seven_segment_display is
	port (s: in std_logic_vector(3 downto 0);
			display : out std_logic_vector(6 downto 0));
end seven_segment_display;

architecture arc of seven_segment_display is
begin
  process (s) begin 
    case s is
	   when "0000" => display <= "0000001";
		when "0001" => display <= "1001111";
		when "0010" => display <= "0010010";
		when "0011" => display <= "0000110";
		when "0100" => display <= "1001100";
		when "0101" => display <= "0100100";
		when "0110" => display <= "0100000";
		when "0111" => display <= "0001111";
		when "1000" => display <= "0000000";
		when "1001" => display <= "0000100";
		when "1010" => display <= "1111111";
		when "1011" => display <= "1111111";
		when "1100" => display <= "1111111";
		when "1101" => display <= "1111111";
		when "1110" => display <= "1111111";
		when "1111" => display <= "1111111";
	 end case;
	end process;
end arc;
