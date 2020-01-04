----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/26/2019 06:09:06 PM
-- Design Name: 
-- Module Name: carryLookaheadAdder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity carryLookaheadAdder is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end carryLookaheadAdder;

architecture Behavioral of carryLookaheadAdder is

signal g, p: std_logic_vector (3 downto 0);
signal c: std_logic_vector (4 downto 0);

begin

process (x,y,cin,g,p,c)
begin
    c(0)<=cin;
    for i in 0 to 3 loop
        g(i)<=x(i) and y(i);
        p(i)<=x(i) or y(i);
        c(i+1)<=g(i) or (c(i) and p(i));
        s(i)<=x(i) xor y(i) xor c(i);
    end loop;
    cout <= c(4);
end process;

end Behavioral;
