library IEEE; use IEEE.STD_LOGIC_1164.all;

entity full_adder4 is
	port(a, b: in STD_LOGIC_VECTOR(3 downto 0);
		cin: in STD_LOGIC;
		sum: out STD_LOGIC_VECTOR(3 downto 0);
		cout: out STD_LOGIC);
end;

architecture struct of full_adder4 is
		component full_adder
		port(a, b, cin: in STD_LOGIC;
			s, cout: out STD_LOGIC);
		end component;
	
	
signal c1, c2, c3: STD_LOGIC;

begin
	adder0: full_adder
		port map(a(0), b(0), cin, sum(0), c1);
		
	adder1: full_adder
		port map(a(1), b(1), c1, sum(1), c2);
		
	adder2: full_adder
		port map(a(2), b(2), c2, sum(2), c3);
		
	adder3: full_adder
		port map(a(3), b(3), c3, sum(3), cout);
		
end;
		