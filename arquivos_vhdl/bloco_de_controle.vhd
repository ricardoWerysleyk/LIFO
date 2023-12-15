library ieee;
use ieee.std_logic_1164.all;

entity bloco_de_controle is
   port (clk, clr_lifo, EM, FU, WR, RD: in std_logic;
			CLR, LOAD, SOMA, SUBTRACAO, E0, E1: out std_logic);
end bloco_de_controle;

architecture logica of bloco_de_controle is
	
	component MDE is
		port (E0, E1, clk, clr_lifo: in std_logic;
				S0, S1: out std_logic);
	end component;

	component circuito_combinacional is
		port (S0, S1, EM, FU, WR, RD: in std_logic;
				CLR, LOAD, SOMA, SUBTRACAO, E0, E1: out std_logic);
	end component;
	
	signal E, S: std_logic_vector(1 downto 0);
	
	begin
	C0: circuito_combinacional port map(S(0), S(1), EM, FU, WR, RD, CLR, LOAD, SOMA, SUBTRACAO, E(0), E(1));
	MDE0: MDE port map(E(0), E(1), clk, clr_lifo, S(0), S(1));
	E0 <= E(0);
	E1 <= E(1);
	
end logica;