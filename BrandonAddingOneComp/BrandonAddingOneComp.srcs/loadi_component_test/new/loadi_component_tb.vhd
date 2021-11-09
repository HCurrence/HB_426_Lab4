library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity loadi_component_tb is
end loadi_component_tb;

architecture Behavioral of loadi_component_tb is

--constants
constant MAX_DELAY : time := 200 ns;

--test values
type test_codes is array(0 to 3) of unsigned(1 downto 0);
constant op_tests : test_codes := ("00", "01", "10", "11");

--signals
signal sign_ext_imm : unsigned(15 downto 0);
signal last_bits_opcode : unsigned(1 downto 0);
signal out1 : unsigned(15 downto 0);

begin

    sign_ext_imm <= "0000000000001111";

    stimulus : process
    begin
        for i in 0 to 3 loop
            last_bits_opcode <= op_tests(i);
            wait for MAX_DELAY;
        end loop;
    end process stimulus;
    
    DUT : entity work.load_immediate_component(Behavioral)
        port map( A => sign_ext_imm,
                  B => last_bits_opcode,
                  C => out1);
end Behavioral;
