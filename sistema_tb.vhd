library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
LIBRARY WORK;

ENTITY sistema_tb is
END sistema_tb;

ARCHITECTURE Testbench OF sistema_tb Is

	component sistema 
		Port( clk 	: in 	std_logic;
            rst_n 	: in 	std_logic;
				int 	: in 	std_logic;
				bus_data_out : out	std_logic_vector(7 downto 0));
	end component;
	
	SIGNAL Clk, rst_n, int 	: STD_LOGIC;
	SIGNAL bus_data_out		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	CONSTANT T	:	TIME	:= 20 ns;

BEGIN

	UUT: entity work.sistema port map
			(Clk				=> Clk,
			 rst_n			=> rst_n,
			 int				=> int,
			 bus_data_out	=> bus_data_out);
			 
	Clk_process: PROCESS
	BEGIN
		Clk <= '0';
		wait for T/2;
		Clk <= '1';
		wait for T/2;
	END PROCESS;
	
	signal_process: PROCESS
	BEGIN
		rst_n <= '0';
		int <= '0';
		wait for t*3;
		rst_n <= '1';
		wait for t*(10**10);
	END PROCESS;

END Testbench;
