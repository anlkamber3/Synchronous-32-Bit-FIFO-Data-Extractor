----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2022 03:40:00 PM
-- Design Name: 
-- Module Name: VERIFICATION - Behavioral
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


entity VERIFICATION is
generic (
    VALUE_OF_MAC_DESTINATION_ADDRESS : std_logic_vector(47 downto 0); 
    CHECK_OR_NOT_MAC_DESTINATION_ADDRESS : std_logic ;
    
    VALUE_OF_MAC_SOURCE_ADDRESS : std_logic_vector(47 downto 0);
    CHECK_OR_NOT_MAC_SOURCE_ADDRESS : std_logic;
    
    VALUE_OF_SOURCE_IP_ADDRESS : std_logic_vector(31 downto 0);
    CHECK_OR_NOT_SOURCE_IP_ADDRESS : std_logic;
    
    VALUE_OF_DESTINATION_IP_ADDRESS : std_logic_vector(31 downto 0);
    CHECK_OR_NOT_DESTINATION_IP_ADDRESS : std_logic;
    
    VALUE_OF_UDP_SOURCE_PORT : std_logic_vector(15 downto 0);
    CHECK_OR_NOT_UDP_SOURCE_PORT : std_logic;
      
    VALUE_OF_UDP_DESTINATION_PORT : std_logic_vector(15 downto 0);
    CHECK_OR_NOT_UDP_DESTINATION_PORT : std_logic;
    
    VALUE_OF_ETH_TYPE : std_logic_vector(15 downto 0);
    CHECK_OR_NOT_ETH_TYPE : std_logic;
    
    VALUE_OF_IP_PROTOCOL : std_logic_vector(7 downto 0);
    CHECK_OR_NOT_IP_PROTOCOL : std_logic; 
    
    VALUE_OF_IP_VERSION : std_logic_vector(3 downto 0);
    CHECK_OR_NOT_IP_VERSION : std_logic := '0' 


);
    port(
    clk : in std_logic;
    data : in std_logic_vector(31 downto 0);
    control : in std_logic;
    mac_destination_address : in std_logic_vector(47 downto 0);
    mac_source_address : in std_logic_vector(47 downto 0);
    eth_type : in std_logic_vector(15 downto 0);
    ip_version : in std_logic_vector(3 downto 0); 
    ip_protocol : in std_logic_vector(7 downto 0);
    ip_source_address : in std_logic_vector(31 downto 0);
    ip_destination_address : in std_logic_vector(31 downto 0); 
    udp_source_port : in std_logic_vector(15 downto 0); 
    udp_destination_port : in std_logic_vector(15 downto 0);
    VERIFICATION_FLAG : out std_logic
    
    
    );
end VERIFICATION;

architecture Behavioral of VERIFICATION is
signal main_verification_flag_1 : std_logic;

begin
process(clk) is 
variable i0 : integer := 0;
variable i1 : integer := 0; 
variable i2 : integer := 0; 
variable i3 : integer := 0;  
variable i4 : integer := 0; 
variable i5 : integer := 0; 
variable i6 : integer := 0; 
variable i7 : integer := 0; 
variable i8 : integer := 0; 
variable icheck : integer := 0;
begin 
if(control = '1') then
    if(CHECK_OR_NOT_MAC_DESTINATION_ADDRESS = '1') then
        if(mac_destination_address = VALUE_OF_MAC_DESTINATION_ADDRESS) then 
            i0 := i0+0; 
        else 
            i0 := i0 + 1;
        end if; 
    end if;
    if(CHECK_OR_NOT_MAC_SOURCE_ADDRESS = '1') then
        if(mac_source_address = VALUE_OF_MAC_SOURCE_ADDRESS) then 
            i1 := i1+0; 
        else 
            i1 := i1 + 1;
        end if; 
    end if;
    if(CHECK_OR_NOT_SOURCE_IP_ADDRESS  = '1') then
        if(ip_source_address = VALUE_OF_SOURCE_IP_ADDRESS) then 
            i2 := i2+0; 
        else 
            i2 := i2 + 1;
        end if; 
    end if;
    if(CHECK_OR_NOT_DESTINATION_IP_ADDRESS = '1') then
        if(ip_destination_address = VALUE_OF_DESTINATION_IP_ADDRESS) then 
            i3 := i3+0; 
        else 
            i3 := i3 + 1;
        end if; 
    end if;
    if(CHECK_OR_NOT_UDP_SOURCE_PORT = '1') then
        if(udp_source_port = VALUE_OF_UDP_SOURCE_PORT) then 
            i4 := i4+0; 
        else 
            i4 := i4 + 1;
        end if; 
    end if;
    if(CHECK_OR_NOT_UDP_DESTINATION_PORT = '1') then
        if(udp_destination_port = VALUE_OF_UDP_DESTINATION_PORT) then 
            i5 := i5+0; 
        else 
            i5 := i5 + 1;
        end if; 
    end if;
    if(CHECK_OR_NOT_ETH_TYPE = '1') then
        if(eth_type = VALUE_OF_ETH_TYPE) then 
            i6 := i6+0; 
        else 
            i6 := i6 + 1;
        end if; 
    end if;
    if(CHECK_OR_NOT_IP_PROTOCOL = '1') then
        if(ip_protocol = VALUE_OF_IP_PROTOCOL) then 
            i7 := i7+0; 
        else 
            i7 := i7 + 1;
        end if; 
    end if;
    if(CHECK_OR_NOT_IP_VERSION = '1') then
        if(ip_version = VALUE_OF_IP_VERSION) then 
            i8 := i8+0; 
        else 
            i8 := i8 + 1;
        end if; 
    end if;
    icheck := i0+i1+i2+i3+i4+i5+i6+i7+i8;
    if(icheck = 0) then 
        main_verification_flag_1 <= '1';
    else 
        main_verification_flag_1 <= '0'; 
    end if;
end if;
end process; 
VERIFICATION_FLAG <= main_verification_flag_1;

end Behavioral;
