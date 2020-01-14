----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2020 01:08:05 PM
-- Design Name: 
-- Module Name: dramSubmod - Behavioral
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

entity dramSubmod is
    Port ( addr : in STD_LOGIC_VECTOR (9 downto 0);
           ras : in STD_LOGIC;
           cas : in STD_LOGIC;
           wr : in STD_LOGIC;
           bhe : in STD_LOGIC;
           a0: in std_logic;
           data : inout STD_LOGIC_VECTOR (15 downto 0));
end dramSubmod;

architecture Behavioral of dramSubmod is

type memType is array(0 to 2 ** 16) of std_logic_vector(7 downto 0);
signal hmem, lmem: memType;

signal csh,csl: std_logic;

begin

csh <= bhe and cas;
csl <= a0 and cas;

high: process (addr,ras,cas,wr,data,csh)
variable row: std_logic_vector (9 downto 0);
begin
    if ras'event and ras = '1' then
    row:=addr;
    end if;
    if cas'event and cas='1' then
        if csh = '1' then
            if wr = '1' then
                hmem(conv_integer(row)*256 + conv_integer(addr))<=data(15 downto 8);
            else
                data(15 downto 8)<=hmem(conv_integer(row)*256 + conv_integer(addr));
            end if;
        end if;
    end if;
end process high;

low: process (addr,ras,cas,wr,data,csl)
variable row: std_logic_vector (9 downto 0);
begin
    if ras'event and ras = '1' then
    row:=addr;
    end if;
    if cas'event and cas='1' then
        if csl = '1' then
            if wr = '1' then
                hmem(conv_integer(row)*256 + conv_integer(addr))<=data(7 downto 0);
            else
                data(7 downto 0)<=hmem(conv_integer(row)*256 + conv_integer(addr));
            end if;
        end if;
    end if;
end process low;

end Behavioral;
