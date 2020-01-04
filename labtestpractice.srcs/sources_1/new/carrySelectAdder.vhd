----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/26/2019 06:43:28 PM
-- Design Name: 
-- Module Name: carrySelectAdder - Behavioral
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

entity carrySelectAdder is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           s : out STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           cout : out STD_LOGIC);
end carrySelectAdder;

architecture Behavioral of carrySelectAdder is

component fullAdder is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           cin : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;

signal a, b, c0, c1: std_logic_vector (3 downto 0);

begin

fa01: fullAdder port map (x(0),y(0),'0',a(0),c0(0));
fa02: fullAdder port map (x(1),y(1),c0(0),a(1),c0(1));
fa03: fullAdder port map (x(2),y(2),c0(1),a(2),c0(2));
fa04: fullAdder port map (x(3),y(3),c0(2),a(3),c0(3));

fa11: fullAdder port map (x(0),y(0),'1',b(0),c1(0));
fa12: fullAdder port map (x(1),y(1),c1(0),b(1),c1(1));
fa13: fullAdder port map (x(2),y(2),c1(1),b(2),c1(2));
fa14: fullAdder port map (x(3),y(3),c1(2),b(3),c1(3));

s(0) <= a(0) when cin = '0' else b(0);
s(1) <= a(1) when cin = '0' else b(1);
s(2) <= a(2) when cin = '0' else b(2);
s(3) <= a(3) when cin = '0' else b(3);
cout <= c0(3) when cin = '0' else c1(3);

end Behavioral;
