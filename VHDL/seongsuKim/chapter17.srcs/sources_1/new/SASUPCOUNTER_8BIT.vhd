----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/08 16:23:19
-- Design Name: 
-- Module Name: SASUPCOUNTER_8BIT - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SASUPCOUNTER_8BIT is
  port(clock : in std_logic;
       reset : in std_logic;
       sync_reset : in std_logic;
       enable_cont : in std_logic;
       output : out std_logic_vector(7 downto 0));
--  Port ( );
end SASUPCOUNTER_8BIT;

architecture Behavioral of SASUPCOUNTER_8BIT is
    signal output_temp : std_logic_vector(7 downto 0) := "00000000";
begin
    process(clock, reset, sync_reset, enable_cont, output_temp)
    begin
        if (reset = '1') then
            output_temp <= "00000000";
        elsif rising_edge(clock) then
            if (sync_reset = '1') then
                output_temp <= "00000000"; -- why needed? reset can do the job
            elsif (sync_reset = '0') and (enable_cont = '1') then
                output_temp <= output_temp + 1;
            end if;
        end if;
    end process;
    
    process(output_temp)
    begin
        output <= output_temp;
    end process;
end Behavioral;
