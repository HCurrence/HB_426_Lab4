----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2021 07:45:16 PM
-- Design Name: 
-- Module Name: Shift_Bubble - Behavioral
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

entity Shift_Bubble is
    generic(N : integer := 15;
            R : integer := 15);
    Port ( A : in unsigned (R downto 0);
           B : in unsigned (3 downto 0);
           C : out unsigned (N downto 0));
end Shift_Bubble;

architecture Behavioral of Shift_Bubble is

begin

process(A, B)
    variable shift_amount : integer;
    variable a_value : unsigned(N downto 0);
    begin
        shift_amount := TO_INTEGER(B);
        a_value := resize(A, (N+1));
    
        C <= shift_left(a_value, shift_amount);
    end process;
    
    
    
end Behavioral;
