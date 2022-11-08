library IEEE;
	use IEEE.std_logic_1164.all;
	
	entity ula is port
	(
	   A,B:  in   std_logic_vector(3 downto 0);
		Y      : out   std_logic_vector(3 downto 0);
		F : out std_logic_vector (3 downto 0);
		sel    :  in   std_logic_vector(2 downto 0)
	);
	
	end ula;
	
	architecture Behavioral of ula is
	
	component antecipador
		port(A,B : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
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
	
	component lbs
		port(A,B : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
	component rbs
		port(A,B : in   std_logic_vector(3 downto 0);  
			Y : out  std_logic_vector(3 downto 0));
	end component;
	
	signal AC: std_logic_vector(3 downto 0);
	signal sum,inverse,sub,incr,rs,ls: std_logic_vector(3 downto 0);
	signal seletor: std_logic_vector(2 downto 0):= "001";
	signal seg: std_logic_vector(3 downto 0):= "0100";
	signal Y0,Y1,Y2,Y3: std_logic;
	
	begin
	ax: antecipador port map(A,B,AC);
	aa: inversor port map(A,inverse);
	ab: subtrator port map(A,B,sub);
	ad: incremento port map(A,incr);
	s: somador port map(A,seg,sum);
	af: lbs port map(A,B, ls);
	ag: rbs port map(A,B, rs);
	
	process(A,B,seletor)
	begin			
			case seletor is
			
			when  "000" => Y <= sum;
							  Y3 <= sum(3);
							  F(0) <= not((sum(0) or sum(1)) or (sum(2) or sum(3)));
							  F(1) <= Y3; 
							  F(2) <= ((A(3) xnor B(3)) and AC(3));
							  F(3) <= ((A(3) xnor B(3)) and AC(3));
							   
			when "001" => Y <= inverse;-- inversor
							  F(0) <= ((A(0) and A(1)) and (A(2) and A(3)));
							  F(1) <= (A(3) and (A(1) or (A(2) or A(0))));  
							  F(2) <= A(3) and not((A(1) or (A(2) or A(0))));
							  F(3) <= '0';
			
			when "010" => Y <= sub; -- sub
							  F(0) <= (((A(0) xnor B(0)) and (A(1) xnor B(1))) and ((A(2) xnor B(2)) and (A(3) xnor B(3))));
			              F(1) <= sub(3);
							  F(2) <= ((A(3) xnor B(3)) and AC(3));
							  F(3) <= ((A(3) xnor B(3)) and AC(3));
							  
			when "011" => Y <= incr;-- incremento
							  F(0) <= ((A(0) and A(1)) and (A(2) and A(3)));
							  F(1) <= A(3) and not(((A(0) and A(1)) and (A(2) and A(3))));
							  F(2) <= not A(3) and (A(1) and (A(2) and A(3)));
							  F(3) <=((A(0) and A(1)) and (A(2) and A(3)));
			
			when "100" => Y <= A xor B;-- xor
							  F(0) <= (((A(0) xnor B(0)) and (A(1) xnor B(1))) and ((A(2) xnor B(2)) and (A(3) xnor B(3))));
						 	  F(1) <= '0';
							  F(2) <= '0';
							  F(3) <= '0';
			
			when "101" => Y <= AC;-- AC
							  F(0) <= not ((AC(0) and AC(1)) and (AC(2) and AC(3)));
							  F(1) <= '0';
							  F(2) <= AC(3);
							  F(3) <= AC(3);
			
			when "110" => Y <= ls;-- lsb
							  F(0) <= '0';
							  F(1) <= '0';
							  F(2) <= '0';
							  F(3) <= '0';
			
			when "111" => Y <= rs;-- rsb
							  F(0) <= '0';
							  F(1) <= '0';
							  F(2) <= '0';
							  F(3) <= '0';
			
			when others => Y <=  "0000" ;
			
			end case;
	end process;
	
	end Behavioral;