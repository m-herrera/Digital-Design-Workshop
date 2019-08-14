library IEEE; use IEEE.STD_LOGIC_1164.all;

entity full_adder_test is
end;

architecture sim of full_adder_test is

	component full_adder port(a, b, cin: in STD_LOGIC;
										s, cout: out STD_LOGIC);
	end component;
	
	signal a, b, cin, s, cout: STD_LOGIC;

begin
	dut: full_adder port map(a, b, cin, s, cout);
	
	process begin	
		a <= '0'; b <= '0'; cin <= '0'; wait for 10 ns;
		a <= '1'; b <= '0'; cin <= '0'; wait for 10 ns;
		a <= '1'; b <= '1'; cin <= '0'; wait for 10 ns;
		a <= '0'; b <= '1'; cin <= '0'; wait for 10 ns;
		a <= '0'; b <= '0'; cin <= '1'; wait for 10 ns;
		a <= '1'; b <= '0'; cin <= '1'; wait for 10 ns;
		a <= '1'; b <= '1'; cin <= '1'; wait for 10 ns;
		a <= '0'; b <= '1'; cin <= '1'; wait for 10 ns;
		wait;
	end process;
end;