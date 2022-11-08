
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lbs is
port(A,B : in   std_logic_vector(3 downto 0);  
			  Y : out  std_logic_vector(3 downto 0));
end lbs;

architecture Behavioral of lbs is

begin
Y(0) <= ((not B(1)) and (not B(0)) and A(0));
Y(1) <= (((not B(1)) and (not B(0)) and A(1)) or (((not B(1)) and B(0)) and A(0)));
Y(2) <= (((not B(1)) and (not B(0)) and A(2))  or (((not B(1)) and B(0)) and A(1)) or ((B(1) and (not B(0))) and A(0)));
Y(3) <= (((not B(1)) and (not B(0)) and A(3))  or (((not B(1)) and B(0)) and A(2)) or ((B(1) and (not B(0))) and A(1)) or  ((B(1) and B(0)) and A(0)));


end Behavioral;

