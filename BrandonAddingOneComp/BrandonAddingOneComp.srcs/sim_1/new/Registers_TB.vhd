library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Registers_TB is
end Registers_TB;

architecture Behavioral of Registers_TB is

-- constants
constant MAX_DELAY : time := 200 ns;
constant N : integer := 3;

-- test values
type write_bits is array(0 to N) of std_logic;
constant write_signals : write_bits := ('0', '0', '1', '1');

type reg_values is array(0 to N) of unsigned(2 downto 0);
constant rs_regs : reg_values := ("000", "001", "000", "001");
constant rt_regs : reg_values := ("100", "101", "100", "101");
constant rd_regs : reg_values := ("000", "001", "000", "001");

type write_value is array (0 to N) of unsigned(15 downto 0);
constant write_values : write_value := ("0000000000000001",
                                        "1111000011110000",
                                        "1010101010101010",
                                        "1100110011001100");


-- signals
signal clk_sig : std_logic := '0';
signal write_sig : std_logic;
signal rd_sig, rt_sig, rs_sig : unsigned(2 downto 0);
signal write_data, rs_value, rt_value: unsigned(15 downto 0);

begin

    clk_ctrl : process(clk_sig)
    begin
        clk_sig <= not clk_sig after 100 ns;
    end process clk_ctrl;

    stimulus : process
    begin
        for i in 0 to N loop
            write_sig <= write_signals(i);
            
            rd_sig <= rd_regs(i);
            rt_sig <= rt_regs(i);
            rs_sig <= rd_regs(i);
            
            write_data <= write_values(i);
        end loop;
    end process stimulus;
    
    DUT : entity work.Registers(behavior)
        port map(clk => clk_sig, RegWr => write_sig,
                 Rd => rd_sig, Rs => rs_sig, Rt => rt_sig,
                 busW => write_data, BusA => rs_value, BusB => rt_value);

end Behavioral;
