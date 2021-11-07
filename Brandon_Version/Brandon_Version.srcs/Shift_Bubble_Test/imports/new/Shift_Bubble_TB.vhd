library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Shift_Bubble_TB is
end Shift_Bubble_TB;

architecture Behavioral of Shift_Bubble_TB is

-- constants
constant MAX_DELAY : time := 200 ns;
constant N : integer := 15;

-- test values
type test_values is array(0 to 3) of unsigned(N downto 0);
constant inputs : test_values := ("0000000000000001", "0000000000000000",
                                  "1111000000000000", "1111111111111111");

-- signals
signal in1, out1 : unsigned(N downto 0);
signal shift_amount : unsigned(3 downto 0);

begin

    stimulus : process
    begin
        for i in 0 to 3 loop
            in1 <= inputs(i);
            for j in 0 to 3 loop
                shift_amount <= TO_UNSIGNED(j, 4);
                wait for MAX_DELAY;
            end loop;
        end loop;
    end process stimulus;
    
    DUT : entity work.Shift_Bubble(Behavioral)
        port map(A => in1, B => shift_amount, C => out1);


end Behavioral;
