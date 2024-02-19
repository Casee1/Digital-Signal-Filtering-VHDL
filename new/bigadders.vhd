----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2023 13:18:20
-- Design Name: 
-- Module Name: bigadders - Behavioral
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

entity bigadders is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end bigadders;

architecture Behavioral of bigadders is

begin
    S(0) <= B AND A(0);
    S(1) <= B AND A(1);
    S(2) <= B AND A(2);
    S(3) <= B AND A(3);
    S(4) <= B AND A(4);
    S(5) <= B AND A(5);
    S(6) <= B AND A(6);
    S(7) <= B AND A(7);

end Behavioral;
