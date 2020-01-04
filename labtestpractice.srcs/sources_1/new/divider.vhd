----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/27/2019 12:22:27 PM
-- Design Name: 
-- Module Name: divider - Behavioral
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           quot : out STD_LOGIC_VECTOR (15 downto 0);
           rest : out STD_LOGIC_VECTOR (15 downto 0));
end divider;

architecture Behavioral of divider is

signal aux, bux: integer range 0 to 65535;

begin
aux<=conv_integer(a);
bux<=conv_integer(b);
process (aux, bux)
variable t1, t2: integer range 0 to 65535;
variable x: std_logic_vector (15 downto 0);
begin
for i in 15 downto 0 loop
    if (t1 >= t2 * 2 ** i) then
        t1 := t1 - t2 * 2 ** i;
        x(i):='1';
        else
        x(i):='0';
    end if;
end loop;
rest <= conv_std_logic_vector(t1,16);
quot<=x;
end process;

end Behavioral;
