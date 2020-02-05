----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:33:18 10/02/2019 
-- Design Name: 
-- Module Name:    8x16 Multiplexer Test Bench - Behavioral 
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

ENTITY mux8_16_tb IS
END mux8_16_tb;
 
ARCHITECTURE behavior OF mux8_16_tb IS 
  -- Component Declaration for the Unit Under Test (UUT)
  COMPONENT mux8_16
     PORT(
         S0: in  STD_LOGIC;
         S1: in  STD_LOGIC;
         S2: in  STD_LOGIC;
         IN0: in STD_LOGIC_VECTOR(15 downto 0);
         IN1: in STD_LOGIC_VECTOR(15 downto 0);
         IN2: in STD_LOGIC_VECTOR(15 downto 0);
         IN3: in STD_LOGIC_VECTOR(15 downto 0);
         IN4: in STD_LOGIC_VECTOR(15 downto 0);
         IN5: in STD_LOGIC_VECTOR(15 downto 0);
         IN6: in STD_LOGIC_VECTOR(15 downto 0);
         IN7: in STD_LOGIC_VECTOR(15 downto 0);
         Z: out STD_LOGIC_VECTOR(15 downto 0)
        );
  END COMPONENT;
    
   --Inputs
   signal S0: STD_LOGIC:='0';
   signal S1: STD_LOGIC:='0';
   signal S2: STD_LOGIC:='0';
   --initialising vectors to all zero's.
   signal IN0: STD_LOGIC_VECTOR(15 downto 0):= (others=>'0');
   signal IN1: STD_LOGIC_VECTOR(15 downto 0):= (others=>'0');
   signal IN2: STD_LOGIC_VECTOR(15 downto 0):= (others=>'0');
   signal IN3: STD_LOGIC_VECTOR(15 downto 0):= (others=>'0');
   signal IN4: STD_LOGIC_VECTOR(15 downto 0):= (others=>'0');
   signal IN5: STD_LOGIC_VECTOR(15 downto 0):= (others=>'0');
   signal IN6: STD_LOGIC_VECTOR(15 downto 0):= (others=>'0');
   signal IN7: STD_LOGIC_VECTOR(15 downto 0):= (others=>'0');

 	--Outputs
   signal Z: STD_LOGIC_VECTOR(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux8_16 PORT MAP (
          S0=>S0,
          S1=>S1,
          S2=>S2,
          IN0=>IN0,
          IN1=>IN1,
          IN2=>IN2,
          IN3=>IN3,
          IN4=>IN4,
          IN5=>IN5,
          IN6=>IN6,
          IN7=>IN7,
          Z=>Z
        );

   stim_proc: process
   begin		
		IN0 <= X"FFFF"; --using hex to avoid
		IN1 <= X"EEEE"; --long binary numbers 
		IN2 <= X"DDDD"; --in the code.
		IN3 <= X"CCCC";
		IN4 <= X"BBBB";
		IN5 <= X"AAAA";
		IN6 <= X"9999";
		IN7 <= X"8888";
		
		wait for 10ns;
		S0<='1';
		S1<='0';
		S2<='0';
		
		wait for 10ns;
		S0<='0';
		S1<='1';
		S2<='0';
		
		wait for 10ns;
		S0<='1';
		S1<='1';
		S2<='0';
		
		wait for 10ns;
		S0<='0';
		S1<='0';
		S2<='1';
		
		wait for 10ns;
		S0<='1';
		S1<='0';
		S2<='1';
		
		wait for 10ns;
		S0<='0';
		S1<='1';
		S2<='1';
		
		wait for 10ns;
		S0<='1';
		S1<='1';
		S2<='1';
   end process;

END;