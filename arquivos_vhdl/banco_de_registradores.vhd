library ieee;
use ieee.std_logic_1164.all;

entity banco_de_registradores is
   port (w_data: in std_logic_vector(12 downto 0);
			clk, clr, load, leitura: in  std_logic;
			contador, contador_clr: in std_logic_vector(3 downto 0);
         r_data: out std_logic_vector(15 downto 0));
end banco_de_registradores;

architecture logica of banco_de_registradores is
	component registrador_16_bits is
		port (d: in std_logic_vector(15 downto 0);
				clk, clr, load: in  std_logic;
				q: out std_logic_vector(15 downto 0));
	end component;
	
	component demux_1x16_16 is
		port (entry: in std_logic_vector(15 downto 0);
				sel: in  std_logic_vector(3 downto 0);
				saida0, saida1, saida2, saida3, saida4, saida5: out std_logic_vector(15 downto 0);
				saida6, saida7, saida8, saida9, saida10: out std_logic_vector(15 downto 0);
				saida11, saida12, saida13, saida14, saida15: out std_logic_vector(15 downto 0));
	end component;

	component demux_1x1_16 is
		port (entry: in std_logic;
				sel: in  std_logic_vector(3 downto 0);
				saida0, saida1, saida2, saida3, saida4, saida5: out std_logic;
				saida6, saida7, saida8, saida9, saida10: out std_logic;
				saida11, saida12, saida13, saida14, saida15: out std_logic);
	end component;
	
	component mux_16x16_1 is
		port (entry0, entry1, entry2, entry3, entry4, entry5: in std_logic_vector(15 downto 0);
				entry6, entry7, entry8, entry9, entry10, entry11: in std_logic_vector(15 downto 0);
				entry12, entry13, entry14, entry15: in std_logic_vector(15 downto 0);
				sel: in  std_logic_vector(3 downto 0);
				saida: out std_logic_vector(15 downto 0));
	end component;

	signal w_data_x: std_logic_vector(15 downto 0);
	
	signal w_data_00, w_data_01, w_data_02, w_data_03, w_data_04,
			 w_data_05, w_data_06, w_data_07, w_data_08, w_data_09,
			 w_data_10, w_data_11, w_data_12, w_data_13, w_data_14,
			 w_data_15: std_logic_vector(15 downto 0);
			 
	signal r_data_00, r_data_01, r_data_02, r_data_03, r_data_04,
			 r_data_05, r_data_06, r_data_07, r_data_08, r_data_09,
			 r_data_10, r_data_11, r_data_12, r_data_13, r_data_14,
			 r_data_15: std_logic_vector(15 downto 0);
			
	signal load0, load1, load2, load3, load4,
			 load5, load6, load7, load8, load9,
			 load10, load11, load12, load13, load14,
			 load15: std_logic;

	signal clear_leitura0, clear_leitura1, clear_leitura2, clear_leitura3, clear_leitura4,
			 clear_leitura5, clear_leitura6, clear_leitura7, clear_leitura8, clear_leitura9,
			 clear_leitura10, clear_leitura11, clear_leitura12, clear_leitura13, clear_leitura14,
			 clear_leitura15: std_logic;

	signal clear0, clear1, clear2, clear3, clear4,
			 clear5, clear6, clear7, clear8, clear9,
			 clear10, clear11, clear12, clear13, clear14,
			 clear15: std_logic;
	begin
	
	w_data_x <= '0' & '0' & '0' & w_data;
	
	demux2: demux_1x16_16 port map(w_data_x, contador, w_data_00, w_data_01, w_data_02, w_data_03, 
											 w_data_04, w_data_05, w_data_06, w_data_07, w_data_08, w_data_09,
											 w_data_10, w_data_11, w_data_12, w_data_13, w_data_14, w_data_15);
	
	demux1: demux_1x1_16 port map(load, contador, load0, load1, load2, load3, 
											load4, load5, load6, load7, load8, load9,
											load10, load11, load12, load13, load14, load15);
											
	demux0: demux_1x1_16 port map(leitura, contador_clr, clear_leitura0, 
											clear_leitura1, clear_leitura2, clear_leitura3, 
											clear_leitura4, clear_leitura5, clear_leitura6, 
											clear_leitura7, clear_leitura8, clear_leitura9,
											clear_leitura10, clear_leitura11, clear_leitura12, 
											clear_leitura13, clear_leitura14, clear_leitura15);
											

	
	clear0 <= clear_leitura0 or clr;
	clear1 <= clear_leitura1 or clr;
	clear2 <= clear_leitura2 or clr;
	clear3 <= clear_leitura3 or clr;
	clear4 <= clear_leitura4 or clr;
	clear5 <= clear_leitura5 or clr;
	clear6 <= clear_leitura6 or clr;
	clear7 <= clear_leitura7 or clr;
	clear8 <= clear_leitura8 or clr;
	clear9 <= clear_leitura9 or clr;
	clear10 <= clear_leitura10 or clr;
	clear11 <= clear_leitura11 or clr;
	clear12 <= clear_leitura12 or clr;
	clear13 <= clear_leitura13 or clr;
	clear14 <= clear_leitura14 or clr;
	clear15 <= clear_leitura15 or clr;

	register15: registrador_16_bits port map(w_data_15, clk, clear15, load15, r_data_15);
	register14: registrador_16_bits port map(w_data_14, clk, clear14, load14, r_data_14);
	register13: registrador_16_bits port map(w_data_13, clk, clear13, load13, r_data_13);
	register12: registrador_16_bits port map(w_data_12, clk, clear12, load12, r_data_12);
	register11: registrador_16_bits port map(w_data_11, clk, clear11, load11, r_data_11);
	register10: registrador_16_bits port map(w_data_10, clk, clear10, load10, r_data_10);
	register9: registrador_16_bits port map(w_data_09, clk, clear9, load9, r_data_09);
	register8: registrador_16_bits port map(w_data_08, clk, clear8, load8, r_data_08);
	register7: registrador_16_bits port map(w_data_07, clk, clear7, load7, r_data_07);
	register6: registrador_16_bits port map(w_data_06, clk, clear6, load6, r_data_06);
	register5: registrador_16_bits port map(w_data_05, clk, clear5, load5, r_data_05);
	register4: registrador_16_bits port map(w_data_04, clk, clear4, load4, r_data_04);
	register3: registrador_16_bits port map(w_data_03, clk, clear3, load3, r_data_03);
	register2: registrador_16_bits port map(w_data_02, clk, clear2, load2, r_data_02);
	register1: registrador_16_bits port map(w_data_01, clk, clear1, load1, r_data_01);
	register0: registrador_16_bits port map(w_data_00, clk, clear0, load0, r_data_00);
	
	
	mux: mux_16x16_1 port map(r_data_00, r_data_01, r_data_02, r_data_03, r_data_04,
									  r_data_05, r_data_06, r_data_07, r_data_08, r_data_09,
									  r_data_10, r_data_11, r_data_12, r_data_13, r_data_14,
									  r_data_15, contador, r_data);
		
end logica;