----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/01/09 11:17:56
-- Design Name: 
-- Module Name: CNT_8updn_en - Behavioral
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
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CNT_8updn_en is
  Port (CLOCK : IN std_logic;
        RESET : IN std_logic;
        EN : IN std_logic;
        UP_DN_CTRL : IN std_logic;
        OUTPUT : OUT std_logic_vector(7 downto 0));
end CNT_8updn_en;

architecture Behavioral of CNT_8updn_en is
    signal OUTPUT_TEMP : std_logic_vector(7 downto 0) := "00000000";
    
begin
    process(CLOCK, RESET, EN, UP_DN_CTRL, OUTPUT_TEMP)
    begin
    IF rising_edge(CLOCK) THEN
        IF(RESET = '1') THEN
            OUTPUT_TEMP <= "00000000";
        ELSE
            CASE EN IS
                WHEN '0' => OUTPUT_TEMP <= OUTPUT_TEMP;
                WHEN '1' => IF UP_DN_CTRL = '0' THEN
                                 OUTPUT_TEMP <= OUTPUT_TEMP - '1';
                            elsif UP_DN_CTRL = '1' THEN
                                 OUTPUT_TEMP <= OUTPUT_TEMP + '1';
                            END IF;
                WHEN OTHERS => OUTPUT_TEMP <= OUTPUT_TEMP;
            END CASE;
        END IF;
    END IF;
    END process;
    
    PROCESS(CLOCK, OUTPUT_TEMP)
    BEGIN 
        OUTPUT <= OUTPUT_TEMP;
    END PROCESS;

end Behavioral;
