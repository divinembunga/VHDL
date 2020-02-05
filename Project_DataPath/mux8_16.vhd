----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2019 17:36:47
-- Design Name: 
-- Module Name: 8x16 Multiplexer -Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;



ENTITY mux8_16 IS
 PORT( IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7: in STD_LOGIC_VECTOR(15 downto 0);
       S0,S1,S2: in STD_LOGIC;
       Z: out STD_LOGIC_VECTOR(15 downto 0)
       );
END mux8_16;

ARCHITECTURE Behavioral OF mux8_16 IS
CONSTANT gate_delay:Time :=5ns;

BEGIN
  Z <= IN0 after gate_delay when S0='0' and S1='0' and S2='0' else
       IN1 after gate_delay when S0='0' and S1='0' and S2='1' else	
	   IN2 after gate_delay when S0='0' and S1='1' and S2='0' else	
	   IN3 after gate_delay when S0='0' and S1='1' and S2='1' else	
	   IN4 after gate_delay when S0='1' and S1='0' and S2='0' else	
	   IN5 after gate_delay when S0='1' and S1='0' and S2='1' else	
	   IN6 after gate_delay when S0='1' and S1='1' and S2='0' else	
	   IN7 after gate_delay when S0='1' and S1='1' and S2='1' else	
	   x"0000" after gate_delay;    

END Behavioral;
