library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
		x	: in std_logic;
		y	: in std_logic;
		ci	: in std_logic;
		co	: out std_logic;
		s	: out std_logic);
end full_adder;

architecture arc of full_adder is
begin
	-- found out using boolean algebra
	s <= x xor y xor ci;
	co <= (ci and (x xor y)) or (x and y);
end arc;
