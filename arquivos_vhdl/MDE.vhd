library ieee;
use ieee.std_logic_1164.all;

entity MDE is
   port (E0, E1, clk, clr_lifo: in std_logic;
			S0, S1: out std_logic);
end MDE;

architecture logica of MDE is
	
	component ffd is
		port (ck, clr, set, d: in  std_logic;
				q: out std_logic);
	end component;
	
	begin
	ff1: ffd port map(clk, not(clr_lifo), '1', E1, S1);
	ff0: ffd port map(clk, not(clr_lifo), '1', E0, S0);
	
end logica;