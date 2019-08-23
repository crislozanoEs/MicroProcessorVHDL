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

entity RegistroCom2 is
port(
	 Control_RegistroCom2: in std_logic; --1 enable
	 reloj:in std_logic;
	 Complemento2_Registro: in std_logic_vector(0 to 7);
	 Registro_Sumador: out std_logic_vector(0 to 7)	 
	  );
end Entity RegistroCom2;              

--Definicion de la arquitectura 
--******************************************************--
--DEFINICIÓN DE ARQUITECTURA                                        --
--******************************************************--

architecture RegistroCom2Arch of RegistroCom2 is

component dffe
port(
	d,clk,clrn,prn,ena: IN std_logic;
	Q: OUT std_logic
); end component;

--******************************************************--
--DEFINICIÓN DE SEÑALES DE CONEXIÓN                                         --
--******************************************************--

--signal NOMBRE1_NOMBRE2_CABLE: <TIPO DE DATO>;
signal es: std_logic_vector(0 to 1);
signal qs: std_logic_vector(0 to 1);

--******************************************************--
--Instancias y Conectividad
--******************************************************
begin
Reg1: dffe port map(Complemento2_Registro(0), reloj, '1', '1',Control_RegistroCom2,Registro_Sumador(0));
Reg2: dffe port map(Complemento2_Registro(1), reloj, '1', '1',Control_RegistroCom2,Registro_Sumador(1));
Reg3: dffe port map(Complemento2_Registro(2), reloj, '1', '1',Control_RegistroCom2,Registro_Sumador(2));
Reg4: dffe port map(Complemento2_Registro(3), reloj, '1', '1',Control_RegistroCom2,Registro_Sumador(3));
Reg5: dffe port map(Complemento2_Registro(4), reloj, '1', '1',Control_RegistroCom2,Registro_Sumador(4));
Reg6: dffe port map(Complemento2_Registro(5), reloj, '1', '1',Control_RegistroCom2,Registro_Sumador(5));
Reg7: dffe port map(Complemento2_Registro(6), reloj, '1', '1',Control_RegistroCom2,Registro_Sumador(6));
Reg8: dffe port map(Complemento2_Registro(7), reloj, '1', '1',Control_RegistroCom2,Registro_Sumador(7));


End  RegistroCom2Arch;