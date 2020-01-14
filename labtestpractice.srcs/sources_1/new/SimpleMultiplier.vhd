----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2020 03:23:43 PM
-- Design Name: 
-- Module Name: SimpleMultiplier - Behavioral
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

entity SimpleMultiplier is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           x : out STD_LOGIC_VECTOR (7 downto 0));
end SimpleMultiplier;

architecture Behavioral of SimpleMultiplier is

begin

process (a,b)
variable temp: integer:=0;
begin
    for i in 3 downto 0 loop
        temp := temp * 2;
        if b(i) = '1' then
            temp := temp + conv_integer(a);
        end if;
    end loop;
x<=conv_std_logic_vector(temp,8);
end process;


end Behavioral;
