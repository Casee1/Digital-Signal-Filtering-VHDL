----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2023 01:24:31 PM
-- Design Name: 
-- Module Name: 7seg - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seg is
    Port ( clk : in STD_LOGIC;
           digit0 : in STD_LOGIC_VECTOR (3 downto 0);
           digit1 : in STD_LOGIC_VECTOR (3 downto 0);
           digit2 : in STD_LOGIC_VECTOR (3 downto 0);
           digit3 : in STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end seg;

architecture Behavioral of seg is

signal counter:std_logic_vector(15 downto 0);
signal mux1:std_logic_vector(3 downto 0);

begin
    process(clk)
    begin
        if clk='1' and clk'event then
            counter<=counter+1;
        end if;
    end process;
    
    process(counter(15 downto 14), digit0, digit1, digit2, digit3)
    begin
        case counter(15 downto 14) is
            when"00" =>mux1 <=digit3;
            when"01" =>mux1 <=digit2;
            when"10" =>mux1 <=digit1;
            when"11" =>mux1 <=digit0;
            when others =>mux1 <=digit3;
        end case;
    end process;
    
    process(counter(15 downto 14))
    begin
        case counter(15 downto 14) is
            when "00" => an <="1110";
            when "01" => an <="1101";
            when "10" => an <="1011";
            when "11" => an <="0111";
            when others => an <= "1110";
        end case;
    end process;
    
    process(mux1)
    begin
        case mux1 is
            
           when "0001" => cat <= B"111_1001";
           when "0010" => cat <= B"010_0100";
           when "0011" => cat <= B"011_0000";
           when "0100" => cat <= B"001_1001";
           when "0101" => cat <= B"001_0010";
           when "0110" => cat <= B"000_0010";
           when "0111" => cat <= B"111_1000";
           when "1000" => cat <= B"000_0000";
           when "1001" => cat <= B"001_0000";
           when "1010" => cat <= B"000_1000";
           when "1011" => cat <= B"000_0011";
           when "1100" => cat <= B"100_0110";
           when "1101" => cat <= B"010_0001";
           when "1110" => cat <= B"000_0110";
           when "1111" => cat <= B"000_1110";
           when others => cat <= B"100_0000";
       end case;
    end process;

end Behavioral;