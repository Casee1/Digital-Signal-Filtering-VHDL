----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2023 16:28:40
-- Design Name: 
-- Module Name: firstfilter - Behavioral
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

entity firstfilter is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR(15 downto 0));
end firstfilter;

architecture Behavioral of firstfilter is
component comparator is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           equal : out STD_LOGIC;
           smaller : out STD_LOGIC;
           greater : out STD_LOGIC);
end component comparator;

signal smaller1, smaller2 :STD_LOGIC := '0';
signal greater1, greater2 : STD_LOGIC := '0';
signal equal1, equal2 : STD_LOGIC := '0';
signal output1 : STD_LOGIC := '0';
signal output2 : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
begin

    firstcomparator : comparator port map(a => input, b => "00000101", equal => equal1, smaller => smaller1, greater => greater1);
    secondcomparator : comparator port map(a=>input, b => "00011110", equal => equal2, smaller => smaller2, greater => greater2);
    
    output1 <= not (smaller1 OR greater2);
    
    output <= "00000000" & input when output1 = '1' else "0000000000000000";

    
end Behavioral;
