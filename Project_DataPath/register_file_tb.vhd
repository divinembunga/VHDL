----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2019 02:36:22
-- Design Name: 
-- Module Name: Register File Test Bench - Behavioral
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
--USE IEEE.NUMERIC_STD.ALL;

ENTITY register_file_tb IS
END register_file_tb;

ARCHITECTURE behavior OF register_file_tb IS
  -- Component Declaration for the Unit Under Test (UUT)
  COMPONENT reg_file
    PORT(
     src_S0: in STD_LOGIC;
     src_S1: in STD_LOGIC;
     src_S2: in STD_LOGIC;
     des_A0: in STD_LOGIC;
     des_A1: in STD_LOGIC;
     des_A2: in STD_LOGIC;
     data_Load: in STD_LOGIC;
     clk: in STD_LOGIC;
     data: in STD_LOGIC_VECTOR(15 downto 0);
     Q: out STD_LOGIC_VECTOR(15 downto 0);
     reg0: out STD_LOGIC_VECTOR(15 downto 0);
     reg1: out STD_LOGIC_VECTOR(15 downto 0);
     reg2: out STD_LOGIC_VECTOR(15 downto 0);
     reg3 : out STD_LOGIC_VECTOR(15 downto 0);
     reg4 : out STD_LOGIC_VECTOR(15 downto 0);
     reg5 : out STD_LOGIC_VECTOR(15 downto 0);
     reg6 : out STD_LOGIC_VECTOR(15 downto 0);
     reg7 : out STD_LOGIC_VECTOR(15 downto 0)
    );
 END COMPONENT;
  
  --Inputs
  signal src_S0: STD_LOGIC := '0';
  signal src_S1: STD_LOGIC := '0';
  signal src_S2: STD_LOGIC := '0';
  signal des_A0: STD_LOGIC := '0';
  signal des_A1: STD_LOGIC := '0';
  signal des_A2: STD_LOGIC := '0';
  signal data_Load: STD_LOGIC := '0';
  signal clk: STD_LOGIC := '0';
  signal data: std_logic_vector(15 downto 0) := (others => '0');
  
  --Outputs
  signal Q: STD_LOGIC_VECTOR(15 downto 0);
  signal reg0: STD_LOGIC_VECTOR(15 downto 0);
  signal reg1: STD_LOGIC_VECTOR(15 downto 0);
  signal reg2: STD_LOGIC_VECTOR(15 downto 0);
  signal reg3: STD_LOGIC_VECTOR(15 downto 0);
  signal reg4: STD_LOGIC_VECTOR(15 downto 0);
  signal reg5: STD_LOGIC_VECTOR(15 downto 0);
  signal reg6: STD_LOGIC_VECTOR(15 downto 0);
  signal reg7: STD_LOGIC_VECTOR(15 downto 0);
  
  
 -- Clock period 
CONSTANT clk_period: Time := 10 ns;

BEGIN
 -- Instantiate the Unit Under Test (UUT)
 uut: reg_file PORT MAP (
 src_S0=>src_S0,
 src_S1=>src_S1,
 src_S2=>src_S2,
 des_A0=>des_A0,
 des_A1=>des_A1,
 des_A2=>des_A2,
 data_Load=>data_Load,
 clk=>clk,
 data=>data,
 Q=>Q,
 reg0=>reg0,
 reg1=>reg1,
 reg2=>reg2,
 reg3=>reg3,
 reg4=>reg4,
 reg5=>reg5,
 reg6=>reg6,
 reg7=>reg7
 );
 
 -- Clock process 
clk_process:process
begin
clk<='0';
wait for clk_period/2;
clk<='1';
wait for clk_period/2;
end process;

stim_proc: process
begin
wait for 10ns;
des_A0 <= '0';
des_A1 <= '0';
des_A2 <= '0';
data <= x"FFFF";

wait for 10ns;
des_A0 <= '0';
des_A1 <= '0';
des_A2 <= '1';
data <= x"EEEE";

wait for 10ns;
des_A0 <= '0';
des_A1 <= '1';
des_A2 <= '0';
data <= x"DDDD";

wait for 10ns;
des_A0 <= '0';
des_A1 <= '1';
des_A2 <= '1';
data <= x"CCCC";

wait for 10ns;
des_A0 <= '1';
des_A1 <= '0';
des_A2 <= '0';
data <= x"BBBB";

wait for 10ns;
des_A0 <= '1';
des_A1 <= '0';
des_A2 <= '1';
data <= x"AAAA";

wait for 10ns;
des_A0 <= '1';
des_A1 <= '1';
des_A2 <= '0';
data <= x"9999";

wait for 10ns;
des_A0 <= '1';
des_A1 <= '1';
des_A2 <= '1';
data <= x"8888";
end process;
END;
