----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:29:26 10/02/2019 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
-- Project Name:   Project1-DataPathDesign
-- Target Devices: 
-- Tool versions: 
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
--USE ieee.numeric_std.ALL;

ENTITY decoder IS
 PORT( A0,A1,A2 :in STD_LOGIC;
      Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7:out STD_LOGIC
      );
END decoder;

ARCHITECTURE Behavioral OF decoder IS
CONSTANT gate_delay:Time :=5ns;
BEGIN
  Q0 <= ((NOT A0)AND(NOT A1)AND(NOT A2)) after gate_delay;
  Q1 <= ((NOT A0) AND (NOT A1) AND (A2)) after gate_delay;		
  Q2 <= ((NOT A0) AND (A1) AND (NOT A2)) after gate_delay;		
  Q3 <= ((NOT A0) AND (A1) AND (A2)) after gate_delay;			
  Q4 <= ((A0) AND (NOT A1) AND (NOT A2)) after gate_delay;		
  Q5 <= ((A0) AND (NOT A1) AND (A2)) after gate_delay;			
  Q6 <= ((A0) AND (A1) AND (NOT A2)) after gate_delay;			
  Q7 <= ((A0) AND (A1) AND (A2)) after gate_delay;
END Behavioral;