library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;

	entity incremento is
		 Port ( A: in  STD_LOGIC_VECTOR (3 downto 0);
				  Y : out  STD_LOGIC_VECTOR (3 downto 0));
	end incremento;

	architecture Behavioral of incremento is

	component antecipador
		port(A,B : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
	signal Ya: std_logic_vector(3 downto 0); 
	
	begin
		ax: antecipador port map(A,"0001",Ya);
		
		Y(0) <= A(0) xor '1' xor Ya(0);
		Y(1) <= A(1) xor '0' xor Ya(1);
		Y(2) <= A(2) xor '0' xor Ya(2);
		Y(3) <= A(3) xor '0' xor Ya(3);
	

	end Behavioral;
