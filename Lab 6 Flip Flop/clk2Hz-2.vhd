----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2022 01:37:11 PM
-- Design Name: 
-- Module Name: clk2Hz - Behavioral
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

entity clk2Hz is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end clk2Hz;

architecture Behavioral of clk2Hz is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 125000000 := 0;
begin
    process (reset, clk_in) begin
        if (reset = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = 62500000/2) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;

end Behavioral;