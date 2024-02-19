----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2023 16:55:50
-- Design Name: 
-- Module Name: project - Behavioral
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

entity project is
    Port ( clock : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC_VECTOR(1 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0);
           an : out std_logic_vector (3 downto 0);
           cat : out std_logic_vector(6 downto 0));
end project;

architecture Behavioral of project is

component mux is
    Port ( filter1 : in STD_LOGIC;
           filter2 : in STD_LOGIC;
           filter3 : in STD_LOGIC;
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           result : out STD_LOGIC);
end component mux;

component mux_output is
--  Port ( );
    Port( output_filter1 : in std_logic_vector(15 downto 0);
          output_filter2 : in std_logic_vector(15 downto 0);
          output_filter3 : in std_Logic_vector(15 downto 0);
          sel : in std_logic_vector(1 downto 0);
          result : out std_logic_vector(15 downto 0)
    ); 
end component mux_output;

component first_memory is
    Port ( current_input : in STD_LOGIC_VECTOR (7 downto 0);
           input0 : out STD_LOGIC_VECTOR (7 downto 0);
           input1 : out STD_LOGIC_VECTOR (7 downto 0);
           input2 : out STD_LOGIC_VECTOR (7 downto 0);
           clock : in STD_LOGIC);
end component first_memory;

component firstfilter is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR(15 downto 0));
end component firstfilter;

component secondfilter is
    Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           x3 : in STD_LOGIC_VECTOR (7 downto 0);
           control : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component secondfilter;

component thirdfilter is
    Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           y1 : in STD_LOGIC_VECTOR (15 downto 0);
           y2 : out STD_LOGIC_VECTOR (15 downto 0));
end component thirdfilter;

component seg is
    Port ( clk : in STD_LOGIC;
           digit0 : in STD_LOGIC_VECTOR (3 downto 0);
           digit1 : in STD_LOGIC_VECTOR (3 downto 0);
           digit2 : in STD_LOGIC_VECTOR (3 downto 0);
           digit3 : in STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component seg;

signal s_input0, s_input1, s_input2 : std_logic_vector(7 downto 0) := "00000000";
signal output_firstfilter : std_logic_vector(15 downto 0) := "0000000000000000";
signal output_secondfilter : std_logic_vector(15 downto 0) := "0000000000000000";
signal output_thirdfilter : std_logic_vector(15 downto 0) := "0000000000000000";
signal output_thirdfilter1 : std_logic_vector(15 downto 0) := "0000000000000000";
signal input_thirdfilter : std_logic_vector(15 downto 0) := "0000000000000000";
signal output_mux : std_logic_vector(15 downto 0) := "0000000000000000";
signal y_31 : std_logic_vector(15 downto 0) := "0000000000000000";
signal control : std_logic;

begin

    InputMemoty : first_memory port map(current_input => input, input0 => s_input0, input1 => s_input1, input2 => s_input2, clock => clock);
    FirstFilterz : firstfilter port map(input => s_input0, output => output_firstfilter);
    SecondFilterz : secondfilter port map(x1 => s_input0, x2 => s_input1, x3 => s_input2, control => control, y => output_secondfilter);
    control <= '1' when sel = "01" else '0';
    ThirdFilterz : thirdfilter port map(x1 => s_input0, x2 => s_input1, y1 => output_secondfilter , y2 => output_thirdfilter);
    MuxOutputz : mux_output port map(output_filter1 => output_firstfilter, output_filter2 => output_secondfilter, output_filter3 => output_thirdfilter, sel => sel, result => output_mux);
    
    output <= output_mux;
    
    display : seg port map (clk => clock, digit0 => output_mux(15 downto 12), digit1 => output_mux(11 downto 8), digit2 => output_mux(7 downto 4), digit3 => output_mux(3 downto 0), cat => cat, an => an);
    
    

end Behavioral;
