----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2021 09:19:47 PM
-- Design Name: 
-- Module Name: Data_Memory_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Data_Memory_TB is
end Data_Memory_TB;

architecture Behavioral of Data_Memory_TB is

-- constants
constant MAX_DELAY : time := 200 ns;
constant N : integer := 3;

-- test values
type test_enables is array(0 to N) of std_logic;
constant mem_reads : test_enables := ('0', '0', '1', '1');
constant mem_writes : test_enables := ('1', '1', '0', '0');

type test_data is array(0 to N) of unsigned(15 downto 0);
constant write_data : test_data := (TO_UNSIGNED(64, 16),TO_UNSIGNED(32, 16), TO_UNSIGNED(16, 16), TO_UNSIGNED(8, 16)); 
constant addresses : test_data := (TO_UNSIGNED(8, 16),TO_UNSIGNED(16, 16), TO_UNSIGNED(32, 16), TO_UNSIGNED(64, 16));

-- signals
signal read, write : std_logic;
signal address, dataIn, dataOut : unsigned(15 downto 0);

begin

    stimulus : process
    begin
        for i in 0 to N loop
            read <= mem_reads(i);
            write <= mem_writes(i);
            address <= addresses(i);
            dataIn <= write_data(i);
            wait for MAX_DELAY;
        end loop;
    end process stimulus;
    
    DUT : entity work.Data_Memory(Behavioral)
        port map(MemWrite => write, MemRead => read, 
                ALU_Result => address, Read_Data => dataOut,
                Write_Data => dataIn);

end Behavioral;
