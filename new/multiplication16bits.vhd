----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2023 18:34:37
-- Design Name: 
-- Module Name: multiplication16bits - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplication16bits is
Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
       B : in STD_LOGIC_VECTOR (15 downto 0);
       P : out STD_LOGIC_VECTOR (31 downto 0));
end multiplication16bits;

architecture Behavioral of multiplication16bits is

component adder16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (15 downto 0);
           Cout : out STD_LOGIC);
end component adder16bits;

component bigadders16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (15 downto 0));
end component bigadders16bits;

signal s,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15 : STD_LOGIC_VECTOR(15 downto 0);
signal attemp : STD_LOGIC_VECTOR(15 downto 0);
signal bttemp : STD_LOGIC_VECTOR(15 downto 0);
signal cout,cout1,cout2,cout3,cout4,cout5,cout6,cout7,cout8,cout9,cout10,cout11,cout12,cout13,cout14 : STD_LOGIC;
signal attemp1,bttemp1,attemp2,bttemp2,attemp3,bttemp3,attemp4,bttemp4,attemp5,bttemp5 : STD_LOGIC_VECTOR(15 downto 0);
signal attemp6,bttemp6,attemp7,bttemp7,attemp8,bttemp8,attemp9,bttemp9,attemp10,bttemp10: STD_LOGIC_VECTOR(15 downto 0);
signal attemp11,bttemp11,attemp12,bttemp12,attemp13,bttemp13,attemp14,bttemp14: STD_LOGIC_VECTOR(15 downto 0);


begin

    bigadder1 : bigadders16bits port map(A, B(0), s);
    bigadder2 : bigadders16bits port map(A, B(1), s1);
    bigadder3 : bigadders16bits port map(A, B(2), s2);
    bigadder4 : bigadders16bits port map(A, B(3), s3);
    bigadder5 : bigadders16bits port map(A, B(4), s4);
    bigadder6 : bigadders16bits port map(A, B(5), s5);
    bigadder7 : bigadders16bits port map(A, B(6), s6);
    bigadder8 : bigadders16bits port map(A, B(7), s7);
    bigadder9 : bigadders16bits port map(A, B(8), s8);
    bigadder10 : bigadders16bits port map(A, B(9), s9);
    bigadder11 : bigadders16bits port map(A, B(10), s10);
    bigadder12 : bigadders16bits port map(A, B(11), s11);
    bigadder13 : bigadders16bits port map(A, B(12), s12);
    bigadder14 : bigadders16bits port map(A, B(13), s13);
    bigadder15 : bigadders16bits port map(A, B(14), s14);
    bigadder16 : bigadders16bits port map(A, B(15), s15);
    
    bttemp <= '0' & s(15 downto 1);
    P(0) <= s(0);
    
   add1: adder16bits port map(s1, bttemp, '0', attemp, cout);
   bttemp1 <= cout & attemp(15 downto 1);
   P(1) <= attemp(0);
   
   add2: adder16bits port map(s2, bttemp1, '0', attemp1, cout1);
   bttemp2 <= cout1 & attemp1(15 downto 1);
   P(2) <= attemp1(0);
   
   add3: adder16bits port map(s3, bttemp2, '0', attemp2, cout2);
   bttemp3 <= cout2 & attemp2(15 downto 1);
   P(3) <= attemp2(0);
       
   add4: adder16bits port map(s4, bttemp3, '0', attemp3, cout3);
   bttemp4 <= cout3 & attemp3(15 downto 1);
   P(4) <= attemp3(0);
       
   add5: adder16bits port map(s5, bttemp4, '0', attemp4, cout4);
   bttemp5 <= cout4 & attemp4(15 downto 1);
   P(5) <= attemp4(0);
       
   add6 : adder16bits port map(s6, bttemp5, '0', attemp5, cout5);
   bttemp6 <= cout5 & attemp5(15 downto 1);
   P(6) <= attemp5(0);
       
   add7 : adder16bits port map(s7, bttemp6, '0', attemp6, cout6);
   bttemp7 <= cout6 & attemp6(15 downto 1);
   P(7) <= attemp6(0);
   
   add8 : adder16bits port map(s8, bttemp7, '0', attemp7, cout7);
   bttemp8 <= cout7 & attemp7(15 downto 1);
   P(8) <= attemp7(0);
   
   add9 : adder16bits port map(s9, bttemp8, '0', attemp8, cout8);
   bttemp9 <= cout8 & attemp8(15 downto 1);
   P(9) <= attemp8(0);
   
   add10: adder16bits port map(s10, bttemp9, '0', attemp9, cout9);
   bttemp10 <= cout9 & attemp9(15 downto 1);
   P(10) <= attemp9(0);
   
   add11 : adder16bits port map(s11, bttemp10, '0', attemp10, cout10);
   bttemp11 <= cout10 & attemp10(15 downto 1);
   P(11) <= attemp10(0);
   
   add12 : adder16bits port map(s12, bttemp11, '0', attemp11, cout11);
   bttemp12 <= cout11 & attemp11(15 downto 1);
   P(12) <= attemp11(0);
   
   add13 : adder16bits port map(s13, bttemp12, '0', attemp12, cout12);
   bttemp13 <= cout12 & attemp12(15 downto 1);
   P(13) <= attemp12(0);
   
   add14 : adder16bits port map(s14, bttemp13, '0', attemp13, cout13);
   bttemp14 <= cout13 & attemp13(15 downto 1);
   P(14) <= attemp13(0);
   
   add15 : adder16bits port map(s15, bttemp14, '0', attemp14, cout14);
   
   P(15) <= attemp14(0);
   P(16) <= attemp14(1);
   P(17) <= attemp14(2);
   P(18) <= attemp14(3);
   P(19) <= attemp14(4);
   P(20) <= attemp14(5);
   P(21) <= attemp14(6);
   P(22) <= attemp14(7);
   P(23) <= attemp14(8);
   P(24) <= attemp14(9);
   P(25) <= attemp14(10);
   P(26) <= attemp14(11);
   P(27) <= attemp14(12);
   P(28) <= attemp14(13);
   P(29) <= attemp14(14);
   P(30) <= attemp14(15);
   P(31) <= cout14;
   
   
   
end Behavioral;
