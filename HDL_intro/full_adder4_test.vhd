library IEEE; use IEEE.STD_LOGIC_1164.all;

entity full_adder4_test is
end;

architecture sim of full_adder4_test is

	component full_adder4 port(a, b: in STD_LOGIC_VECTOR(3 downto 0);
										cin: in STD_LOGIC;
										sum: out STD_LOGIC_VECTOR(3 downto 0);
										cout: out STD_LOGIC);
	end component;
	
	signal a, b, sum: STD_LOGIC_VECTOR(3 downto 0);
	signal cin: STD_LOGIC;
	signal cout: STD_LOGIC;

begin
	dut: full_adder4 port map(a, b, cin, sum, cout);
	
	
	process begin	
		a <= x"5"; b <= x"7"; cin <= '0'; wait for 10 ns;
		a <= x"1"; b <= x"2"; cin <= '1'; wait for 10 ns;
		a <= x"5"; b <= x"7"; cin <= '0'; wait for 10 ns;
		a <= x"8"; b <= x"9"; cin <= '0'; wait for 10 ns;
		a <= x"0"; b <= x"1"; cin <= '0'; wait for 10 ns;
		wait;
	end process;
end;