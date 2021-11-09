library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Combine_JShift_TB is
end Combine_JShift_TB;

architecture Behavioral of Combine_JShift_TB is

-- constants
constant MAX_DELAY : time := 200 ns;
constant N : integer := 15;

-- test values
type test_values is array(0 to 2) of unsigned(N downto 0);
constant addresses : test_values := ("1111111111111111", "0000000000000000", "0000111111111111");
constant pc_4_vals : test_values := ("0000000000000000", "1010101010101010", "1111000000000000");

-- signals
signal inst_address, pc_4, jump : unsigned(N downto 0);

begin

    stimulus : process
    begin
        for i in 0 to 2 loop
            inst_address <= addresses(i);
            pc_4 <= pc_4_vals(i);
            wait for MAX_DELAY;
        end loop;
    end process stimulus;
    
    DUT : entity work.Combine_JShift_OneSmall(Behavioral)
        port map(A => inst_address, B => pc_4, C => jump);

end Behavioral;
