library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Control is
    Port ( Opcode : in unsigned (3 downto 0);
           Func : in unsigned (2 downto 0);
           RegDst : out STD_LOGIC;
           Branch : out STD_LOGIC;
           MemRead : out STD_LOGIC;
           MemtoReg : out STD_LOGIC;
           ALUOp : out Unsigned(2 downto 0);
           MemWrite : out STD_LOGIC;
           ALUSrc : out STD_LOGIC;
           RegWrite : out STD_LOGIC;
           LoadImmediatesMux : out STD_LOGIC;
           ClearReg : out STD_LOGIC;
           Jump : out STD_LOGIC);
end Control;

architecture Behavioral of Control is
    
begin
    
    process(Opcode, Func)
    begin
        case (Opcode) is
            when "0000" | "0001" => -- ALU Operations, NOR, XOR, SLT
                RegDst <= '1';
                Branch <= '0';
                MemRead <= '0';
                MemToReg <= '0';
                ALUOp <= Func;
                MemWrite <= '0';
                ALUSrc <= '0';
                RegWrite <= '1';
                Jump <= '0';
            when "0010" => -- load word (lw)
                RegDst <= '0';
                Branch <= '0';
                MemRead <= '1';
                MemToReg <= '1';
                ALUOp <= "000";
                MemWrite <= '0';
                ALUSrc <= '1';
                RegWrite <= '1';
                Jump <= '0';
            when "0011" => -- store word (sw)
                RegDst <= '0';
                Branch <= '0';
                MemRead <= '0';
                MemToReg <= 'X';
                ALUOp <= "000";
                MemWrite <= '1';
                ALUSrc <= '1';
                RegWrite <= '0';
                Jump <= '0';
            when "0100" => -- load byte (lb)
                RegDst <= '0';
                Branch <= '0';
                MemRead <= '1';
                MemToReg <= '1';
                ALUOp <= "000";
                MemWrite <= '0';
                ALUSrc <= '1';
                RegWrite <= '1';
                Jump <= '0';
            when "0101" => -- store byte (sb)
                RegDst <= '0';
                Branch <= '0';
                MemRead <= '0';
                MemToReg <= 'X';
                ALUOp <= "000";
                MemWrite <= '0';
                ALUSrc <= '1';
                RegWrite <= '0';
                Jump <= '0';
            when "0110" -- load upper immediate (lui)
            | "0111"    -- load middle upper (lmu)
            | "1000"    -- load middle lower (lml)
            | "1001" => -- load lower immediate (lli)
                RegDst <= '0';
                Branch <= '0';
                MemRead <= '0';
                MemToReg <= 'X';
                ALUOp <= "101";
                MemWrite <= '1';
                ALUSrc <= '1';
                RegWrite <= '0';
                Jump <= '0';
            when "1010" -- branch when equal (beq)
            | "1011" => -- branch when not equal (bne)
                RegDst <= '0';
                Branch <= '1';
                MemRead <= 'X';
                MemToReg <= 'X';
                ALUOp <= "001";
                MemWrite <= '0';
                ALUSrc <= 'X';
                RegWrite <= '0';
                Jump <= '0';
            when "1100" -- jump (j)
            | "1101" => -- (jal)
                RegDst <= '0';
                Branch <= '0';
                MemRead <= 'X';
                MemToReg <= 'X';
                ALUOp <= "XXX";
                MemWrite <= '0';
                ALUSrc <= 'X';
                RegWrite <= '0';
                Jump <= '1';
            when "1110" => -- add immediate (addi)
                RegDst <= '0';
                Branch <= '0';
                MemRead <= '0';
                MemToReg <= '0';
                ALUOp <= "000";
                MemWrite <= '0';
                ALUSrc <= '1';
                RegWrite <= '1';
                Jump <= '0';
            when "1111" => -- clear register (cr)
                RegDst <= '0';
                Branch <= '0';
                MemRead <= 'X';
                MemToReg <= '0';
                ALUOp <= "XXX";
                MemWrite <= '0';
                ALUSrc <= 'X';
                RegWrite <= '1';
                Jump <= '0';
            when others =>
                RegDst <= 'Z';
                Branch <= 'Z';
                MemRead <= 'Z';
                MemToReg <= 'Z';
                ALUOp <= "ZZZ";
                MemWrite <= 'Z';
                ALUSrc <= 'Z';
                RegWrite <= 'Z';
                Jump <= 'Z';
        end case;
    end process;

end Behavioral;
