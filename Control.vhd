--*****************************************************--
--		  PONTIFICIA UNIVERSIDAD JAVERIANA                --
--				CIRCUITOS LÃ“GICOS 	             	        --
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
-- DEFINICIÃ“N DE ENTIDAD                                --
--******************************************************--

entity Control is
port(
	 Reset: in std_logic;
	 Contador_Control: in std_logic;
	 Reloj: in std_logic;
	 BitsControl: in std_logic_vector(0 to 1);
	 Empezar: in std_logic;
	 Terminar: in std_logic;
	 Control_salida: out std_logic;
	 Control_Selector: out std_logic_vector(0 to 1);
	 Control_RegistroRespuesta: out std_logic_vector(0 to 3);
	 Control_RegistroCom2: out std_logic;
	 Control_Contador: out std_logic_vector(0 to 1)
	  );
end Entity Control;              

--Definicion de la arquitectura 
--******************************************************--
--DEFINICIÃ“N DE ARQUITECTURA                                        --
--******************************************************--

architecture ControlArch of Control is

component dffe
port(
	d,clk,clrn,prn,ena: IN std_logic;
	Q: OUT std_logic
); end component;

--******************************************************--
--DEFINICIÃ“N DE SEÃ‘ALES DE CONEXIÃ“N                                         --
--******************************************************--

--signal NOMBRE1_NOMBRE2_CABLE: <TIPO DE DATO>;
signal q: std_logic_vector(0 to 8);

--******************************************************--
--Instancias y Conectividad
--******************************************************
begin
Estado0:dffe port map((q(7) and Terminar) or (not Empezar and q(0)),Reloj, '1', Reset,'1',q(0));
Estado01: dffe port map((q(8) and Empezar) or (Empezar and q(0)),Reloj, Reset,'1','1',q(8));
Estado1:dffe port map(q(8) and not Empezar, Reloj, Reset, '1','1',q(1));
Estado2:dffe port map(q(1), Reloj, Reset, '1','1',q(2));
Estado3:dffe port map(q(2) or q(4),Reloj, Reset, '1','1',q(3));
Estado4:dffe port map((q(3) and (BitsControl(0) xnor BitsControl(1))   and not Contador_Control) or(q(5)) or (q(6)), Reloj, Reset, '1','1',q(4));
Estado5:dffe port map(q(3) and (not BitsControl(1) and BitsControl(0)) and not Contador_Control, Reloj, Reset, '1','1',q(5));
Estado6:dffe port map(q(3) and (BitsControl(1) and not BitsControl(0)) and not Contador_Control, Reloj, Reset, '1','1',q(6));
Estado7:dffe port map((q(3) and Contador_Control) or (not terminar and q(7)),Reloj, Reset, '1','1',q(7));

Control_RegistroCom2<=q(1);
Control_RegistroRespuesta(2)<=q(1);
Control_Contador(0)<=q(1);
Control_RegistroRespuesta(3)<=q(2);
Control_RegistroRespuesta(1)<=q(4);
Control_Contador(1)<=q(4);
Control_Selector(0)<=q(6);
Control_RegistroRespuesta(0)<=q(5) or q(6);
Control_Selector(1)<=q(5);
Control_Salida<=q(7);

End  ControlArch;