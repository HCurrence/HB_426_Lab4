----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Data_Memory is
    generic(N : integer := 15);
    Port ( clk : in std_logic;
           MemWrite : in std_logic;
           MemRead : in std_logic;
           ALU_Result : in unsigned (N downto 0);
           Read_Data : out unsigned (N downto 0);
           Write_Data : in unsigned (N downto 0));
end Data_Memory;

architecture Behavioral of Data_Memory is
    type memory_data is array(0 to 65535) of unsigned(N downto 0);
    
    signal memory : memory_data;
begin
    
    writeData : process(MemWrite, Write_Data, ALU_Result)
    variable address : integer;
    begin
        if(MemWrite = '1') then
            address := TO_INTEGER(ALU_RESULT);
            memory(address) <= Write_Data;
            Read_Data <= (others => '0');
        end if;
    end process writeData;
    
    fetchData : process(MemRead, ALU_Result)
    variable address : integer;
    begin
        if(MemRead = '1') then
            address := TO_INTEGER(ALU_RESULT);
            Read_Data <= memory(address);
        end if;
    end process fetchData;

end Behavioral;
