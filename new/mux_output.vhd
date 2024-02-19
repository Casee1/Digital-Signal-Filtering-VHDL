----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2023 22:46:38
-- Design Name: 
-- Module Name: mux_output - Behavioral
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

entity mux_output is
--  Port ( );
    Port( output_filter1 : in std_logic_vector(15 downto 0);
          output_filter2 : in std_logic_vector(15 downto 0);
          output_filter3 : in std_Logic_vector(15 downto 0);
          sel : in std_logic_vector(1 downto 0);
          result : out std_logic_vector(15 downto 0)
    );
    
end mux_output;

architecture Behavioral of mux_output is

begin
    
    process(output_filter1,output_filter2,output_filter3,sel)
    begin
        --case sel is
        --    when "00" => result <= output_filter1;
        --    when "01" => result <= output_filter2;
        --    when "10" => result <= output_filter3;
        --    when others => result <= "0000000000000000";
       -- end case;
       if sel = "00" then
           result <= output_filter1;
       elsif sel = "01" then
           result <= output_filter2;
       elsif sel = "10" then
           result <= output_filter3;
       else
           result <= "0000000000000000";
       end if;
    end process;

end Behavioral;
