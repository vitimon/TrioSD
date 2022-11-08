library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rbs is
port(A,B : in   std_logic_vector(3 downto 0);  
			  Y : out  std_logic_vector(3 downto 0));
end rbs;

architecture Behavioral of rbs is

begin
Y(3) <= ((not B(1)) and (not B(0)) and A(3));
Y(2) <= (((not B(1)) and (not B(0)) and A(2)) or (((not B(1)) and B(0)) and A(3)));
Y(1) <= (((not B(1)) and (not B(0)) and A(1))  or (((not B(1)) and B(0)) and A(2)) or ((B(1) and (not B(0))) and A(3)));
Y(0) <= (((not B(1)) and (not B(0)) and A(0))  or (((not B(1)) and B(0)) and A(1)) or ((B(1) and (not B(0))) and A(2)) or  ((B(1) and B(0)) and A(3)));



end Behavioral;

