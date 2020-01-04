----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/26/2019 09:08:21 PM
-- Design Name: 
-- Module Name: wt_tb - Behavioral
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

entity wt_tb is
--  Port ( );
end wt_tb;

architecture Behavioral of wt_tb is

component wallaceTree is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           prod : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal a, b: std_logic_vector(3 downto 0);
signal prod: std_logic_vector(7 downto 0);

begin

uut: wallaceTree port map (a,b,prod);

stim_proc: process
begin
    a<="0010";
    b<="0010";
    wait for 20 ns;
    a<="0010";
    b<="1111";
    wait for 20 ns;
    a<="0011";
    b<="0101";
    wait for 20 ns;
end process;

end Behavioral;
