library ieee;
use ieee.std_logic_1164.all;

entity error_check is
	port(
		bcd : in std_logic_vector(3 downto 0);
		error : out std_logic);
end error_check;

architecture arc of error_check is

begin
	error <= bcd(3) and (bcd(2) or bcd(1));
end arc;
