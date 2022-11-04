library IEEE;
	use IEEE.std_logic_1164.all;
	
	entity antecipador is port
	(
	   A,B : in   std_logic_vector(3 downto 0);  
	   Y : out  std_logic_vector(3 downto 0)
	);

	end antecipador;
	
	architecture structural of antecipador is
	begin
		Y(0) <= '0';
		Y(1) <= A(0) AND B(0);
		Y(2) <= (((A(1) AND B(1)) OR Y(1)) AND (A(1) OR B(1)));
		Y(3) <= (((A(2) AND B(2)) OR Y(2)) AND (A(2) OR B(2)));
	
	end structural;