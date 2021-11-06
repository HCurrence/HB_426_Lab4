library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Instruction_Memory is
    Port ( clk : in std_logic;
           Read_Address : in unsigned (15 downto 0);
           Rs : out unsigned (2 downto 0);
           Rt : out unsigned (2 downto 0);
           Rd : out unsigned (2 downto 0);
           Func : out unsigned (2 downto 0);
           immediate : out unsigned(5 downto 0);
           Opcode : out unsigned (3 downto 0);
           Instruction_Jump_Shift : out unsigned(11 downto 0));
           
end Instruction_Memory;

architecture Behavioral of Instruction_Memory is
    type memory_data is array(0 to 38) of unsigned(15 downto 0);
    --total memory size: 65535
    
    signal memory : memory_data := ("1111000000000000",
                                    "1111000001000000",
                                    "1111000010000000",
                                    "1111000011000000",
                                    "1111000100000000",
                                    "1111000101000000",
                                    "1111000110000000",
                                    "1111000111000000",
                                    "1000000000000100",
                                    "0110000001000001",
                                    "1000000001000001",
                                    "1001000010001111",
                                    "1000000011001111",
                                    "1000000000000001",
                                    "1001000000000101",
                                    "1010111000000000",
                                    "1110111111100000",
                                    "0010100110000000",
                                    "0111000101000001",
                                    "0001101101100010",
                                    "1010101000000000",
                                    "1111000101000000",
                                    "1110101101000011",
                                    "0000000001010011",
                                    "0000001001000101",
                                    "1111000101000000",
                                    "0110000101001111",
                                    "0111000101001111",
                                    "0011101110000000",
                                    "1100000000000000",
                                    "1110101000000010",
                                    "0000010010101011",
                                    "0001011011011001",
                                    "1111000101000000",
                                    "1000000101001111",
                                    "1001000101001111",
                                    "0011101110000000",
                                    "0000110110010000",
                                    "1011111000000000");

begin
    
    fetch_data : process(Read_Address)
    variable current_instruction : unsigned(15 downto 0);
    variable PC : integer;
    begin
        PC := TO_INTEGER(Read_Address);
        current_instruction := memory(PC);
        
        opcode <= current_instruction(15 downto 12);
        rs <= current_instruction(11 downto 9);
        rt <= current_instruction(8 downto 6);
        rd <= current_instruction(5 downto 3);
        
        func <= current_instruction(2 downto 0);
        immediate <= current_instruction(5 downto 0);
        instruction_jump_shift <= current_instruction(11 downto 0);
        
    end process fetch_data;
    
end Behavioral;
