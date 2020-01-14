----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2020 11:26:36 AM
-- Design Name: 
-- Module Name: regFile - Behavioral
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

entity regFile is
    Port ( addressa : in STD_LOGIC_VECTOR (4 downto 0);
           addressb : in STD_LOGIC_VECTOR (4 downto 0);
           wr : in STD_LOGIC;
           clk: in std_logic;
           res: in std_logic;
           wrAddr : in STD_LOGIC_VECTOR (4 downto 0);
           wrData : in STD_LOGIC_VECTOR (31 downto 0);
           rd1 : out STD_LOGIC_VECTOR (31 downto 0);
           rd2 : out STD_LOGIC_VECTOR (31 downto 0));
end regFile;

architecture Behavioral of regFile is

type mem_type is array(0 to 31) of std_logic_vector(31 downto 0);
signal regMem: mem_type := (others => "00000000000000000000000000000000");

begin

process(clk, res)
begin
if res='1' then
    for i in 0 to 31 loop
        regMem(i)<="00000000000000000000000000000000";
    end loop;
elsif wr='1' then
    if rising_edge(clk) then
        regMem(conv_integer(wrAddr))<=wrData;
    end if;
end if;
end process;
rd1<=regMem(conv_integer(addressa));
rd2<=regMem(conv_integer(addressb));
end Behavioral;
