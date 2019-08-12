library ieee;
use ieee.std_logic_1164.all;
entity bit_adderTest is end bit_adderTest;
architecture tb of bit_adderTest is
	 signal cin : std_logic;  -- inputs 
    signal cout : std_logic;  -- outputs
	 signal a,c,b: STD_LOGIC_VECTOR (3 downto 0);
begin
UUT : entity work.fbit_adder port map (a => a, b => b,cin =>cin, c => c, cout => cout);
	a <= ('0','0','0','1'), ('1','0','0','1') after 20 ns, ('0','1','1','0') after 40 ns, ('1','1','1','1') after 60 ns;
    b <= ('0','0','0','1'), ('1','1','1','1') after 40 ns;      
cin<='0','1' after 40 ns ;	 
end tb ;