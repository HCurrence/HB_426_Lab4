----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2021 09:19:47 PM
-- Design Name: 
-- Module Name: Instruction_Memory_TB - Behavioral
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

entity Instruction_Memory_TB is
end Instruction_Memory_TB;

architecture Behavioral of Instruction_Memory_TB is

-- constants
constant MAX_DELAY : time := 200 ns;
constant N : integer := 1;

-- signals
signal address : unsigned(15 downto 0);
signal rs_sig, rt_sig, rd_sig, func_code : unsigned(2 downto 0);
signal imm : unsigned(5 downto 0);
signal op_code : unsigned(3 downto 0);
signal jump_shift : unsigned(11 downto 0);

begin

    stimulus : process
    begin
        for i in 0 to N loop
            address <= TO_UNSIGNED(i, 16);
            wait for MAX_DELAY;
        end loop;
    end process stimulus;
    
    DUT : entity work.Instruction_Memory(Behavioral)
        port map(Read_Address => address, Rs => rs_sig,
                Rt => rt_sig, Rd => rd_sig, Func => func_code,
                immediate => imm, Opcode => op_code,
                Instruction_Jump_Shift => jump_shift);


end Behavioral;
