library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Small_Adder is
    generic (N : integer := 15);
    Port ( A : in unsigned (N downto 0);
           B : in unsigned (N downto 0);
           C : out unsigned (N downto 0));
end Small_Adder;

architecture Behavioral of Small_Adder is

begin
    
    process(A, B)
    begin
        C <= A + B;
    end process;

end Behavioral;
