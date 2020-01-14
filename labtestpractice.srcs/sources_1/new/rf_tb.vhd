----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2020 12:01:30 PM
-- Design Name: 
-- Module Name: rf_tb - Behavioral
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

entity rf_tb is
--  Port ( );
end rf_tb;

architecture Behavioral of rf_tb is

component regFile is
    Port ( addressa : in STD_LOGIC_VECTOR (4 downto 0);
           addressb : in STD_LOGIC_VECTOR (4 downto 0);
           wr : in STD_LOGIC;
           clk: in std_logic;
           res: in std_logic;
           wrAddr : in STD_LOGIC_VECTOR (4 downto 0);
           wrData : in STD_LOGIC_VECTOR (31 downto 0);
           rd1 : out STD_LOGIC_VECTOR (31 downto 0);
           rd2 : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal clk, res, wr: std_logic := '0';
signal addressa, addressb, wrAddr: std_logic_vector(4 downto 0);
signal wrData, rd1, rd2: std_logic_vector(31 downto 0);

begin

uut: regFile port map (addressa,addressb,wr,clk,res,wrAddr,wrData,rd1,rd2);

clk_proc: process
begin
    clk<= not clk after 10 ns;
end process;

stim_proc: process
begin
    wrData <= "11111111111111111111111111111111";
    wrAddr <= "00000";
    wr <= '1';
    wait for 20 ns;
    wrData <= "00000000000000000000000000000001";
    wrAddr <= "00001";
    wr <= '1';
    wait for 20 ns;
    wrData <= "11111111111111111111111111111111";
    wrAddr <= "00010";
    wr <= '1';
    wait for 20 ns;
    wr<='0';
    addressa<="00000";
    addressb<="00001";
    wait for 20 ns;
end process;

end Behavioral;
