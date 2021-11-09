library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUX_TB is
end MUX_TB;

architecture Behavioral of MUX_TB is

-- constants
constant MAX_DELAY : time := 200 ns;
constant N : integer := 15;

-- test values
type test_values is array(0 to 1) of unsigned(N downto 0);
constant a_values : test_values := ("0000000000000000", "1111111111111111");
constant b_values : test_values := ("1111111111111111", "0000000000000000");
constant selects : std_logic_vector(1 downto 0) := "10";

-- signals
signal select_sig : std_logic;
signal in1, in2, out1 : unsigned(N downto 0);

begin

    stimulus : process
    begin
        for i in 0 to 1 loop
            select_sig <= selects(i);
            for j in 0 to 1 loop
                in1 <= a_values(i);
                in2 <= b_values(i);
                wait for MAX_DELAY;
            end loop;
        end loop;
    end process stimulus;
    
    DUT : entity work.MUX(Behavioral)
        port map(Sel => select_sig, A => in1,
                 B => in2, C => out1);

end Behavioral;
