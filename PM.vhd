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

entity PM is
port(
	 Reset: in std_logic;
	 Reloj:in std_logic;
	 NumeroA: in std_logic_vector(0 to 7);
	 NumeroB: in std_logic_vector(0 to 7); 
	 Empezar: in std_logic;
	 Terminar: in std_logic;
	 SenalSalida: out std_logic_vector(0 to 15)
	  );
end Entity PM;              

--Definicion de la arquitectura 
--******************************************************--
--DEFINICIÃ“N DE ARQUITECTURA                                        --
--******************************************************--

architecture PMArch of PM is


component ContadorProceso is
port(
	 Control_ContadorProceso: in std_logic_vector(0 to 1); --1 enable, 0 reset
	 reloj:in std_logic;
	 ContadorProceso_Control: out std_logic	 
	  );
end component ContadorProceso; 

component RegistroCom2 is
port(
	 Control_RegistroCom2: in std_logic; --1 enable
	 reloj:in std_logic;
	 Complemento2_Registro: in std_logic_vector(0 to 7);
	 Registro_Sumador: out std_logic_vector(0 to 7)	 
	  );
end component RegistroCom2;  

component RegistroRespuesta is
port(
	 Control_RegistroRespuesta: in std_logic_vector(0 to 3); --0 enable paralelo, 1 enable serie, 2 reset, 3 guardar numero A
	 reloj:in std_logic;
	 Suma_RegistroRespuesta: in std_logic_vector(0 to 7);
	 BitsControl: out std_logic_vector(0 to 1);
	 RegistroNumero_RegistroRespuesta: in std_logic_vector(0 to 7);
	 RegistroRespuesta_Respuesta: out std_logic_vector(0 to 16)	 
	  );
end component RegistroRespuesta;  

component Sumador is
port(
	 Numero1: in std_logic_vector(0 to 7); 
	 Numero2:in std_logic_vector(0 to 7);
	 Resultado: out std_logic_vector(0 to 7)
	  );
end component Sumador;  

component Complemento2 is
port(
	 Numero: in std_logic_vector(0 to 7); 
	 Resultado: out std_logic_vector(0 to 7)
	  );
end component Complemento2;  

component Selector is
port(
	 RegistroCom2_Selector: in std_logic_vector(0 to 7); 
	 RegistroNumero_Selector: in std_logic_vector(0 to 7);
	 Control_Selector: in std_logic_vector(0 to 1); --1 pasa complemento a 2, 0 pasa numero 
	 Selector_Sumador: out std_logic_vector(0 to 7)
	  );
end component Selector;   

component Salida is
port(
	 RegistroRespuesta_Respuesta: in std_logic_vector(0 to 16); 
	 Control_Salida: in std_logic;
	 Respuesta: out std_logic_vector(0 to 15)
	  );
end component Salida;      

component Control is
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
end component Control;   


--******************************************************--
--DEFINICIÃ“N DE SEÃ‘ALES DE CONEXIÃ“N                                         --
--******************************************************--

--signal NOMBRE1_NOMBRE2_CABLE: <TIPO DE DATO>;

signal SControl_ContadorProceso: std_logic_vector(0 to 1);
signal SContadorProceso_Control: std_logic;
signal SControl_RegistroCom2: std_logic; 
signal SComplemento2_Registro: std_logic_vector(0 to 7);
signal SControl_RegistroRespuesta: std_logic_vector(0 to 3);
signal SSuma_RegistroRespuesta: std_logic_vector(0 to 7);
signal SBitsControl: std_logic_vector(0 to 1);
signal SRegistroNumero_RegistroRespuesta: std_logic_vector(0 to 7);
signal SRegistroRespuesta_Respuesta: std_logic_vector(0 to 16);	
signal SRegistroCom2_Selector: std_logic_vector(0 to 7); 
signal SRegistroNumero_Selector: std_logic_vector(0 to 7);
signal SControl_Selector: std_logic_vector(0 to 1); --1 pasa complemento a 2, 0 pasa numero 
signal SSelector_Sumador: std_logic_vector(0 to 7);
signal SControl_Salida: std_logic;

--******************************************************--
--Instancias y Conectividad
--******************************************************
begin

BContadorProceso: ContadorProceso port map(SControl_ContadorProceso, Reloj,SContadorProceso_Control);
BRegistroCom2: RegistroCom2 port map(SControl_RegistroCom2,Reloj,SComplemento2_Registro,SRegistroCom2_Selector);
BRegistroRespuesta: RegistroRespuesta port map(SControl_RegistroRespuesta, Reloj,SSuma_RegistroRespuesta,SBitsControl,NumeroB,SRegistroRespuesta_Respuesta);
BSumador: Sumador port map(SRegistroRespuesta_Respuesta(0 to 7), SSelector_Sumador, SSuma_RegistroRespuesta);
BComplemento2: Complemento2 port map(NumeroA,SComplemento2_Registro);
BSelector: Selector port map(SRegistroCom2_Selector,NumeroA,SControl_Selector,SSelector_Sumador); 
BSalida: Salida port map(SRegistroRespuesta_Respuesta,SControl_Salida,SenalSalida);  
BControl: Control port map(Reset,SContadorProceso_Control,Reloj,SBitsControl,Empezar,Terminar,SControl_Salida,SControl_Selector,SControl_RegistroRespuesta,SControl_RegistroCom2,SControl_ContadorProceso);

End  PMArch;