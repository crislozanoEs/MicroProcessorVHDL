-- ***********************************************
-- **  PROYECTO PDUA                            **
-- **  Modulo: 	ROM                           **
-- **  Creacion:	Julio 07								**
-- **  Revision:	Marzo 08								**
-- **  Por:		   MGH-CMUA-UNIANDES 				**
-- ***********************************************
-- Descripcion:
-- ROM (Solo lectura)
--                      cs
--                  _____|_
--           rd -->|       |
--          dir -->|       |--> data
--                 |_______|
--
-- ***********************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is
    Port ( cs,rd	: in std_logic;
           dir 	: in std_logic_vector(6 downto 0);
           data 	: out std_logic_vector(7 downto 0));
end ROM;

architecture Behavioral of ROM is

begin
process(cs,rd,dir)
begin
if cs = '1' and rd = '0' then
	case dir is
		WHEN "0000000" => data <= "01010000";-- JMP MAIN
		WHEN "0000001" => data <= "00000011";-- MAIN
		WHEN "0000010" => data <= "00000100";-- RAI
		WHEN "0000011" => data <= "10101000";-- MOV DPTR, CTE
		WHEN "0000100" => data <= "11111101";-- 0xFD
		WHEN "0000101" => data <= "00100000";-- MOV ACC,[DPTR]
		WHEN "0000110" => data <= "10101000";-- MOV DPTR,CTE
		WHEN "0000111" => data <= "11111011";-- 0xFB
		WHEN "0001000" => data <= "10001000";-- C2 ACC
		WHEN "0001001" => data <= "00110000";-- MOV [DPTR],ACC
		WHEN "0001010" => data <= "10101000";-- MOV DPTR,CTE
		WHEN "0001011" => data <= "11111110";-- 0xFE
		WHEN "0001100" => data <= "00100000";-- MOV ACC,[DPTR]
		WHEN "0001101" => data <= "10011000";-- SL ACC
		WHEN "0001110" => data <= "00010000";-- MOV A,ACC
		WHEN "0001111" => data <= "10101000";-- MOV DPTR,CTE
		WHEN "0010000" => data <= "11111100";-- 0xFC
		WHEN "0010001" => data <= "00100000";-- MOV ACC,[DPTR]
		WHEN "0010010" => data <= "01001000";-- ADD ACC,A
		WHEN "0010011" => data <= "00010000";-- MOV A, ACC
		WHEN "0010100" => data <= "00011000";-- MOV ACC,CTE
		WHEN "0010101" => data <= "00000011";-- 0X03
		WHEN "0010110" => data <= "01000000";-- AND ACC,A
		WHEN "0010111" => data <= "00110000";-- MOV [DPTR],ACC
		WHEN "0011000" => data <= "00010000";-- MOV A,ACC
		WHEN "0011001" => data <= "00011000";-- MOV ACC,CTE
		WHEN "0011010" => data <= "00000000";-- 0X00
		WHEN "0011011" => data <= "10000000";-- CJE ACC,A,DIR
		WHEN "0011100" => data <= "00110011";-- JSHIFT
		WHEN "0011101" => data <= "00011000";-- MOV ACC,CTE
		WHEN "0011110" => data <= "00000010";-- 0X02
		WHEN "0011111" => data <= "10000000";-- CJE ACC,A,DIR
		WHEN "0100000" => data <= "00101010";-- JSUM1
		WHEN "0100001" => data <= "00011000";-- MOV ACC, CTE
		WHEN "0100010" => data <= "00000011";-- 0X03
		WHEN "0100011" => data <= "10000000";-- CJE ACC,A,DIR
		WHEN "0100100" => data <= "00110011";-- JSHIFT
		WHEN "0100101" => data <= "10101000";-- MOV DPTR, CTE
		WHEN "0100110" => data <= "11111101";-- 0XFD
		WHEN "0100111" => data <= "00100000";-- MOV ACC,[DPTR]
		WHEN "0101000" => data <= "01010000";-- JMP DIR
		WHEN "0101001" => data <= "00101101";-- SUMAR
		WHEN "0101010" => data <= "10101000";-- MOV DPTR, CTE
		WHEN "0101011" => data <= "11111011";-- 0XFB
		WHEN "0101100" => data <= "00100000";-- MOV ACC,[DPTR]
		WHEN "0101101" => data <= "00010000";-- MOV A,ACC
		WHEN "0101110" => data <= "10101000";-- MOV DPTR,CTE
		WHEN "0101111" => data <= "11111111";-- 0XFF
		WHEN "0110000" => data <= "00100000";-- MOV ACC,[DPTR]
		WHEN "0110001" => data <= "01001000";-- ADD ACC,A
		WHEN "0110010" => data <= "00110000";-- MOV [DPTR],ACC
		WHEN "0110011" => data <= "10101000";-- MOV DPTR,CTE
		WHEN "0110100" => data <= "11111100";-- 0xFC
		WHEN "0110101" => data <= "00100000";-- MOV ACC, [DPTR]
		WHEN "0110110" => data <= "10100000";-- SR ACC
		WHEN "0110111" => data <= "00110000";-- MOV [DPTR],ACC
		WHEN "0111000" => data <= "10101000";-- MOV DPTR,CTE
		WHEN "0111001" => data <= "11111111";-- 0XFF
		WHEN "0111010" => data <= "00100000";-- MOV ACC,[DPTR]
		WHEN "0111011" => data <= "10110000";-- JP DIR
		WHEN "0111100" => data <= "01001010";-- COM
		WHEN "0111101" => data <= "10100000";-- SR ACC
		WHEN "0111110" => data <= "00110000";-- MOV [DPTR],ACC
		WHEN "0111111" => data <= "00011000";-- MOV ACC, CTE
		WHEN "1000000" => data <= "10000000";-- 0x80
		WHEN "1000001" => data <= "00010000";-- MOV A,ACC
		WHEN "1000010" => data <= "10101000";-- MOV DPTR,CTE
		WHEN "1000011" => data <= "11111110";-- 0xFE
		WHEN "1000100" => data <= "00100000";-- MOV ACC,[DPTR]
		WHEN "1000101" => data <= "10100000";-- SR ACC
		WHEN "1000110" => data <= "01001000";-- ADD ACC,A
		WHEN "1000111" => data <= "00110000";-- MOV [DPTR],ACC
		WHEN "1001000" => data <= "01010000";-- JMP DIR
		WHEN "1001001" => data <= "01010000";-- CONTAR
		WHEN "1001010" => data <= "10100000";-- SR ACC
		WHEN "1001011" => data <= "00110000";-- MOV [DPTR],ACC
		WHEN "1001100" => data <= "10101000";-- MOV DPTR,CTE
		WHEN "1001101" => data <= "11111110";-- 0xFE
		WHEN "1001110" => data <= "00100000";-- MOV ACC,[DPTR]
		WHEN "1001111" => data <= "10100000";-- SR ACC
		WHEN "1010000" => data <= "00110000";-- MOV [DPTR],ACC
		WHEN "1010001" => data <= "10101000";-- MOV DPTR,CTE
		WHEN "1010010" => data <= "11111010";-- 0xFA
		WHEN "1010011" => data <= "00100000";-- MOV ACC,[DPTR]
		WHEN "1010100" => data <= "10010000";-- INC ACC
		WHEN "1010101" => data <= "00110000";-- MOV [DPTR],ACC
		WHEN "1010110" => data <= "00010000";-- MOV A,ACC
		WHEN "1010111" => data <= "00011000";-- MOV ACC,CTE
		WHEN "1011000" => data <= "00001000";-- 0x08
		WHEN "1011001" => data <= "10000000";-- CJE ACC,A,DIR
		WHEN "1011010" => data <= "01011011";-- FIN
		WHEN "1011011" => data <= "01010000";-- JMP DIR
		WHEN "1011100" => data <= "00001010";-- OTRA
		WHEN "1011101" => data <= "01010000";-- JMP DIR
		WHEN "1011110" => data <= "01011011";-- FIN
--		when "0000000" => data <= "01010000";  -- JMP MAIN
--		 when "0000001" => data <= "00000011";  -- MAIN
--		 when "0000010" => data <= "00000100";  -- RAI Vector de Interrupcion
--		 when "0000011" => data <= "10101000";  -- MOV DPTR, CTE
--		 when "0000100" => data <= "11111101";  -- CTE(0xFD)
--		 when "0000101" => data <= "00100000";  -- MOV ACC,[DPTR]
--		 when "0000110" => data <= "10101000";  --  MOV DPTR,CTE
--		 when "0000111" => data <= "11111011";  -- CTE(0xFB)
--		 when "0001000" => data <= "10001000";  -- C2 ACC
--		 when "0001001" => data <= "00110000";  -- MOV [DPTR],ACC
--		 when "0001010" => data <= "10101000";  -- MOV DPTR,CTE
--		 when "0001011" => data <= "11111110";  -- 0xFE
--		 when "0001100" => data <= "00100000";  -- MOV ACC,[DPTR]
--		 when "0001101" => data <= "10011000";  -- SL ACC
--		when "0001110" => data <= "00010000";  -- MOV A,ACC
--		when "0001111" => data <= "10101000";  -- MOV DPTR,CTE
--		when "0010000" => data <= "11111100";  -- 0xFC
--		when "0010001" => data <= "00100000";  -- MOV ACC,[DPTR]
--		when "0010010" => data <= "01001000";  -- ADD ACC,A
--		when "0010011" => data <= "00010000";  -- MOV A, ACC
--		when "0010100" => data <= "00011000";  -- MOV ACC,CTE
--		when "0010101" => data <= "00000011";  -- 0X03
--		when "0010110" => data <= "01000000";  -- AND ACC,A
--		when "0010111" => data <= "00110000";  -- MOV [DPTR],ACC
--		when "0011000" => data <= "00010000";  -- MOV A,ACC
--		when "0011001" => data <= "00011000";  -- MOV ACC,CTE
--		when "0011010" => data <= "00000000";  -- 0X00
--		when "0011011" => data <= "10000000";  -- CJE ACC,A,DIR
--		when "0011100" => data <= "00110011";  -- JSHIFT
--		when "0011101" => data <= "00011000";  -- MOV ACC,CTE
--		when "0011110" => data <= "00000010";  -- 0X02
--		when "0011111" => data <= "10000000";  -- CJE ACC,A,DIR
--		when "0100000" => data <= "00101010";  -- JSUM1
--		when "0100001" => data <= "00011000";  -- MOV ACC, CTE
--		when "0100010" => data <= "00000011";  -- 0X03
--		when "0100011" => data <= "10000000";  -- CJE ACC,A,DIR
--		when "0100100" => data <= "00110011";  -- JSHIFT
--		when "0100101" => data <= "10101000";  -- MOV DPTR, CTE
--		when "0100110" => data <= "11111101";  -- 0XFD
--		when "0100111" => data <= "00100000";  -- MOV ACC,[DPTR]
--		when "0101000" => data <= "01010000";  -- JMP DIR
--		when "0101001" => data <= "00101101";  -- SUMAR
--		when "0101010" => data <= "10101000";  -- MOV DPTR, CTE
--		when "0101011" => data <= "11111011";  -- 0XFB
--		when "0101100" => data <= "00100000";  -- MOV ACC,[DPTR]
--		when "0101101" => data <= "00010000";  -- MOV A,ACC
--		when "0101110" => data <= "10101000";  --	 MOV DPTR,CTE
--		when "0101111" => data <= "11111111";  --	 0XFF
--		when "0110000" => data <= "00100000";  --	 MOV ACC,[DPTR]
--		when "0110001" => data <= "01001000";  --	 ADD ACC,A
--		when "0110010" => data <= "00110000";  --	 MOV [DPTR],ACC
--		when "0110011" => data <= "10101000";  --	 MOV DPTR,CTE
--		when "0110100" => data <= "11111100";  --	 0xFC
--		when "0110101" => data <= "00100000";  --	 MOV ACC, [DPTR]
--		when "0110110" => data <= "10100000";  --	 SR ACC
--		when "0110111" => data <= "00110000";  --	 MOV [DPTR],ACC
--		when "0111000" => data <= "10101000";  --	 MOV DPTR,CTE
--		when "0111001" => data <= "11111111";  --	 0XFF
--		when "0111010" => data <= "00100000";  --	 MOV ACC,[DPTR]
--		when "0111011" => data <= "10100000";  --	 SR ACC
--		when "0111100" => data <= "01010000";  --	 JMP DIR
--		when "0111101" => data <= "01001010";  --	 COM
--		when "0111110" => data <= "00110000";  --	 MOV [DPTR],ACC
--		when "0111111" => data <= "00011000";  --	 MOV ACC, CTE
--	 when "1000000" => data <= "10000000";  -- 0x80
--	 when "1000001" => data <= "00010000";  -- MOV A,ACC
--	 when "1000010" => data <= "10101000";  -- MOV DPTR,CTE
--	 when "1000011" => data <= "11111110";  -- 0xFE
--	 when "1000100" => data <= "00100000";  -- MOV ACC,[DPTR]
--	 when "1000101" => data <= "10100000";  -- SR ACC
--	 when "1000110" => data <= "01001000";  -- ADD ACC,A
--	 when "1000111" => data <= "00110000";  -- MOV [DPTR],ACC
--	 when "1001000" => data <= "01010000";  -- JMP DIR
--	 when "1001001" => data <= "01010000";  -- CONTAR
--	 when "1001010" => data <= "00110000";  -- MOV [DPTR],ACC
--	 when "1001011" => data <= "10101000";  -- MOV DPTR,CTE
--	 when "1001100" => data <= "11111110";  -- 0xFE
--	 when "1001101" => data <= "00100000";  -- MOV ACC,[DPTR]
--		when "1001110" => data <= "10100000";  -- SR ACC
--		when "1001111" => data <= "00110000";  -- MOV [DPTR],ACC
--		when "1010000" => data <= "10101000";  -- MOV DPTR,CTE
--		when "1010001" => data <= "11111010";  -- 0xFA
--		when "1010010" => data <= "00100000";  -- MOV ACC,[DPTR]
--		when "1010011" => data <= "10010000";  -- INC ACC
--		when "1010100" => data <= "00110000";  -- MOV [DPTR],ACC
--		when "1010101" => data <= "00010000";  -- MOV A,ACC
--		when "1010110" => data <= "00011000";  -- MOV ACC,CTE
--		when "1010111" => data <= "00001000";  -- 0x08
--		when "1011000" => data <= "10000000";  -- CJE ACC,A,DIR
--		when "1011001" => data <= "01011011";  -- FIN
--		when "1011010" => data <= "01010000";  -- JMP DIR
--		when "1011011" => data <= "00001010";  -- OTRA
--		when "1011100" => data <= "01010000";  -- JMP DIR
--		when "1011101" => data <= "01011011";  -- FIN

		when others => data <= (others => 'X');
	 end case;
	else data <= (others => 'Z');
end if;
end process;
end;
