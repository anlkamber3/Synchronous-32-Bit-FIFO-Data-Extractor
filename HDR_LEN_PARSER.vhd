----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/26/2022 11:43:45 AM
-- Design Name: 
-- Module Name: HDR_LEN_PARSER - Behavioral
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

entity HDR_LEN_PARSER is
    generic(IPV4_HEADER_OFFSET_BYTE : integer);
    port(
        clk : in std_logic;
        data : in std_logic_vector(31 downto 0);
        reset : in std_logic; 
        done : out std_logic; 
        HDRLEN : out std_logic_vector(3 downto 0)
    );
end HDR_LEN_PARSER;

architecture Behavioral of HDR_LEN_PARSER is
signal done_signal : std_logic := '0';
signal HDRLEN_SIGNAL : std_logic_vector(3 downto 0);
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
    if (i =((IPV4_HEADER_OFFSET_BYTE+4)*8)+4) then 
         HDRLEN_SIGNAL(3) <= data(counter-1-i);
    elsif (i = ((IPV4_HEADER_OFFSET_BYTE+4)*8)+5) then 
         HDRLEN_SIGNAL(2) <= data(counter-1-i);
    elsif (i = ((IPV4_HEADER_OFFSET_BYTE+4)*8)+6) then 
         HDRLEN_SIGNAL(1) <= data(counter-1-i);
    elsif (i = ((IPV4_HEADER_OFFSET_BYTE+4)*8)+7) then 
         HDRLEN_SIGNAL(0) <= data(counter-1-i);
         done_signal <= '1';
    end if;
    end loop;
end process;
HDRLEN <= HDRLEN_SIGNAL; 
done <= done_signal;   
end Behavioral;
