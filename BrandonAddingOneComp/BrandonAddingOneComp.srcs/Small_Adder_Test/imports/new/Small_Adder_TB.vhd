library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Small_Adder_TB is
end Small_Adder_TB;

architecture Behavioral of Small_Adder_TB is

-- constants
constant MAX_DELAY : time := 200 ns;
constant N : integer := 16;

-- test values
type test_values is array (0 to 4) of unsigned(15 downto 0);
constant a_values : test_values := ("0000000000000000", "0000000000000001", "0000000000000001",
                                    "1010101010101010", "0000000011111111");
constant b_values : test_values := ("0000000000000000", "0000000000000001", "0000000000000010",
                                    "1010101010101010", "0000000011111111");

-- signals
signal in1, in2, out1 : unsigned(15 downto 0);

begin

    stimulus : process
    begin
        for i in 0 to 4 loop
            in1 <= a_values(i);
            in2 <= b_values(i);
            wait for MAX_DELAY;
        end loop;
    end process stimulus;
    
    DUT : entity work.Small_Adder(Behavioral)
        port map(A => in1, B => in2, C => out1);


end Behavioral;
