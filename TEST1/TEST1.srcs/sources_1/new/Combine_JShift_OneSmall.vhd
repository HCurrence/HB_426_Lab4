library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Combine_JShift_OneSmall is
    generic(N: integer := 15);
    Port ( A : in unsigned (N downto 0);  -- Instruction Jump Address
           B : in unsigned (N downto 0);  -- PC + 4
           C : out unsigned(N downto 0)); -- Jump Address
           
end Combine_JShift_OneSmall;

architecture Behavioral of Combine_JShift_OneSmall is

begin

    process(A, B)
    variable first_bits : unsigned(3 downto 0);
    variable last_bits : unsigned(11 downto 0);
    begin
        first_bits := B(15 downto 12);
        last_bits := A(11 downto 0);
    
        C <= first_bits & last_bits;
    end process;

end Behavioral;
