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

entity Salida is
port(
	 RegistroRespuesta_Respuesta: in std_logic_vector(0 to 16); 
	 Control_Salida: in std_logic;
	 Respuesta: out std_logic_vector(0 to 15)
	  );
end Entity Salida;              

--Definicion de la arquitectura 
--******************************************************--
--DEFINICIÓN DE ARQUITECTURA                                        --
--******************************************************--

architecture SalidaArch of Salida is

--******************************************************--
--DEFINICIÓN DE SEÑALES DE CONEXIÓN                                         --
--******************************************************--

--signal NOMBRE1_NOMBRE2_CABLE: <TIPO DE DATO>;


--******************************************************--
--Instancias y Conectividad
--******************************************************
begin
Respuesta(0)<= (RegistroRespuesta_Respuesta(0) and Control_Salida);
Respuesta(1)<= (RegistroRespuesta_Respuesta(1) and Control_Salida);
Respuesta(2)<= (RegistroRespuesta_Respuesta(2) and Control_Salida);
Respuesta(3)<=  (RegistroRespuesta_Respuesta(3) and Control_Salida);
Respuesta(4)<=  (RegistroRespuesta_Respuesta(4) and Control_Salida);
Respuesta(5)<=  (RegistroRespuesta_Respuesta(5) and Control_Salida);
Respuesta(6)<=  (RegistroRespuesta_Respuesta(6) and Control_Salida);
Respuesta(7)<=  (RegistroRespuesta_Respuesta(7) and Control_Salida);
Respuesta(8)<=  (RegistroRespuesta_Respuesta(8) and Control_Salida);
Respuesta(9)<=  (RegistroRespuesta_Respuesta(9) and Control_Salida);
Respuesta(10)<=  (RegistroRespuesta_Respuesta(10) and Control_Salida);
Respuesta(11)<=  (RegistroRespuesta_Respuesta(11) and Control_Salida);
Respuesta(12)<=  (RegistroRespuesta_Respuesta(12) and Control_Salida);
Respuesta(13)<=  (RegistroRespuesta_Respuesta(13) and Control_Salida);
Respuesta(14)<=  (RegistroRespuesta_Respuesta(14) and Control_Salida);
Respuesta(15)<=  (RegistroRespuesta_Respuesta(15) and  Control_Salida);
End  SalidaArch;