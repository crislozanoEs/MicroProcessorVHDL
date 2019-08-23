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

entity Sumador is
port(
	 Numero1: in std_logic_vector(0 to 7); 
	 Numero2:in std_logic_vector(0 to 7);
	 Resultado: out std_logic_vector(0 to 7)
	  );
end Entity Sumador;              

--Definicion de la arquitectura 
--******************************************************--
--DEFINICIÓN DE ARQUITECTURA                                        --
--******************************************************--

architecture SumadorArch of Sumador is

--******************************************************--
--DEFINICIÓN DE SEÑALES DE CONEXIÓN                                         --
--******************************************************--


--******************************************************--
--Instancias y Conectividad
--******************************************************
begin

Resultado <= std_logic_vector(signed(Numero1) + signed(Numero2));

End  SumadorArch;