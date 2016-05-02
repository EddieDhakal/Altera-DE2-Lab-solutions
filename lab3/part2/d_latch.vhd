library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
	port(
		clk, d : in std_logic;
		q : out std_logic);
end d_latch;

architecture arc of d_latch is

	signal r_g, s_g, qa, qb : std_logic ;

	attribute keep : boolean;
	attribute keep of r_g, s_g, qa, qb : signal is true;

	begin
		s_g <= d nand clk;
		r_g <= (not d) nand clk;
		qa <= s_g nand qb;
		qb <= r_g nand qa;

		q <= qa;

end arc;
