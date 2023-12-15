library ieee;
use ieee.std_logic_1164.all;

entity registrador_16_bits is
   port (d: in std_logic_vector(15 downto 0);
			clk, clr, load: in  std_logic;
         q: out std_logic_vector(15 downto 0));
end registrador_16_bits;

architecture logica of registrador_16_bits is
	component mux_2x1 is
		port (A, B, sel: in  std_logic;
				saida: out std_logic);
	end component;
	
	component ffd is
		port (ck, clr, set, d : in  std_logic;
				q : out std_logic);
	end component;
	
	signal entrada_mux, saida_mux: std_logic_vector(15 downto 0);

	begin
		
		M15: mux_2x1 port map(entrada_mux(15), d(15), load, saida_mux(15));
		FFD15: ffd port map(clk, clr, '1', saida_mux(15), entrada_mux(15));
		M14: mux_2x1 port map(entrada_mux(14), d(14), load, saida_mux(14));
		FFD14: ffd port map(clk, clr, '1', saida_mux(14), entrada_mux(14));
		M13: mux_2x1 port map(entrada_mux(13), d(13), load, saida_mux(13));
		FFD13: ffd port map(clk, clr, '1', saida_mux(13), entrada_mux(13));
		M12: mux_2x1 port map(entrada_mux(12), d(12), load, saida_mux(12));
		FFD12: ffd port map(clk, clr, '1', saida_mux(12), entrada_mux(12));
		M11: mux_2x1 port map(entrada_mux(11), d(11), load, saida_mux(11));
		FFD11: ffd port map(clk, clr, '1', saida_mux(11), entrada_mux(11));
		M10: mux_2x1 port map(entrada_mux(10), d(10), load, saida_mux(10));
		FFD10: ffd port map(clk, clr, '1', saida_mux(10), entrada_mux(10));
		M9: mux_2x1 port map(entrada_mux(9), d(9), load, saida_mux(9));
		FFD9: ffd port map(clk, clr, '1', saida_mux(9), entrada_mux(9));
		M8: mux_2x1 port map(entrada_mux(8), d(8), load, saida_mux(8));
		FFD8: ffd port map(clk, clr, '1', saida_mux(8), entrada_mux(8));
		M7: mux_2x1 port map(entrada_mux(7), d(7), load, saida_mux(7));
		FFD7: ffd port map(clk, clr, '1', saida_mux(7), entrada_mux(7));
		M6: mux_2x1 port map(entrada_mux(6), d(6), load, saida_mux(6));
		FFD6: ffd port map(clk, clr, '1', saida_mux(6), entrada_mux(6));
		M5: mux_2x1 port map(entrada_mux(5), d(5), load, saida_mux(5));
		FFD5: ffd port map(clk, clr, '1', saida_mux(5), entrada_mux(5));
		M4: mux_2x1 port map(entrada_mux(4), d(4), load, saida_mux(4));
		FFD4: ffd port map(clk, clr, '1', saida_mux(4), entrada_mux(4));
		M3: mux_2x1 port map(entrada_mux(3), d(3), load, saida_mux(3));
		FFD3: ffd port map(clk, clr, '1', saida_mux(3), entrada_mux(3));
		M2: mux_2x1 port map(entrada_mux(2), d(2), load, saida_mux(2));
		FFD2: ffd port map(clk, clr, '1', saida_mux(2), entrada_mux(2));
		M1: mux_2x1 port map(entrada_mux(1), d(1), load, saida_mux(1));
		FFD1: ffd port map(clk, clr, '1', saida_mux(1), entrada_mux(1));
		M0: mux_2x1 port map(entrada_mux(0), d(0), load, saida_mux(0));
		FFD0: ffd port map(clk, clr, '1', saida_mux(0), entrada_mux(0));
		
		q <= entrada_mux;
		
end logica;