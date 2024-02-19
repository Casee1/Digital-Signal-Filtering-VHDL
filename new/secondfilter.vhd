----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2023 09:20:34
-- Design Name: 
-- Module Name: secondfilter - Behavioral
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

entity secondfilter is
    Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           x3 : in STD_LOGIC_VECTOR (7 downto 0);
           control : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (15 downto 0)
          -- y_3 : out STD_LOGIC_VECTOR (15 downto 0)
            );
end secondfilter;

architecture Behavioral of secondfilter is

component adder16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (15 downto 0);
           Cout : out STD_LOGIC);
end component adder16bits;

component multiplication is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           P : out STD_LOGIC_VECTOR (15 downto 0));
end component multiplication;


constant a : std_logic_vector(7 downto 0) := "00000001"; --=01
constant b : std_logic_vector(7 downto 0) := "00011000"; --=18
constant c : std_logic_vector(7 downto 0) := "10101010"; --=AA

signal P1: std_logic_vector(15 downto 0);
signal P2: std_logic_vector(15 downto 0);
signal P3: std_logic_vector(15 downto 0);

signal S1 : std_logic_vector(15 downto 0);
signal carry_out_signal : std_logic;
signal final_carry_out : std_logic;
signal output : STD_LOGIC_VECTOR (15 downto 0):=(others => '0');
 
begin
    
    first_mul : multiplication port map(A => x1, B => a, P => P1);
    second_mul : multiplication port map(A => x2, B => b, P => P2);
    third_mul : multiplication port map(A => x3, B =>c, P => P3);
    
    first_adder : adder16bits port map(A => P1, B => P2, Cin => '0', S => S1, Cout => carry_out_signal);
    second_adder : adder16bits port map(A => S1, B=> P3, Cin => carry_out_signal, S => output, Cout => final_carry_out);
    y <= output when control = '1';
  
end Behavioral;
