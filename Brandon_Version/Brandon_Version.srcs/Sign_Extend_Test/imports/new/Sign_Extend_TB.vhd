library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sign_Extend_TB is
end Sign_Extend_TB;

architecture Behavioral of Sign_Extend_TB is

-- constants
constant MAX_DELAY : time := 200 ns;
constant N : integer := 15;

-- test values
type test_values is array(0 to 3) of unsigned(5 downto 0);
constant imm_values : test_values := ("000000", "100000", "111111", "011111");

-- signals
signal imm : unsigned(5 downto 0);
signal result : unsigned(N downto 0);

begin

    stimulus : process
    begin
        for i in 0 to 3 loop
            imm <= imm_values(i);
            wait for MAX_DELAY;
        end loop;
    end process stimulus;
    
    DUT : entity work.Sign_Extend(Behavioral)
        port map(immediate => imm, Sign_Extend_Result => result);


end Behavioral;
