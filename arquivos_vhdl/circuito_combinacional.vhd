library ieee;
use ieee.std_logic_1164.all;

entity circuito_combinacional is
   port (S0, S1, EM, FU, WR, RD: in std_logic;
			CLR, LOAD, SOMA, SUBTRACAO, E0, E1: out std_logic);
end circuito_combinacional;

architecture logica of circuito_combinacional is

	signal sub, sum: std_logic;
	begin
	
		CLR <= not(S0) and not(S1);
		sub <= not(S0) and S1 and not(EM) and not(WR) and RD;
		sum <= not(S0) and S1 and not(FU) and WR and not(RD);
		E0 <= sub or sum;
		LOAD <= sum;
		SUBTRACAO <= sub;
		SOMA <= sum;
		E1 <= not(S1) or S0 or (not(FU) and not(WR)) or (not(FU) and RD) or (not(EM) and FU);
	
end logica;