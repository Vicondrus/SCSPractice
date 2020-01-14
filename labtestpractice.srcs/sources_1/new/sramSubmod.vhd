----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2020 12:38:57 PM
-- Design Name: 
-- Module Name: dramSumod - Behavioral
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

entity sramSumod is
    Port ( addr : in STD_LOGIC_VECTOR (16 downto 0);
           data : inout STD_LOGIC_VECTOR (15 downto 0);
           bhe : in STD_LOGIC;
           sel : in STD_LOGIC;
           wr : in STD_LOGIC);
end sramSumod;

architecture Behavioral of sramSumod is

type memType is array(0 to 2 ** 16) of std_logic_vector(7 downto 0);
signal highMem, lowMem: memType:=(others=>"00000000");

signal csh, csl: std_logic;

begin

csh <= bhe and sel;
csl <= addr(0) and sel;

high: process (csh, addr, data, wr)
begin
    if csh = '1' then
        if wr = '1' then
            highMem(conv_integer(addr(16 downto 1)))<=data(15 downto 8);
        else
            data(15 downto 8)<=highMem(conv_integer(addr(16 downto 1)));
        end if;
    end if;
end process high;

low: process (csl, addr, data, wr)
begin
    if csl = '1' then
        if wr = '1' then
            highMem(conv_integer(addr(16 downto 1)))<=data(7 downto 0);
        else
            data(7 downto 0)<=highMem(conv_integer(addr(16 downto 1)));
        end if;
    end if;
end process low;

end Behavioral;
