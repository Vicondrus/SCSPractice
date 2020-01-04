----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/26/2019 07:46:23 PM
-- Design Name: 
-- Module Name: wallaceTree - Behavioral
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

entity wallaceTree is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           prod : out STD_LOGIC_VECTOR (7 downto 0));
end wallaceTree;

architecture Behavioral of wallaceTree is

component halfAdder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;

component fullAdder is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           cin : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;

signal p0, p1, p2, p3: std_logic_vector(6 downto 0);
signal s1, s2, c1, c2, s3, c3: std_logic_vector (4 downto 0);

begin

process (a, b)
begin
    for i in 0 to 3 loop
        p0(i)<=a(i) and b(0);
        p1(i)<=a(i) and b(1);
        p2(i)<=a(i) and b(2);
        p3(i)<=a(i) and b(3);
    end loop;
end process;

prod(0)<=p0(0);
prod(1)<=s1(0);
prod(2)<=s2(0);
prod(3)<=s3(0);
prod(4)<=s3(1);
prod(5)<=s3(2);
prod(6)<=s3(3);
prod(7)<=s3(4);

--first stage
ha11: halfAdder port map (p0(1),p1(0),s1(0),c1(0));
fa12: fullAdder port map (p0(2),p1(1),p2(0),s1(1),c1(1));
fa13: fullAdder port map (p0(3),p1(2),p2(1),s1(2),c1(2));
fa14: fullAdder port map (p1(3),p2(2),p3(1),s1(3),c1(3));
ha15: halfAdder port map (p2(3),p3(2),s1(4),c1(4));

--second stage
ha21: halfAdder port map (s1(1),c1(0),s2(0),c2(0));
fa22: fullAdder port map (p3(0),c1(1),s1(2),s2(1),c2(1));
fa23: fullAdder port map (c1(2),c3(0),s1(3),s2(2),c2(2));
fa24: fullAdder port map (c1(3),c2(2),s1(4),s2(3),c2(3));
fa25: fullAdder port map (c1(4),c2(3),p3(3),s2(4),c2(4));

--third stage
ha31: halfAdder port map (c2(0),s2(1),s3(0),c3(0));
ha32: halfAdder port map (c2(1),s2(2),s3(1),c3(1));
ha33: halfAdder port map (c3(2),s2(3),s3(2),c3(2));
ha34: halfAdder port map (c3(3),s2(4),s3(3),c3(3));
ha35: halfAdder port map (c3(4),c2(4),s3(4),c3(4));

end Behavioral;
