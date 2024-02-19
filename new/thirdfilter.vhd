----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2023 10:40:48
-- Design Name: 
-- Module Name: thirdfilter - Behavioral
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

entity thirdfilter is
    Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           y1 : in STD_LOGIC_VECTOR (15 downto 0);
           y2 : out STD_LOGIC_VECTOR (15 downto 0));
end thirdfilter;

architecture Behavioral of thirdfilter is

component adder8bits is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Cout : out STD_LOGIC);
end component adder8bits;

component multiplication is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           P : out STD_LOGIC_VECTOR (15 downto 0));
end component multiplication;

component adder16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (15 downto 0);
           Cout : out STD_LOGIC);
end component adder16bits;

component concatenare is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end component concatenare;

component multiplication16bits is
Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
       B : in STD_LOGIC_VECTOR (15 downto 0);
       P : out STD_LOGIC_VECTOR (31 downto 0));
end component multiplication16bits;

constant a : std_logic_vector(7 downto 0) := "00000001"; --=01
constant b : std_logic_vector(7 downto 0) := "00011000"; --=18
constant c : std_logic_vector(7 downto 0) := "10101010"; --=AA
constant d : std_logic_vector(7 downto 0) := "00011101"; --=1D

signal S1 : std_logic_vector(7 downto 0);
signal S2: std_logic_vector(15 downto 0);
signal cout1 : std_logic;
signal cout2: std_logic;
signal cout_final: std_logic;

signal P1 : std_logic_vector(15 downto 0);
signal P2 : std_logic_vector(15 downto 0);
signal P3 : std_logic_vector(31 downto 0);

signal d1 : std_logic_vector(15 downto 0);

begin

    adderBetweenConstants : adder8bits port map (A => a, B => b, Cin => '0', S => S1, Cout => cout1);
    
    first_mul : multiplication port map (A=> S1, B => x1, P => P1);
    second_mul : multiplication port map( A => x2, B => c, P => P2);
    
    concate : concatenare port map( input => d, output => d1);
    third_mul : multiplication16bits port map(A=>y1, B=>d1, P=> P3);
    
    first_adder : adder16bits port map(A=> P1, B=>P2, Cin => '0', S => S2, Cout => cout2);
    second_adder: adder16bits port map(A=>S2, B=> P3(15 downto 0), Cin => cout2, S=>y2, Cout => cout_final);
    

end Behavioral;
