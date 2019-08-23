-- *******************************************************
-- **                      PDUA                         **
-- **              PROCESADOR DIDACTICO                 **
-- **    Arquitectura y Diseno de Sistemas Digitales    **
-- **            UNIVERSIDAD DE LOS ANDES               **
-- **       CMUA: Centro de Microelectronica            **
-- *******************************************************
-- ** Version  0.0 Junio 2007                           **
-- ** Revision 0.1 Noviembre 2007                       **
-- ** Revision 0.2 Marzo 2008                           **
-- *******************************************************
-- Descripcion:
--               ______________________________________
--              |       ______   ______   _____        |
--              |      | PM   | | ROM  | | RAM |       |
--              |      |______| |______| |_____|       |
--              |    _________                         |
--       CLK -->|-->|         |                        |
--     Rst_n -->|-->|  PDUA   |----------------> D_out |
--       INT -->|-->|         |<---------------- D_in  |
--              |   |         |----------------> Dir   |
--              |   |         |----------------> Ctrl  |
--              |   |_________|                        |
--              |                                      |
--              |______________________________________|

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sistema is
    Port (  clk 	: in 	std_logic;
            rst_n 	: in 	std_logic;
            int 	: in 	std_logic;
            data_in1 : in std_logic_vector(7 downto 0);
            data_in2 : in std_logic_vector(7 downto 0);
            btn : in std_logic;
            btn1 : in std_logic;
				bus_data_out : out	std_logic_vector(7 downto 0);
				leds: out std_logic_vector(15 downto 0));
end sistema;

architecture Behavioral of sistema is

component pdua is
    Port (  clk 	: in 	std_logic;
            rst_n 	: in 	std_logic;
            int 	: in 	std_logic;
            iom 	: out 	std_logic;
            rw 		: out 	std_logic;
            bus_dir 	: out 	std_logic_vector(7 downto 0);
            bus_data_in : in 	std_logic_vector(7 downto 0);
				bus_data_out : out	std_logic_vector(7 downto 0));
end component;

component ROM is
    Port ( cs,rd	: in std_logic;
           dir 	: in std_logic_vector(6 downto 0);
           data 	: out std_logic_vector(7 downto 0));
end component;

component RAM is
    Port (  cs,rw 	: in 	std_logic;
            dir 	: in 	std_logic_vector(2 downto 0);
            data_in 	: in 	std_logic_vector(7 downto 0);
				    data_out 	: out std_logic_vector(7 downto 0));
end component;

component PM is
    Port (
          Reset: in std_logic;
			 Reloj:in std_logic;
			 NumeroA: in std_logic_vector(0 to 7);
			 NumeroB: in std_logic_vector(0 to 7); 
			 Empezar: in std_logic;
			 Terminar: in std_logic;
			 SenalSalida: out std_logic_vector(0 to 15));
 end component;

signal rwi,cs_ROM,cs_RAM,iom, mult	: std_logic;
signal datai,datao,diri		: std_logic_vector(7 downto 0);

begin

U1: pdua port map (clk,rst_n,int,iom,rwi,diri,datai,datao);
U2: ROM  port map (cs_ROM,rwi,diri(6 downto 0),datai);
U3: RAM 	port map (cs_RAM,rwi,diri(2 downto 0),datao,datai);
U4: PM   port map (rst_n, clk, data_in1, data_in2, not btn, not btn1, leds);

-----------------------------
--Cyclone IV EP4CE115F29C7N--
-----------------------------

bus_data_out <= datao;
-- Decodificador
cs_ROM <= not diri(7);
cs_RAM <= diri(7);

end Behavioral;
