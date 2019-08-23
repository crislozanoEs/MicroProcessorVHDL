--*****************************************************--
--		  PONTIFICIA UNIVERSIDAD JAVERIANA                --
--				CIRCUITOS LÓGICOS 	             	        --
--			Seccion de Tecnicas Digitales	                 --
-- Nombres  										              --
-- Titulo   							  							  --
-- Fecha  											 				  --
--                                                      --
--******************************************************--

--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all;

--******************************************************--
-- DEFINICIÓN DE ENTIDAD                                --
--******************************************************--

entity RegistroRespuesta is
port(
	 Control_RegistroRespuesta: in std_logic_vector(0 to 3); --0 enable paralelo, 1 enable serie, 2 reset, 3 guardar numero B
	 reloj:in std_logic;
	 Suma_RegistroRespuesta: in std_logic_vector(0 to 7);
	 BitsControl: out std_logic_vector(0 to 1);
	 RegistroNumero_RegistroRespuesta: in std_logic_vector(0 to 7);
	 RegistroRespuesta_Respuesta: out std_logic_vector(0 to 16)	 
	  );
end Entity RegistroRespuesta;              

--Definicion de la arquitectura 
--******************************************************--
--DEFINICIÓN DE ARQUITECTURA                                        --
--******************************************************--

architecture RegistroRespuestaArch of RegistroRespuesta is

component dffe
port(
	d,clk,clrn,prn,ena: IN std_logic;
	Q: OUT std_logic
); end component;

--******************************************************--
--DEFINICIÓN DE SEÑALES DE CONEXIÓN                                         --
--******************************************************--

--signal NOMBRE1_NOMBRE2_CABLE: <TIPO DE DATO>;
signal control: std_logic;
signal RegistroRespuestaC: std_logic_vector(0 to 16);
--******************************************************--
--Instancias y Conectividad
--******************************************************
begin
control<= Control_RegistroRespuesta(0) or Control_RegistroRespuesta(1) or Control_RegistroRespuesta(3);
RegistroRespuesta_Respuesta<=RegistroRespuestaC;
Reg1: dffe port map((Suma_RegistroRespuesta(0) and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(0) and Control_RegistroRespuesta(1)), reloj, '1', '1',Control,RegistroRespuestaC(0));
Reg2: dffe port map((Suma_RegistroRespuesta(1) and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(0) and Control_RegistroRespuesta(1)), reloj, '1', '1',Control,RegistroRespuestaC(1));
Reg3: dffe port map((Suma_RegistroRespuesta(2) and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(1) and Control_RegistroRespuesta(1)), reloj, '1', '1',Control,RegistroRespuestaC(2));
Reg4: dffe port map((Suma_RegistroRespuesta(3) and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(2) and Control_RegistroRespuesta(1)), reloj, '1', '1',Control,RegistroRespuestaC(3));
Reg5: dffe port map((Suma_RegistroRespuesta(4) and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(3) and Control_RegistroRespuesta(1)), reloj, '1', '1',Control,RegistroRespuestaC(4));
Reg6: dffe port map((Suma_RegistroRespuesta(5) and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(4) and Control_RegistroRespuesta(1)), reloj, '1', '1',Control,RegistroRespuestaC(5));
Reg7: dffe port map((Suma_RegistroRespuesta(6) and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(5) and Control_RegistroRespuesta(1)), reloj, '1', '1',Control,RegistroRespuestaC(6));
Reg8: dffe port map((Suma_RegistroRespuesta(7) and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(6) and Control_RegistroRespuesta(1)), reloj, '1', '1',Control,RegistroRespuestaC(7));

Reg9:  dffe port map((RegistroRespuestaC(8)   and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(7)  and Control_RegistroRespuesta(1)) or (RegistroNumero_RegistroRespuesta(0) and Control_RegistroRespuesta(3)), reloj, not Control_RegistroRespuesta(2), '1',Control,RegistroRespuestaC(8));
Reg10: dffe port map((RegistroRespuestaC(9)   and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(8)  and Control_RegistroRespuesta(1)) or (RegistroNumero_RegistroRespuesta(1) and Control_RegistroRespuesta(3)), reloj, not Control_RegistroRespuesta(2), '1',Control,RegistroRespuestaC(9));
Reg11: dffe port map((RegistroRespuestaC(10)  and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(9)  and Control_RegistroRespuesta(1)) or (RegistroNumero_RegistroRespuesta(2) and Control_RegistroRespuesta(3)), reloj, not Control_RegistroRespuesta(2), '1',Control,RegistroRespuestaC(10));
Reg12: dffe port map((RegistroRespuestaC(11)  and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(10) and Control_RegistroRespuesta(1)) or (RegistroNumero_RegistroRespuesta(3) and Control_RegistroRespuesta(3)), reloj, not Control_RegistroRespuesta(2), '1',Control,RegistroRespuestaC(11));
Reg13: dffe port map((RegistroRespuestaC(12)  and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(11) and Control_RegistroRespuesta(1)) or (RegistroNumero_RegistroRespuesta(4) and Control_RegistroRespuesta(3)), reloj, not Control_RegistroRespuesta(2), '1',Control,RegistroRespuestaC(12));
Reg14: dffe port map((RegistroRespuestaC(13)  and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(12) and Control_RegistroRespuesta(1)) or (RegistroNumero_RegistroRespuesta(5) and Control_RegistroRespuesta(3)), reloj, not Control_RegistroRespuesta(2), '1',Control,RegistroRespuestaC(13));
Reg15: dffe port map((RegistroRespuestaC(14)  and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(13) and Control_RegistroRespuesta(1)) or (RegistroNumero_RegistroRespuesta(6) and Control_RegistroRespuesta(3)), reloj, not Control_RegistroRespuesta(2), '1',Control,RegistroRespuestaC(14));
Reg16: dffe port map((RegistroRespuestaC(15)  and Control_RegistroRespuesta(0)) or (RegistroRespuestaC(14) and Control_RegistroRespuesta(1)) or (RegistroNumero_RegistroRespuesta(7) and Control_RegistroRespuesta(3)), reloj, not Control_RegistroRespuesta(2), '1',Control,RegistroRespuestaC(15));

Reg17: dffe port map((RegistroRespuestaC(15) and Control_RegistroRespuesta(1)), reloj, not Control_RegistroRespuesta(2), '1',Control,RegistroRespuestaC(16));
BitsControl(0)<=RegistroRespuestaC(15);
BitsControl(1)<=RegistroRespuestaC(16);


End  RegistroRespuestaArch;