library IEEE; use IEEE.STD_LOGIC_1164.all;

entity fbit_adder is
port(a, b: in STD_LOGIC_VECTOR(3 downto 0);
cin: in STD_LOGIC;
cout: out STD_LOGIC;
c: out STD_LOGIC_VECTOR(3 downto 0));

end fbit_adder;
architecture Behavioral of fbit_adder is
signal carry : STD_LOGIC_VECTOR(2 downto 0);

begin
	fadd : entity   work.bit_adder port map(a(0),b(0),cin,c(0),carry(0));
	sadd:entity   work.bit_adder port map(a(1),b(1),carry(0),c(1),carry(1));
	tadd: entity  work.bit_adder port map(a(2),b(2),carry(1),c(2),carry(2));
	foadd: entity   work.bit_adder port map(a(3),b(3),carry(2),c(3),cout);
	
end architecture Behavioral;

