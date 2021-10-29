library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Combine_JShift_OneSmall is
    generic(N: integer);
    Port ( A : in unsigned (N downto 0);
           B : in unsigned (N downto 0);
           C : out unsigned(N downto 0));
           
end Combine_JShift_OneSmall;

architecture Behavioral of Combine_JShift_OneSmall is

begin

    process(A, B)
    variable shift_amount : integer;
    begin
        shift_amount := TO_INTEGER(B);
    
        C <= shift_left(A, shift_amount);
    end process;

end Behavioral;
