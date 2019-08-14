library IEEE; use IEEE.STD_LOGIC_1164.all;

entity full_adder4_display_test is
end;

architecture sim of full_adder4_display_test is

	component full_adder4_display port(input1, input2: in STD_LOGIC_VECTOR(3 downto 0);
										cin: in STD_LOGIC;
										output: out STD_LOGIC_VECTOR(6 downto 0);
										cout: out STD_LOGIC);
	end component;
	
	signal a, b: STD_LOGIC_VECTOR(3 downto 0);
	signal cin: STD_LOGIC;
	signal display: STD_LOGIC_VECTOR(6 downto 0);
	signal cout: STD_LOGIC;

begin
	dut: full_adder4_display port map(a, b, cin, display, cout);
	
	
	process begin	
		a <= x"5"; b <= x"7"; cin <= '0'; wait for 10 ns;
		a <= x"1"; b <= x"2"; cin <= '1'; wait for 10 ns;
		a <= x"5"; b <= x"7"; cin <= '0'; wait for 10 ns;
		a <= x"8"; b <= x"9"; cin <= '0'; wait for 10 ns;
		a <= x"0"; b <= x"1"; cin <= '0'; wait for 10 ns;
		wait;
	end process;
end;