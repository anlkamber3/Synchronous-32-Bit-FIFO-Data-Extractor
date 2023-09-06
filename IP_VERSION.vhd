----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2022 03:20:57 PM
-- Design Name: 
-- Module Name: IP_VERSION - Behavioral
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

entity IP_VERSION is
generic(IPV4_HEADER_OFFSET_BYTE : integer);
    port(
        clk : in std_logic;
        data : in std_logic_vector(31 downto 0);
        reset : in std_logic; 
        done : out std_logic; 
        data_out : out std_logic_vector(3 downto 0)
    );
end IP_VERSION;

architecture Behavioral of IP_VERSION is
signal done_signal : std_logic := '0';
signal signal_1 : std_logic_vector(3 downto 0);
begin
process(data) is 
variable counter : integer := 0;
begin 
if(reset = '0') then 
    counter := 0; 
else 
    counter := counter +32; 
end if;

for i in (counter-32) to (counter-1) loop
    if (i =((IPV4_HEADER_OFFSET_BYTE+4)*8)) then 
         signal_1(3) <= data(counter-1-i);
    elsif (i = ((IPV4_HEADER_OFFSET_BYTE+4)*8)+1) then 
         signal_1(2) <= data(counter-1-i);
    elsif (i = ((IPV4_HEADER_OFFSET_BYTE+4)*8)+2) then 
         signal_1(1) <= data(counter-1-i);
    elsif (i = ((IPV4_HEADER_OFFSET_BYTE+4)*8)+3) then 
         signal_1(0) <= data(counter-1-i);
         done_signal <= '1';
    end if;
    end loop;
end process;
data_out<= signal_1; 
done <= done_signal;   


end Behavioral;
