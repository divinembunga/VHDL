----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:52:20 11/02/2019 
-- Design Name: 
-- Module Name:   Register File - Behavioral 
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

ENTITY reg_file IS
	PORT(src_S0,src_S1,src_S2 : in STD_LOGIC;
		des_A0,des_A1,des_A2 : in STD_LOGIC;
		data_Load, clk : in STD_LOGIC;
		data : in STD_LOGIC_VECTOR(15 downto 0);
		Q 	: out STD_LOGIC_VECTOR(15 downto 0);
		reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : out STD_LOGIC_VECTOR(15 downto 0)
		);
end reg_file;

ARCHITECTURE Behavioral OF reg_file IS
--registers
  COMPONENT reg
	PORT(load, clk: in STD_LOGIC;
		 D: in STD_LOGIC_VECTOR(15 downto 0);
		 Q: out STD_LOGIC_VECTOR(15 downto 0)
		);
  END COMPONENT;
  
--decoder 
  COMPONENT decoder
	PORT(A0,A1,A2: in STD_LOGIC;
		Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7: out STD_LOGIC 
		);
  END COMPONENT;
  
--multiplexer 2-16 bit
  COMPONENT mux2_16
	PORT(IN0, IN1: in STD_LOGIC_VECTOR(15 downto 0);
		 S: in STD_LOGIC;
		 Z: out STD_LOGIC_VECTOR(15 downto 0)
		);
  END COMPONENT;
  
--multiplexer 8-16 bit
  COMPONENT mux8_16
	PORT(IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7: in STD_LOGIC_VECTOR(15 downto 0);
		 S0,S1,S2: STD_LOGIC;
		 Z: out STD_LOGIC_VECTOR(15 downto 0)
		);
  END COMPONENT;
	
--signals
	--load in for each register
	signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7: STD_LOGIC;
	--output for each register
	signal q_reg0, q_reg1, q_reg2, q_reg3, q_reg4, q_reg5, q_reg6, q_reg7: STD_LOGIC_VECTOR(15 downto 0);
	signal data_src_out,src_Reg: STD_LOGIC_VECTOR(15 downto 0);
	
begin
	reg00 : reg PORT MAP(
			load=>load_reg0,
			clk=>clk,
			D=>data_src_out,
			Q=>q_reg0
	      );
	
	reg01 : reg PORT MAP(
			load=>load_reg1,
			clk=>clk,
			D=>data_src_out,
			Q=>q_reg1
          );
	
	reg02 : reg PORT MAP(
			load=>load_reg2,
			clk=>clk,
			D=>data_src_out,
			Q=>q_reg2
	      );

	reg03 : reg PORT MAP(
			load=>load_reg3,
			clk=>clk,
			D=>data_src_out,
			Q=>q_reg3
	      );
	
	
	reg04 : reg PORT MAP(
			load=>load_reg4,
			clk=>clk,
			D=>data_src_out,
			Q=>q_reg4
	      );
	
	reg05 : reg PORT MAP(
			load=>load_reg5,
			clk=>clk,
			D=>data_src_out,
			Q=>q_reg5
	      );
	
	reg06 : reg PORT MAP(
			load=>load_reg6,
			clk=>clk,
			D=>data_src_out,
			Q=>q_reg6
	      );
	
	reg07 : reg PORT MAP(
			load=>load_reg7,
			clk=>clk,
			D=>data_src_out,
			Q=>q_reg7
	      );
	
	dest_decoder: decoder PORT MAP(
			A0=>des_A0,
			A1=>des_A1,
			A2=>des_A2,
			Q0=>load_reg0,
			Q1=>load_reg1,
			Q2=>load_reg2,
			Q3=>load_reg3,
			Q4=>load_reg4,
			Q5=>load_reg5,
			Q6=>load_reg6,
			Q7=>load_reg7
		);
	
	src_mux_2: mux2_16 PORT MAP(
			IN0=>data,
			IN1=>src_Reg,
			S=>data_Load,
			Z=>data_src_out
		);
	
	src_mux_8: mux8_16 PORT MAP(
			IN0=>q_reg0,
			IN1=>q_reg1,
			IN2=>q_reg2,
			IN3=>q_reg3,
			IN4=>q_reg4,
			IN5=>q_reg5,
			IN6=>q_reg6,
			IN7=>q_reg7,
			S0=>src_S0,
			S1=>src_S1,
			S2=>src_S2,
			Z=>src_Reg
		);
		
	--instantiation
	reg0<=q_reg0;
	reg1<=q_reg1;
	reg2<=q_reg2;
	reg3<=q_reg3;
	reg4<=q_reg4;
	reg5<=q_reg5;
	reg6<=q_reg6;
	reg7<=q_reg7;
	
end Behavioral;