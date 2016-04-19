library ieee;
use ieee.std_logic_1164.all;

entity part4 is
port (   sw: in std_logic_vector(2 downto 0);
			hex0 : out std_logic_vector(6 downto 0)); 
end part4;

architecture arc of part4 is
begin
  process (sw) begin 
    case sw is
	   when "000" => hex0 <= "0001001" ;
		when "001" => hex0 <= "0000110" ;
		when "010" => hex0 <= "1000111" ;
		when "011" => hex0 <= "1000000" ;
		when "100" => hex0 <= "1111111" ;
		when "101" => hex0 <= "1111111" ;
		when "110" => hex0 <= "1111111" ;
		when "111" => hex0 <= "1111111" ;
	 end case;
	end process;
end arc;
