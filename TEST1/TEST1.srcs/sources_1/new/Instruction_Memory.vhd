----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2021 04:10:41 PM
-- Design Name: 
-- Module Name: Instruction_Memory - Behavioral
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

entity Instruction_Memory is
    Port ( Read_Address : in unsigned (15 downto 0);
           Rs : out unsigned (2 downto 0);
           Rt : out unsigned (2 downto 0);
           Rd : out unsigned (2 downto 0);
           Func : out unsigned (2 downto 0);
           immediate : out unsigned(5 downto 0);
           Opcode : out unsigned (3 downto 0);
           Instruction_Jump_Shift : out unsigned(11 downto 0));
           
end Instruction_Memory;

architecture Behavioral of Instruction_Memory is
    type memory_data is array(0 to 65535) of unsigned(15 downto 0);
    
    signal memory : memory_data;

begin
    set_instructions : process
    begin
        memory(0)  <= "1111000000000000";
        memory(1)  <= "1111000001000000";
        memory(2)  <= "1111000010000000";
        memory(3)  <= "1111000011000000";
        memory(4)  <= "1111000100000000";
        memory(5)  <= "1111000101000000";
        memory(6)  <= "1111000110000000";
        memory(7)  <= "1111000111000000";
        memory(8)  <= "1000000000000100";
        memory(9)  <= "0110000001000001";
        memory(10) <= "1000000001000001";
        memory(11) <= "1001000010001111";
        memory(12) <= "1000000011001111";
        memory(13) <= "1000000000000001";
        memory(14) <= "1001000000000101";
        memory(15) <= "1010111000000000";
        memory(16) <= "1110111111100000";
        memory(17) <= "0010100110000000";
        memory(18) <= "0111000101000001";
        memory(19) <= "0001101101100010";
        memory(20) <= "1010101000000000";
        memory(21) <= "1111000101000000";
        memory(22) <= "1110101101000011";
        memory(23) <= "0000000001010011";
        memory(24) <= "0000001001000101";
        memory(25) <= "1111000101000000";
        memory(26) <= "0110000101001111";
        memory(27) <= "0111000101001111";
        memory(28) <= "0011101110000000";
        memory(29) <= "1100000000000000";
        memory(30) <= "1110101000000010";
        memory(31) <= "0000010010101011";
        memory(32) <= "0001011011011001";
        memory(33) <= "1111000101000000";
        memory(34) <= "1000000101001111";
        memory(35) <= "1001000101001111";
        memory(36) <= "0011101110000000";
        memory(37) <= "0000110110010000";
        memory(38) <= "1011111000000000";
    end process set_instructions;
    
    fetch_data : process(Read_Address)
    variable current_instruction : unsigned(15 downto 0);
    variable PC : integer;
    begin
        PC := TO_INTEGER(Read_Address);
        current_instruction := memory(PC);
        
        opcode <= current_instruction(15 downto 12);
        rs <= current_instruction(11 downto 9);
        rt <= current_instruction(8 downto 6);
        rd <= current_instruction(5 downto 3);
        
        func <= current_instruction(2 downto 0);
        immediate <= current_instruction(5 downto 0);
        instruction_jump_shift <= current_instruction(11 downto 0);
        
    end process fetch_data;
    
end Behavioral;
