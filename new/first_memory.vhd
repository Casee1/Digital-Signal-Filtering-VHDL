----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2023 16:07:31
-- Design Name: 
-- Module Name: first_memory - Behavioral
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

entity first_memory is
    Port ( current_input : in STD_LOGIC_VECTOR (7 downto 0);
           input0 : out STD_LOGIC_VECTOR (7 downto 0);
           input1 : out STD_LOGIC_VECTOR (7 downto 0);
           input2 : out STD_LOGIC_VECTOR (7 downto 0);
           clock : in STD_LOGIC);
end first_memory;

architecture Behavioral of first_memory is

signal s_input0, s_input1, s_input2 : std_logic_vector(7 downto 0) := "00000000";

begin

    process(clock)
    begin
        if rising_edge(clock) then
            s_input1 <= s_input0;
            s_input0 <= current_input;
        end if;

    end process;
    
    input0 <= current_input;
    input1 <= s_input0;
    input2 <= s_input1;

end Behavioral;
