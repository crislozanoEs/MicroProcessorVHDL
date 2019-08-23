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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--******************************************************--
-- DEFINICIÓN DE ENTIDAD                                --
--******************************************************--

entity ContadorProceso is
port(
	 Control_ContadorProceso: in std_logic_vector(0 to 1); --1 enable, 0 reset
	 reloj:in std_logic;
	 ContadorProceso_Control: out std_logic
	  );
end Entity ContadorProceso;              

--Definicion de la arquitectura 
--******************************************************--
--DEFINICIÓN DE ARQUITECTURA                                        --
--******************************************************--

architecture ContadorProcesoArch of ContadorProceso is

component dffe
port(
	d,clk,clrn,prn,ena: IN std_logic;
	Q: OUT std_logic
); end component;

--******************************************************--
--DEFINICIÓN DE SEÑALES DE CONEXIÓN                                         --
--******************************************************--

--signal NOMBRE1_NOMBRE2_CABLE: <TIPO DE DATO>;

signal qs: std_logic_vector(0 to 3);

--******************************************************--
--Instancias y Conectividad
--******************************************************
begin
Reg1: dffe port map(not qs(0), reloj, not Control_ContadorProceso(0),'1',Control_ContadorProceso(1),                    qs(0));
Reg2: dffe port map(not qs(1), reloj, not Control_ContadorProceso(0),'1',Control_ContadorProceso(1) and qs(0),          qs(1));
Reg3: dffe port map(not qs(2), reloj, not Control_ContadorProceso(0),'1',Control_ContadorProceso(1) and qs(0) and qs(1),qs(2));
Reg4: dffe port map(not qs(3), reloj, not Control_ContadorProceso(0),'1',Control_ContadorProceso(1) and qs(0) and qs(1) and qs(2),qs(3));
ContadorProceso_Control<=qs(3);

End  ContadorProcesoArch;