library IEEE;
	use IEEE.std_logic_1164.all;
	
	entity inversor is port
	(
	   A   :  in   std_logic_vector(3 downto 0);
	   Y   : out   std_logic_vector(3 downto 0)
	);

	end inversor;
	
	architecture Behavioral of inversor is
	
	begin
	
		Y <= (NOT A); --- faltando somador
	
	end Behavioral;
