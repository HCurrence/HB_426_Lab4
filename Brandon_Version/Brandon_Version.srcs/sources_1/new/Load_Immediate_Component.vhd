----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2021 09:24:35 PM
-- Design Name: 
-- Module Name: Load_Immediate_Component - Behavioral
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

entity Load_Immediate_Component is
    generic(N:integer;R:integer);
    Port ( A : in unsigned (N downto 0);
           B : in unsigned (R downto 0);
           C : out unsigned (N downto 0));
end Load_Immediate_Component;

architecture Behavioral of Load_Immediate_Component is

begin


end Behavioral;
