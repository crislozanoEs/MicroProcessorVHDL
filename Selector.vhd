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

entity Selector is
port(
	 RegistroCom2_Selector: in std_logic_vector(0 to 7); 
	 RegistroNumero_Selector: in std_logic_vector(0 to 7);
	 Control_Selector: in std_logic_vector(0 to 1); --1 pasa complemento a 2, 0 pasa numero 
	 Selector_Sumador: out std_logic_vector(0 to 7)
	  );
end Entity Selector;              

--Definicion de la arquitectura 
--******************************************************--
--DEFINICIÓN DE ARQUITECTURA                                        --
--******************************************************--

architecture SelectorArch of Selector is

--******************************************************--
--DEFINICIÓN DE SEÑALES DE CONEXIÓN                                         --
--******************************************************--

--signal NOMBRE1_NOMBRE2_CABLE: <TIPO DE DATO>;


--******************************************************--
--Instancias y Conectividad
--******************************************************
begin
Selector_Sumador(0)<= (RegistroCom2_Selector(0) and Control_Selector(1)) or(RegistroNumero_Selector(0) and Control_Selector(0));
Selector_Sumador(1)<= (RegistroCom2_Selector(1) and Control_Selector(1)) or(RegistroNumero_Selector(1) and Control_Selector(0));
Selector_Sumador(2)<= (RegistroCom2_Selector(2) and Control_Selector(1)) or(RegistroNumero_Selector(2) and Control_Selector(0));
Selector_Sumador(3)<= (RegistroCom2_Selector(3) and Control_Selector(1)) or(RegistroNumero_Selector(3) and Control_Selector(0));
Selector_Sumador(4)<= (RegistroCom2_Selector(4) and Control_Selector(1)) or(RegistroNumero_Selector(4) and Control_Selector(0));
Selector_Sumador(5)<= (RegistroCom2_Selector(5) and Control_Selector(1)) or(RegistroNumero_Selector(5) and Control_Selector(0));
Selector_Sumador(6)<= (RegistroCom2_Selector(6) and Control_Selector(1)) or(RegistroNumero_Selector(6) and Control_Selector(0));
Selector_Sumador(7)<= (RegistroCom2_Selector(7) and Control_Selector(1)) or(RegistroNumero_Selector(7) and Control_Selector(0));


End  SelectorArch;