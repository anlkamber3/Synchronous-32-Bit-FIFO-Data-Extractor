----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2022 12:43:10 PM
-- Design Name: 
-- Module Name: GLUON_SOURCE_IP - Behavioral
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

entity GLUON_SOURCE_IP is
port(
    clk : in std_logic;
    reset : in std_logic;
    signal_1 : in std_logic_vector(15 downto 0);
    signal_2 : in std_logic_vector(15 downto 0);
    done_1 : in std_logic; 
    done_2 : in std_logic;
    data : out std_logic_vector(31 downto 0)


);
end GLUON_SOURCE_IP;

architecture Behavioral of GLUON_SOURCE_IP is
signal data_signal : std_logic_vector(31 downto 0) := (others => '0');
begin
process(signal_2) is 
begin 
if(reset = '0') then 
    data_signal <= (others => '0');
else 
data_signal(16) <= signal_1(0);
data_signal(17) <= signal_1(1);
data_signal(18) <= signal_1(2);
data_signal(19) <= signal_1(3);
data_signal(20) <= signal_1(4);
data_signal(21) <= signal_1(5);
data_signal(22) <= signal_1(6);
data_signal(23) <= signal_1(7);
data_signal(24) <= signal_1(8);
data_signal(25) <= signal_1(9);
data_signal(26) <= signal_1(10);
data_signal(27) <= signal_1(11);
data_signal(28) <= signal_1(12);
data_signal(29) <= signal_1(13);
data_signal(30) <= signal_1(14);
data_signal(31) <= signal_1(15);
data_signal(0) <= signal_2(0);
data_signal(1) <= signal_2(1);
data_signal(2) <= signal_2(2);
data_signal(3) <= signal_2(3);
data_signal(4) <= signal_2(4);
data_signal(5) <= signal_2(5);
data_signal(6) <= signal_2(6);
data_signal(7) <= signal_2(7);
data_signal(8) <= signal_2(8);
data_signal(9) <= signal_2(9);
data_signal(10) <= signal_2(10);
data_signal(11) <= signal_2(11);
data_signal(12) <= signal_2(12);
data_signal(13) <= signal_2(13);
data_signal(14) <= signal_2(14);
data_signal(15) <= signal_2(15);

end if;

end process;

data <= data_signal;

end Behavioral;
