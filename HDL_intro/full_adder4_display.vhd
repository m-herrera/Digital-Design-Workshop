library IEEE; use IEEE.STD_LOGIC_1164.all;

entity full_adder4_display is
	port(input1, input2: in STD_LOGIC_VECTOR(3 downto 0);
			cin: in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(6 downto 0);
			cout: out STD_LOGIC_VECTOR(1 downto 0));
end;

architecture struct of full_adder4_display is
	component full_adder4
		port(a, b: in STD_LOGIC_VECTOR(3 downto 0);
		cin: in STD_LOGIC;
		sum: out STD_LOGIC_VECTOR(3 downto 0);
		cout: out STD_LOGIC);
	end component;
	
	component seven_seg_decoder
		port(number: in STD_LOGIC_VECTOR(3 downto 0);
		segments: out STD_LOGIC_VECTOR(6 downto 0));
	end component;
	
signal sum_hex: STD_LOGIC_VECTOR(3 downto 0);
signal carry: STD_LOGIC;

begin
	adder: full_adder4
		port map (input1, input2, cin, sum_hex, carry);
		
	decoder: seven_seg_decoder
		port map (sum_hex, output);
		
	cout(1) <= NOT carry;
	cout(0) <= NOT carry;
end;
	
			