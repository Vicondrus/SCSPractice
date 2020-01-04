----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/26/2019 06:17:51 PM
-- Design Name: 
-- Module Name: cla_tb - Behavioral
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

entity cla_tb is
--  Port ( );
end cla_tb;

architecture Behavioral of cla_tb is

component carryLookaheadAdder is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end component;

signal x, y, s: std_logic_vector(3 downto 0);
signal cin, cout: std_logic;

begin


uut: carryLookaheadAdder port map (x, y, cin, s, cout);

stim_proc: process
begin
    x <= "0111";
    y<= "1111";
    cin <= '1';
    wait for 10 ns;
    x <= "1010";
    y <= "0000";
    cin <= '0';
    wait for 10 ns;
end process;

end Behavioral;
