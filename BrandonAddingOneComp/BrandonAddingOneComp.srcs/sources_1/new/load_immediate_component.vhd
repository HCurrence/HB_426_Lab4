library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity load_immediate_component is
   generic( N : integer := 15;
            R : integer := 1);
   port( A : in unsigned(N downto 0); -- sign extended immediate
         B : in unsigned(R downto 0); -- least 2 sig bits of opcode
         C : out unsigned(N downto 0)); 
            -- contains the value to replace the bits of the specified memory location
end load_immediate_component;

architecture Behavioral of load_immediate_component is
    
begin
    process (A, B)
    begin
        case (B) is
            when "00" =>
                C <= A sll 4;
            when "01" => 
                C <= A;
            when "10" =>
                C <= A sll 12;
            when "11" =>
                C <= A sll 8;
            when others => 
                C <= (others => 'Z');
        end case;
    end process;
end Behavioral;
