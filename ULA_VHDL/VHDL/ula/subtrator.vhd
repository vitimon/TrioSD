library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;

	entity subtrator is
		 Port ( A,B : in  STD_LOGIC_VECTOR (3 downto 0);
				  Y : out  STD_LOGIC_VECTOR (3 downto 0));
	end subtrator;

	architecture Behavioral of subtrator is

	component somador
		port(A,B : in   std_logic_vector(3 downto 0);  
			  Y : out  std_logic_vector(3 downto 0));
	end component;
	
	component inversor
		port(A : in   std_logic_vector(3 downto 0);  
			  Y : out  std_logic_vector(3 downto 0));
	end component;
	
	
	signal Ya, Ys: std_logic_vector(3 downto 0);

	begin
		ax: inversor port map(B,Ya);
		as: somador port map(A,Ya,Ys);
		Y <= Ys;
		
	end Behavioral;



