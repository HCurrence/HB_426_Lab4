----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2021 01:15:21 PM
-- Design Name: 
-- Module Name: mux_two_outputs - Behavioral
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

entity mux_two_outputs is
    generic(N : integer := 15);
    port ( Sel : in std_logic;
           A : in unsigned(N downto 0);
           C : out unsigned(N downto 0);
           D : out unsigned(N downto 0));
end mux_two_outputs;

architecture Behavioral of mux_two_outputs is

begin

    process(Sel, A)
    begin
        if (Sel = '0') then
            C <= A;
            D <= (others => 'X');
        else
            C <= (others => 'X');
            D <= A;
        end if;
    end process;

end Behavioral;
