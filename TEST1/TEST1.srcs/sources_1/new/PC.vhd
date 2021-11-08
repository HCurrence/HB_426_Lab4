library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    generic(N : integer := 15);
    port ( clk : in std_logic;
           A : in unsigned(N downto 0);
           C : out unsigned(N downto 0));
end PC;

architecture Behavioral of PC is

signal program_counter : unsigned(N downto 0) := (others => '0');

begin
    
    process(clk, A)
    begin
        if(rising_edge(clk)) then
            program_counter <= A;
        end if;
        
        C <= program_counter;
    end process;

end Behavioral;
