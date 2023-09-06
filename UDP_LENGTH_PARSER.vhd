----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/26/2022 12:05:16 PM
-- Design Name: 
-- Module Name: UDP_LENGTH_PARSER - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;




entity UDP_LENGTH_PARSER is
    generic(IPV4_HEADER_OFFSET_BYTE : integer);
    port(
    
    clk : in std_logic;
    data : in std_logic_vector(31 downto 0);
    reset : in std_logic; 
    done : out std_logic;
    HDRLEN : in std_logic_vector(3 downto 0);
    HDRLEN_CHECK : in std_logic; 
    LENGTH : out std_logic_vector(15 downto 0)
    );
end UDP_LENGTH_PARSER;

architecture Behavioral of UDP_LENGTH_PARSER is
signal UDP_LENGTH : std_logic_vector(15 downto 0):=(others => '0');
signal done_signal : std_logic := '0';
begin
process (data) is 
variable counter : integer := 0;
variable INT_HDR_LEN : integer;
variable a0 : integer := 0; 
variable a1 : integer := 0; 
variable a2 : integer := 0; 
variable a3 : integer := 0;
variable UDP_LENGTH_RELATIVE_POSITION : integer;
begin 
if(reset = '0') then 
    counter := 0; 
else 
    counter := counter +32; 
end if; 
if(HDRLEN_CHECK = '1') then 
    if(HDRLEN(0)='1') then 
        a0 := 1; 
        end if;
    if(HDRLEN(1) = '1') then 
        a1 := 1;
        end if;
    if (HDRLEN(2) = '1') then 
        a2 := 1; 
        end if;
    if (HDRLEN(3) = '1') then 
        a3 := 1;
        end if;
    INT_HDR_LEN := a0 *1 + a1 * 2 + a2*4 + a3 *8;    
    UDP_LENGTH_RELATIVE_POSITION := IPV4_HEADER_OFFSET_BYTE+ 4*INT_HDR_LEN + 4; 
    
    for i in (counter-32) to (counter-1) loop
        if (i =((UDP_LENGTH_RELATIVE_POSITION+4)*8)) then 
             UDP_LENGTH(15) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+1) then 
             UDP_LENGTH(14) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+2) then 
             UDP_LENGTH(13) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+3) then 
             UDP_LENGTH(12) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+4) then 
             UDP_LENGTH(11) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+5) then 
             UDP_LENGTH(10) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+6) then 
             UDP_LENGTH(9) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+7) then 
             UDP_LENGTH(8) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+8) then 
             UDP_LENGTH(7) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+9) then 
             UDP_LENGTH(6) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+10) then 
             UDP_LENGTH(5) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+11) then 
             UDP_LENGTH(4) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+12) then 
             UDP_LENGTH(3) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+13) then 
             UDP_LENGTH(2) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+14) then 
             UDP_LENGTH(1) <= data(counter-1-i);
        elsif (i = ((UDP_LENGTH_RELATIVE_POSITION+4)*8)+15) then 
             UDP_LENGTH(0) <= data(counter-1-i);
             done_signal <= '1';
    end if;
    
    
    end loop;
    
    
    end if;


end process; 
LENGTH <= UDP_LENGTH;
done <= done_signal;
end Behavioral;
