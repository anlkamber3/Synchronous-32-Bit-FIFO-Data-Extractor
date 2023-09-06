----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2022 11:21:30 AM
-- Design Name: 
-- Module Name: GLUON_MAC - Behavioral
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

entity GLUON_MAC is

port(
    clk : in std_logic;
    reset : in std_logic;
    signal_1 : in std_logic_vector(15 downto 0);
    signal_2 : in std_logic_vector(15 downto 0);
    signal_3 : in std_logic_vector(15 downto 0);
    done_1 : in std_logic; 
    done_2 : in std_logic;
    done_3 : in std_logic;
    data : out std_logic_vector(47 downto 0)


);
end GLUON_MAC;

architecture Behavioral of GLUON_MAC is
signal data_signal : std_logic_vector(47 downto 0) := (others => '0');
begin
process(signal_3) is 
begin 
if(reset = '0') then 
    data_signal <= (others => '0');
else 
data_signal(32) <= signal_1(0);
data_signal(33) <= signal_1(1);
data_signal(34) <= signal_1(2);
data_signal(35) <= signal_1(3);
data_signal(36) <= signal_1(4);
data_signal(37) <= signal_1(5);
data_signal(38) <= signal_1(6);
data_signal(39) <= signal_1(7);
data_signal(40) <= signal_1(8);
data_signal(41) <= signal_1(9);
data_signal(42) <= signal_1(10);
data_signal(43) <= signal_1(11);
data_signal(44) <= signal_1(12);
data_signal(45) <= signal_1(13);
data_signal(46) <= signal_1(14);
data_signal(47) <= signal_1(15);
data_signal(16) <= signal_2(0);
data_signal(17) <= signal_2(1);
data_signal(18) <= signal_2(2);
data_signal(19) <= signal_2(3);
data_signal(20) <= signal_2(4);
data_signal(21) <= signal_2(5);
data_signal(22) <= signal_2(6);
data_signal(23) <= signal_2(7);
data_signal(24) <= signal_2(8);
data_signal(25) <= signal_2(9);
data_signal(26) <= signal_2(10);
data_signal(27) <= signal_2(11);
data_signal(28) <= signal_2(12);
data_signal(29) <= signal_2(13);
data_signal(30) <= signal_2(14);
data_signal(31) <= signal_2(15);
data_signal(16) <= signal_2(0);
data_signal(17) <= signal_2(1);
data_signal(18) <= signal_2(2);
data_signal(19) <= signal_2(3);
data_signal(20) <= signal_2(4);
data_signal(21) <= signal_2(5);
data_signal(22) <= signal_2(6);
data_signal(23) <= signal_2(7);
data_signal(24) <= signal_2(8);
data_signal(25) <= signal_2(9);
data_signal(26) <= signal_2(10);
data_signal(27) <= signal_2(11);
data_signal(28) <= signal_2(12);
data_signal(29) <= signal_2(13);
data_signal(30) <= signal_2(14);
data_signal(31) <= signal_2(15);
data_signal(0) <= signal_3(0);
data_signal(1) <= signal_3(1);
data_signal(2) <= signal_3(2);
data_signal(3) <= signal_3(3);
data_signal(4) <= signal_3(4);
data_signal(5) <= signal_3(5);
data_signal(6) <= signal_3(6);
data_signal(7) <= signal_3(7);
data_signal(8) <= signal_3(8);
data_signal(9) <= signal_3(9);
data_signal(10) <= signal_3(10);
data_signal(11) <= signal_3(11);
data_signal(12) <= signal_3(12);
data_signal(13) <= signal_3(13);
data_signal(14) <= signal_3(14);
data_signal(15) <= signal_3(15);
end if;

end process;

data <= data_signal;

end Behavioral;
