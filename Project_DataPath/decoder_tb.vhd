----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:29:26 10/02/2019 
-- Design Name: 
-- Module Name:    Decoder Test Bench - Behavioral 
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

ENTITY decoder_tb IS
END decoder_tb;

ARCHITECTURE behavior OF decoder_tb IS
  --Component Declaration for the Unit Under Test(UUT)
  COMPONENT decoder
  PORT( A0 :in STD_LOGIC;
        A1 :in STD_LOGIC;
        A2 :in STD_LOGIC;
        Q0 :out STD_LOGIC;
        Q1 :out STD_LOGIC;
        Q2 :out STD_LOGIC;
        Q3 :out STD_LOGIC;
        Q4 :out STD_LOGIC;
        Q5 :out STD_LOGIC;
        Q6 :out STD_LOGIC;
        Q7 :out STD_LOGIC
      );
  END COMPONENT;
  
  --Inputs
  signal A0:STD_LOGIC :='0';
  signal A1:STD_LOGIC :='0';
  signal A2:STD_LOGIC :='0';
  
  --Outputs
  signal Q0:STD_LOGIC;
  signal Q1:STD_LOGIC;
  signal Q2:STD_LOGIC;
  signal Q3:STD_LOGIC;
  signal Q4:STD_LOGIC;
  signal Q5:STD_LOGIC;
  signal Q6:STD_LOGIC;
  signal Q7:STD_LOGIC;
  
  BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder PORT MAP (
          A0 => A0,
          A1 => A1,
          A2 => A2,
          Q0 => Q0,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3,
          Q4 => Q4,
          Q5 => Q5,
          Q6 => Q6,
          Q7 => Q7
        ); 

   stim_proc: process
   begin		
		wait for 10ns;
		A0 <= '0';
		A1 <= '0';
		A2 <= '0';
		
		wait for 10ns;
		A0 <= '0';
		A1 <= '0';
		A2 <= '1';
		
		wait for 10ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '0';
		
		wait for 10ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '1';
		
		wait for 10ns;
		A0 <= '1';
		A1 <= '0';
		A2 <= '0';
		
		wait for 10ns;
		A0 <= '1';
		A1 <= '0';
		A2 <= '1';
		
		wait for 10ns;
		A0 <= '1';
		A1 <= '1';
		A2 <= '0';
		
		wait for 10ns;
		A0 <= '1';
		A1 <= '1';
		A2 <= '1';
   end process;

END;
