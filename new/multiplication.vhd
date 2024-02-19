----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2023 13:21:55
-- Design Name: 
-- Module Name: multiplication - Behavioral
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

entity multiplication is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           P : out STD_LOGIC_VECTOR (15 downto 0));
end multiplication;

architecture Behavioral of multiplication is
component adder8bits is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Cout : out STD_LOGIC);
end component adder8bits;

component bigadders is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end component bigadders;

    signal attemp : STD_LOGIC_VECTOR(7 downto 0);
    signal bttemp : STD_LOGIC_VECTOR(7 downto 0);
    signal cout,cout1,cout2,cout3,cout4,cout5,cout6 : STD_LOGIC;
    signal s,s1,s2,s3,s4,s5,s6,s7 : STD_LOGIC_VECTOR(7 downto 0);
    signal attemp1,bttemp1,attemp2,bttemp2,attemp3,bttemp3,attemp4,bttemp4,attemp5,bttemp5 : STD_LOGIC_VECTOR(7 downto 0);
    signal attemp6,bttemp6: STD_LOGIC_VECTOR(7 downto 0);
    
begin
    
    bigadder1 : bigadders port map(A, B(0), s);
    bigadder2 : bigadders port map(A, B(1), s1);
    bigadder3 : bigadders port map(A, B(2), s2);
    bigadder4 : bigadders port map(A, B(3), s3);
    bigadder5 : bigadders port map(A, B(4), s4);
    bigadder6 : bigadders port map(A, B(5), s5);
    bigadder7 : bigadders port map(A, B(6), s6);
    bigadder8 : bigadders port map(A, B(7), s7);
    
    bttemp <= '0' & s(7 downto 1);
    P(0) <= s(0);
    
    add1: adder8bits port map(s1, bttemp, '0', attemp, cout);
    bttemp1 <= cout & attemp(7 downto 1);
    P(1) <= attemp(0);
    add2: adder8bits port map(s2, bttemp1, '0', attemp1, cout1);
    bttemp2 <= cout1 & attemp1(7 downto 1);
    P(2) <= attemp1(0);
    
    add3: adder8bits port map(s3, bttemp2, '0', attemp2, cout2);
    bttemp3 <= cout2 & attemp2(7 downto 1);
    P(3) <= attemp2(0);
    
    add4: adder8bits port map(s4, bttemp3, '0', attemp3, cout3);
    bttemp4 <= cout3 & attemp3(7 downto 1);
    P(4) <= attemp3(0);
    
    add5: adder8bits port map(s5, bttemp4, '0', attemp4, cout4);
    bttemp5 <= cout4 & attemp4(7 downto 1);
    P(5) <= attemp4(0);
    
    add6 : adder8bits port map(s6, bttemp5, '0', attemp5, cout5);
    bttemp6 <= cout5 & attemp5(7 downto 1);
    P(6) <= attemp5(0);
    
    add7 : adder8bits port map(s7, bttemp6, '0', attemp6, cout6);
    
    P(7) <= attemp6(0);
    P(8) <= attemp6(1);
    P(9) <= attemp6(2);
    P(10) <= attemp6(3);
    P(11) <= attemp6(4);
    P(12) <= attemp6(5);
    P(13) <= attemp6(6);
    P(14) <= attemp6(7);
    P(15) <= cout6;
    

end Behavioral;
