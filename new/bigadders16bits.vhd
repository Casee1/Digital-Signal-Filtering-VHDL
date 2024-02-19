----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2023 18:39:14
-- Design Name: 
-- Module Name: bigadders16bits - Behavioral
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

entity bigadders16bits is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (15 downto 0));
end bigadders16bits;

architecture Behavioral of bigadders16bits is

begin
    
        S(0) <= B AND A(0);
        S(1) <= B AND A(1);
        S(2) <= B AND A(2);
        S(3) <= B AND A(3);
        S(4) <= B AND A(4);
        S(5) <= B AND A(5);
        S(6) <= B AND A(6);
        S(7) <= B AND A(7);
        S(8) <= B AND A(8);
        S(9) <= B AND A(9);
        S(10) <= B AND A(10);
        S(11) <= B AND A(11);
        S(12) <= B AND A(12);
        S(13) <= B AND A(13);
        S(14) <= B AND A(14);
        S(15) <= B AND A(15);

end Behavioral;
