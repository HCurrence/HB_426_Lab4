library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Control_TB is
end Control_TB;

architecture Behavioral of Control_TB is

-- constants
constant MAX_DELAY : time := 50 ns;
constant N : integer := 16;

-- test values
type op_values is array(0 to 15) of unsigned(3 downto 0);
constant opcodes : op_values := ( "0000", "0001", "0010", "0011",
                                  "0100", "0101", "0110", "0111",
                                  "1000", "1001", "1010", "1011",
                                  "1100", "1101", "1110", "1111");
                                  
type func_values is array(0 to 7) of unsigned(2 downto 0);
constant func_codes : func_values := ("000", "001", "010", "011", 
                                      "100", "101", "110", "111");

-- signals
signal op_code : unsigned(3 downto 0);
signal func_code, alu_code : unsigned(2 downto 0);
signal reg_dest, branch_sig, mem_read, mem_to_reg : std_logic;
signal mem_write, alu_src, reg_write, jump_sig : std_logic;

begin

    stimulus : process
    begin
        for i in 0 to 15 loop
            op_code <= opcodes(i);
            for j in 0 to 7 loop
                func_code <= func_codes(j);
                wait for MAX_DELAY;
            end loop;
        end loop;
    end process stimulus;
    
    DUT : entity work.Control(Behavioral)
        port map(Opcode => op_code, Func => func_code,
                 RegDst => reg_dest, Branch => branch_sig,
                 MemRead => mem_read, MemtoReg => mem_to_reg,
                 ALUOp => alu_code, MemWrite => mem_write,
                 ALUSrc => alu_src, RegWrite => reg_write,
                 Jump => jump_sig);


end Behavioral;
