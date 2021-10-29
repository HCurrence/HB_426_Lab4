library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sign_Extend is
    generic(N: integer);
    Port ( immediate : in unsigned (5 downto 0);
           Sign_Extend_Result : out unsigned (N downto 0));
end Sign_Extend;

architecture Behavioral of Sign_Extend is

begin
    process(immediate)
    variable signed_immediate : signed(5 downto 0);
    variable result : signed(N downto 0);
    begin
        signed_immediate := signed(immediate);
        result := resize(signed_immediate, N);
        
        Sign_Extend_Result <= unsigned(result);
    end process;

end Behavioral;
