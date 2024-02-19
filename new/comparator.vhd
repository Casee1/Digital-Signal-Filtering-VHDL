----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2023 14:56:23
-- Design Name: 
-- Module Name: comparator - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           equal : out STD_LOGIC;
           smaller : out STD_LOGIC;
           greater : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is
signal result : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin
    process(a, b) 
    begin
        if a = b then
            result <= "010";
        elsif a < b then
            result <= "001";
        elsif a > b then
            result <= "100";
        end if;
        
    end process;
    
    greater <= result(2);
    equal <= result(1);
    smaller <= result(0);
    
end Behavioral;
