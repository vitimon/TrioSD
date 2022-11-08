library IEEE;
	use IEEE.std_logic_1164.all;
	
	entity inversor is port
	(
	   A   :  in   std_logic_vector(3 downto 0);
	   Y   : out   std_logic_vector(3 downto 0)
	);

	end inversor;
	
	architecture Behavioral of inversor is
	
	component somador
		port(A,B : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
	signal sum: std_logic_vector(3 downto 0); 
	
	begin
		ax: somador port map((not A),"0001",sum);
	
	
		Y <= sum;
	
	end Behavioral;
