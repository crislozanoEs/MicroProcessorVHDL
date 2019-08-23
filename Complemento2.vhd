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
use ieee.numeric_std.all;

--******************************************************--
-- DEFINICIÓN DE ENTIDAD                                --
--******************************************************--

entity Complemento2 is
port(
	 Numero: in std_logic_vector(0 to 7); 
	 Resultado: out std_logic_vector(0 to 7)
	  );
end Entity Complemento2;              

--Definicion de la arquitectura 
--******************************************************--
--DEFINICIÓN DE ARQUITECTURA                                        --
--******************************************************--

architecture Complemento2Arch of Complemento2 is

--******************************************************--
--DEFINICIÓN DE SEÑALES DE CONEXIÓN                                         --
--******************************************************--

--signal NOMBRE1_NOMBRE2_CABLE: <TIPO DE DATO>;
signal n: std_logic_vector(0 to 7):="00000001";
--******************************************************--
--Instancias y Conectividad
--******************************************************
begin

Resultado <= std_logic_vector(signed(not numero) + signed(n));

End  Complemento2Arch;