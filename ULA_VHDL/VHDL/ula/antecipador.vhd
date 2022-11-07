library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;

	entity antecipador is
		 Port ( A,B : in  STD_LOGIC_VECTOR (3 downto 0);
				  Y : out  STD_LOGIC_VECTOR (3 downto 0));
	end antecipador;

	architecture Behavioral of antecipador is
	signal S1,S2,S3: std_logic;
	
	begin
	Y (0) <= '0';
	S1 <= A(0) and B(0);
	Y(1) <= S1;
	S2 <= (((A(1) and B(1)) or S1) and (A(1) or B(1)));
	Y (2) <= S2;
	S3 <= ( ( (A (2) and B (2)) or S2) and (A (2) or B(2)));
	Y(3) <= S3;

	
	end Behavioral;

