library ieee;
use ieee.std_logic_1164.all;

entity mux_16x16_1 is
   port (entry0, entry1, entry2, entry3, entry4, entry5: in std_logic_vector(15 downto 0);
			entry6, entry7, entry8, entry9, entry10, entry11: in std_logic_vector(15 downto 0);
			entry12, entry13, entry14, entry15: in std_logic_vector(15 downto 0);
			sel: in  std_logic_vector(3 downto 0);
         saida: out std_logic_vector(15 downto 0));
end mux_16x16_1;

architecture logica of mux_16x16_1 is
	begin
		process (sel, entry0, entry1, 
					entry2, entry3, entry4, 
					entry5, entry6, entry7, 
					entry8, entry9, entry10, 
					entry11, entry12, entry13, 
					entry14, entry15)
			begin
				case sel is
					when "0000" => saida <= entry0;
					when "0001" => saida <= entry1;
					when "0010" => saida <= entry2;
					when "0011" => saida <= entry3;
					when "0100" => saida <= entry4;
					when "0101" => saida <= entry5;
					when "0110" => saida <= entry6;
					when "0111" => saida <= entry7;
					when "1000" => saida <= entry8;
					when "1001" => saida <= entry9;
					when "1010" => saida <= entry10;
					when "1011" => saida <= entry11;
					when "1100" => saida <= entry12;
					when "1101" => saida <= entry13;
					when "1110" => saida <= entry14;
					when "1111" => saida <= entry15;
				end case;
		end process;
end logica;