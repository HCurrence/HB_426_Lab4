----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2021 09:22:11 PM
-- Design Name: 
-- Module Name: ALUctr_TB - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity ALUctr_TB is
end ALUctr_TB;

architecture Behavioral of ALUctr_TB is

-- constants
constant MAX_DELAY : time := 200 ns;
constant N : integer := 16;

-- test values
type codes is array(0 to 7) of unsigned(2 downto 0);
constant ctrl_codes : codes := ("000", "001", "010", "011",
                                "100", "101", "110", "111");
type test_values is array (0 to 4) of unsigned(15 downto 0);
constant a_values : test_values := ("0000000000000000", "0000000000000001", "0000000000000001",
                                    "1010101010101010", "0000000011111111");
constant b_values : test_values := ("0000000000000000", "0000000000000001", "0000000000000010",
                                    "1010101010101010", "0000000011111111");

-- signals
signal ctrl_code : unsigned(2 downto 0);
signal in1, in2, result_sig : unsigned(15 downto 0);
signal zero_sig, overflow_sig, carry: std_logic; 

begin

    stimulus : process
    begin
        for i in 0 to 7 loop
            ctrl_code <= ctrl_codes(i);
            for j in 0 to 4 loop
                in1 <= a_values(j);
                in2 <= b_values(j);
                wait for MAX_DELAY;
            end loop;
        end loop;
    end process stimulus;
    
    DUT : entity work.ALUctr(behavior)
        port map(ALUCtr => ctrl_code, BusA => in1,
                BusB => in2, zero => zero_sig,
                overflow => overflow_sig, carryout => carry,
                result => result_sig);
end Behavioral;
