----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/26/2022 01:03:43 PM
-- Design Name: 
-- Module Name: UDP_DATA_PARSER - Behavioral
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
    
    
    
entity UDP_DATA_PARSER is
generic(IPV4_HEADER_OFFSET_BYTE : integer);
port(
    clk : in std_logic; 
    data : in std_logic_vector(31 downto 0); 
    reset : in std_logic; 
    data_length : in std_logic_vector(15 downto 0);
    length_check : in std_logic;
    HDRLEN : in std_logic_vector(3 downto 0); 
    HDRLEN_CHECK : in std_logic;
    data_out : out std_logic_vector(15 downto 0)
    
    ); 
end UDP_DATA_PARSER;

architecture Behavioral of UDP_DATA_PARSER is
signal UDP_DATA_SIGNAL : std_logic_vector(31 downto 0); 
signal data_signal_1 : std_logic_vector(15 downto 0);
begin
process(data) is 
variable counter : integer := 0;
variable INT_UDP_LENGTH : integer;
variable a0 : integer := 0;
variable a1 : integer := 0;
variable a2 : integer := 0;
variable a3 : integer := 0;
variable a4 : integer := 0;
variable a5 : integer := 0;
variable a6 : integer := 0;
variable a7 : integer := 0;
variable a8 : integer := 0;
variable a9 : integer := 0;
variable a10 : integer := 0;
variable a11 : integer := 0;
variable a12 : integer := 0;
variable a13 : integer := 0;
variable a14 : integer := 0;
variable a15 : integer := 0;
variable b0 : integer := 0; 
variable b1 : integer := 0; 
variable b2 : integer := 0; 
variable b3 : integer := 0;
variable UDP_DATA_RELATIVE_POSITION : integer;
variable HDR_LEN : integer := 0; 
variable CONTROL_POINT : integer; 
variable i : integer := 0;
variable check : std_logic;

begin 
if(reset = '0') then 
    counter := 0; 
else 
    counter := counter +32; 
end if;
if (HDRLEN_CHECK = '1') then 
    if(HDRLEN(0)='1') then 
        b0 := 1; 
        end if;
    if(HDRLEN(1) = '1') then 
        b1 := 1;
        end if;
    if (HDRLEN(2) = '1') then 
        b2 := 1; 
        end if;
    if (HDRLEN(3) = '1') then 
        b3 := 1;
        end if;
    HDR_LEN := 1*b0+ 2* b1 +4*b2+8*b3;    
end if;
if(length_check = '1') then 
--    if(data_length(0) = '1') then 
--        a0 := 1; 
--        end if;
--    if(data_length(1) = '1') then 
--         a1 := 1; 
--         end if;
--    if(data_length(2) = '1') then 
--         a2 := 1; 
--         end if;
--    if(data_length(3) = '1') then 
--         a3 := 1; 
--         end if;
--    if(data_length(4) = '1') then 
--         a4 := 1; 
--         end if;
--    if(data_length(5) = '1') then 
--         a5 := 1; 
--         end if;
--    if(data_length(6) = '1') then 
--         a6 := 1; 
--         end if;
--    if(data_length(7) = '1') then 
--         a7 := 1; 
--         end if;
--    if(data_length(8) = '1') then 
--         a8 := 1; 
--         end if;
--    if(data_length(9) = '1') then 
--         a9 := 1; 
--         end if;
--    if(data_length(10) = '1') then 
--         a10 := 1; 
--         end if;
--    if(data_length(11) = '1') then 
--         a11 := 1; 
--         end if;
--    if(data_length(12) = '1') then 
--         a12 := 1; 
--         end if;
--    if(data_length(13) = '1') then 
--         a13 := 1; 
--         end if;
--    if(data_length(14) = '1') then 
--         a14 := 1; 
--         end if;
--    if(data_length(15) = '1') then 
--         a15 := 1; 
--         end if;
--    INT_UDP_LENGTH := 1*a0 + 2*a1 +4*a2 +8*a3 + 16*a4 + 32*a5 + 64*a6 + 128*a7 + 256*a8 + 512*a9 + 1024*a10 + 2048*a11 + 4096*a12 + 8192*a13 + 16384*a14 +32768*a15; 
    UDP_DATA_RELATIVE_POSITION := IPV4_HEADER_OFFSET_BYTE + 4*HDR_LEN + 8; 
    
    
    CONTROL_POINT := IPV4_HEADER_OFFSET_BYTE + 4*HDR_LEN + 8 + i;
        for i in (counter-32) to (counter-1) loop
    
        if (i =((CONTROL_POINT+4)*8)) then 
             data_signal_1(15) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+1) then 
             data_signal_1(14) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+2) then 
             data_signal_1(13) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+3) then 
             data_signal_1(12) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+4) then 
             data_signal_1(11) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+5) then 
             data_signal_1(10) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+6) then 
             data_signal_1(9) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+7) then 
             data_signal_1(8) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+8) then 
             data_signal_1(7) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+9) then 
             data_signal_1(6) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+10) then 
             data_signal_1(5) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+11) then 
             data_signal_1(4) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+12) then 
             data_signal_1(3) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+13) then 
             data_signal_1(2) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+14) then 
             data_signal_1(1) <= data(counter-1-i);
        elsif (i = ((CONTROL_POINT+4)*8)+15) then 
             data_signal_1(0) <= data(counter-1-i);
             check := '1';
        end if;
    end loop;
    if (check = '1') then
        i := i+4;
        end if; 
end if;
end process;
data_out <= data_signal_1;
end Behavioral;
