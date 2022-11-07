library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;

	entity annd is
	Port ( A,B : in  STD_LOGIC_VECTOR (3 downto 0);
	    	 Y : out  STD_LOGIC_VECTOR (3 downto 0));
			 
   end annd;

	architecture Behavioral of annd is

	begin
	
		Y <= A and B;

	end Behavioral;


