library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1 is
   port (A, B, sel: in  std_logic;
         saida: out std_logic);
end mux_2x1;

architecture logica of mux_2x1 is
	begin
		process (sel, A, B)
			begin
				case sel is
					when '0' => saida <= A;
					when '1' => saida <= B;
				end case;
		end process;
end logica;