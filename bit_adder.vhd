library ieee;
use ieee.std_logic_1164.all;
entity bit_adder is port (a,b,cin: in STD_LOGIC;
									c,cout : out STD_LOGIC);
end bit_adder;
architecture Behavioral of bit_adder is
begin

		c<= (not a and not b and cin) or ( a and not b and not cin) or (b and not a and not cin) or( a and b and cin);
		cout <= (a and b) or (b and cin) or (cin and a);
	
end architecture Behavioral;