library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Registers is
    generic(N : integer := 15;
            R : integer := 2);
    port(   
    --Inputs
    clk : std_logic;
    RegWr: in std_logic;
    Rd   : in unsigned(R downto 0);
    Rs   : in unsigned(R downto 0);
    Rt   : in unsigned(R downto 0);
    busW : in unsigned(N downto 0);
    --Outputs
    BusA : out unsigned(N downto 0);
    BusB: out unsigned(N downto 0));
end entity;

architecture behavior of Registers is
    type Reg is array (0 to 8) of unsigned(0 to N);
    signal Registers: Reg := (others =>(others => 'U'));

begin
    Write_Read : process (clk)
    variable source_reg, t_reg, dest_reg : integer;
    begin
        source_reg := to_integer(Rs);
        t_reg := to_integer(Rt);
        dest_reg := to_integer(Rd);
    
        IF(rising_edge(clk)) THEN
            BusA <= Registers(source_reg);
            BusB <= Registers(t_reg);   
        END if; 
        IF(falling_edge(clk)) THEN
            IF(RegWr = '1') THEN
                Registers(dest_reg) <= busW;
            END if;
        END if;
    end process Write_Read;
end behavior;
