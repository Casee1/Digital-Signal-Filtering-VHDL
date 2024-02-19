----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2023 13:20:06
-- Design Name: 
-- Module Name: adder16bits - Behavioral
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

entity adder16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (15 downto 0);
           Cout : out STD_LOGIC);
end adder16bits;

architecture Behavioral of adder16bits is
component fulladder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component fulladder;
signal SIs : STD_LOGIC_VECTOR(15 downto 0);

begin
    
    SIs(0) <= Cin;
    gen_fulladder : for i in 0 to 14 generate
        full_adder_i_till_14 : fulladder port map(A(i), B(i), SIs(i), S(i), SIs(i+1));
    end generate;
        full_adder_15 : fulladder port map(A(15), B(15), SIs(15), S(15), Cout);


end Behavioral;
