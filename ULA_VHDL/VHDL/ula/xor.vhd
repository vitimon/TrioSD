library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;

	entity xr is
	Port ( A,B : in  STD_LOGIC_VECTOR (3 downto 0);
	    	 Y : out  STD_LOGIC_VECTOR (3 downto 0));
	end somador;
	end xor;

	architecture Behavioral of xr is

	begin
	
		Y <= A xor B;

	end Behavioral;

