----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/26/2022 03:49:08 PM
-- Design Name: 
-- Module Name: GLUON - Behavioral
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

entity GLUON is
    port(
    clk : in std_logic; 
    data_1 : in std_logic_vector(15 downto 0); 
    data_2 : in std_logic_vector(15 downto 0); 
    data_output : out std_logic_vector(31 downto 0)
    );
end GLUON;

architecture Behavioral of GLUON is

signal data : std_logic_vector(31 downto 0);
signal data_hold : std_logic_vector(15 downto 0);
begin
process(data_2) is 
begin 
data(0) <= data_2(0);
data(1) <= data_2(1);
data(2) <= data_2(2);
data(3) <= data_2(3);
data(4) <= data_2(4);
data(5) <= data_2(5);
data(6) <= data_2(6);
data(7) <= data_2(7);
data(8) <= data_2(8);
data(9) <= data_2(9);
data(10) <= data_2(10);
data(11) <= data_2(11);
data(12) <= data_2(12);
data(13) <= data_2(13);
data(14) <= data_2(14);
data(15) <= data_2(15); 
data(16) <= data_hold(0);
data(17) <= data_hold(1);
data(18) <= data_hold(2);
data(19) <= data_hold(3);
data(20) <= data_hold(4);
data(21) <= data_hold(5);
data(22) <= data_hold(6);
data(23) <= data_hold(7);
data(24) <= data_hold(8);
data(25) <= data_hold(9);
data(26) <= data_hold(10);
data(27) <= data_hold(11);
data(28) <= data_hold(12);
data(29) <= data_hold(13);
data(30) <= data_hold(14);
data(31) <= data_hold(15);
end process; 
data_hold <= data_1;
data_output <= data;
end Behavioral;
