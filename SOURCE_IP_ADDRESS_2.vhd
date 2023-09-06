----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2022 12:40:12 PM
-- Design Name: 
-- Module Name: SOURCE_IP_ADDRESS_2 - Behavioral
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

entity SOURCE_IP_ADDRESS_2 is
generic(
        RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS : integer
        );
    port(
        clk : in std_logic;
        data : in std_logic_vector(31 downto 0);
        reset : in std_logic; 
        done : out std_logic;
        data_out : out std_logic_vector(15 downto 0)
    );
end SOURCE_IP_ADDRESS_2;

architecture Behavioral of SOURCE_IP_ADDRESS_2 is
signal signal_2 : std_logic_vector(15 downto 0);
signal done_signal : std_logic;
begin
process(data) is 
variable counter : integer := 0;
variable RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2 : integer;
begin 

if(reset = '0') then 
    counter := 0; 
else 
    counter := counter +32; 
end if;
    RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2 := RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS +2;
for i in (counter-32) to (counter-1) loop
    if (i =((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)) then 
     signal_2(15) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+1) then 
         signal_2(14) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+2) then 
         signal_2(13) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+3) then 
         signal_2(12) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+4) then 
         signal_2(11) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+5) then 
         signal_2(10) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+6) then 
         signal_2(9) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+7) then 
         signal_2(8) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+8) then 
         signal_2(7) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+9) then 
         signal_2(6) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+10) then 
         signal_2(5) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+11) then 
         signal_2(4) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+12) then 
         signal_2(3) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+13) then 
         signal_2(2) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+14) then 
         signal_2(1) <= data(counter-1-i);
    elsif (i = ((RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS_2+4)*8)+15) then 
         signal_2(0) <= data(counter-1-i);
         done_signal <= '1';
         end if;
    end loop;
end process;
data_out <= signal_2; 
done <= done_signal;



end Behavioral;
