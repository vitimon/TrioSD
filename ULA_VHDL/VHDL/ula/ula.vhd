library IEEE;
	use IEEE.std_logic_1164.all;
	
	entity ula is port
	(
	   A,B         :  in   std_logic_vector(3 downto 0);
		Y      : out   std_logic_vector(3 downto 0);
		sel    :  in   std_logic_vector(2 downto 0)
	);
	end ula;
	
	architecture Behavioral of ula is
	
	component somador
		port(A,B : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
	component subtrator
		port(A,B : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
	component incremento
		port(A : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
	component inversor
		port(A : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
	component annd
		port(A,B : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
	component xr
		port(A,B : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
	component lbs
		port(A,B : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
	component rbs
		port(A,B : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
	begin
	process(A,B,sel)
	begin
			case sel is
			
			when "000" => Y <= -- somador
			when "001" => Y <= -- inversor
			when "010" => Y <= -- sub
			when "011" => Y <= -- incremento
			when "100" => Y <= -- xor
			when "101" => Y <= -- and
			when "110" => Y <= -- lsb
			when "111" => Y <= -- rsb
			
			end case;
	end process;
	
	end Behavioral;