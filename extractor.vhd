----------------------------------------------------------------------------------
-- Company: Finrix
-- Engineer: 
-- 
-- Create Date: 09/26/2022 11:54:12 AM
-- Design Name: 
-- Module Name: parser - Behavioral
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
use IEEE.math_real.all;
use IEEE.math_complex.all;



entity parser is
    generic(
            IPV4_HEADER_OFFSET_BYTE : integer := 14;
            --DESTINATION MAC ADDRESS
            RELATIVE_POSITION_OF_DESTINATION_MAC_ADDRESS : integer := 0;
            VALUE_OF_MAC_DESTINATION_ADDRESS : std_logic_vector(47 downto 0) := x"ff"&x"ff"&x"ff"&x"ff"&x"ff"&x"00";
            CHECK_OR_NOT_MAC_DESTINATION_ADDRESS : std_logic := '0'; 
            
            --SOURCE MAC ADDRESS 
            RELATIVE_POSITION_OF_SOURCE_MAC_ADDRESS : integer := 6;
            VALUE_OF_MAC_SOURCE_ADDRESS : std_logic_vector(47 downto 0) := x"3c"&x"f0"&x"11"&x"d1"&x"a5"&x"38";
            CHECK_OR_NOT_MAC_SOURCE_ADDRESS : std_logic := '1';
            
            --SOURCE IP ADDRESS 
            RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS : integer := 26;
            VALUE_OF_SOURCE_IP_ADDRESS : std_logic_vector(31 downto 0) := x"c0"&x"a8"&x"01"&x"64";
            CHECK_OR_NOT_SOURCE_IP_ADDRESS : std_logic := '1';
            
            
            -- DESTINATION IP ADDRESS 
            
            RELATIVE_POSITION_OF_DESTINATION_IP_ADDRESS : integer := 30;
            VALUE_OF_DESTINATION_IP_ADDRESS : std_logic_vector(31 downto 0) := x"c0"&x"a8"&x"01"&x"ff";
            CHECK_OR_NOT_DESTINATION_IP_ADDRESS : std_logic := '1';
            
            -- UDP SOURCE PORT 
            RELATIVE_POSITION_OF_UDP_SOURCE_PORT : integer := 34;
            VALUE_OF_UDP_SOURCE_PORT : std_logic_vector(15 downto 0) := x"e1"&x"15";
            CHECK_OR_NOT_UDP_SOURCE_PORT : std_logic := '1'; 
            
            -- UDP DESTINATION PORT 
            RELATIVE_POSITION_OF_UDP_DESTINATION_PORT : integer := 36;
            VALUE_OF_UDP_DESTINATION_PORT : std_logic_vector(15 downto 0) := x"e1"&x"15";
            CHECK_OR_NOT_UDP_DESTINATION_PORT : std_logic := '1';
            
            --ETH TYPE 
            RELATIVE_POSITION_OF_ETH_TYPE : integer := 12;
            VALUE_OF_ETH_TYPE : std_logic_vector(15 downto 0) := x"08"&x"00";
            CHECK_OR_NOT_ETH_TYPE : std_logic := '1';
            
            --IP PROTOCOL 
            RELATIVE_POSITION_OF_IP_PROTOCOL : integer := 23;
            VALUE_OF_IP_PROTOCOL : std_logic_vector(7 downto 0) := x"11";
            CHECK_OR_NOT_IP_PROTOCOL : std_logic := '1'; 
            --IP VERSION
            
            VALUE_OF_IP_VERSION : std_logic_vector(3 downto 0) := x"4";
            CHECK_OR_NOT_IP_VERSION : std_logic := '1' 
    );
    port(
    clk : in std_logic;
    parser_ready: in std_logic;
    main_reset : in std_logic;
    data : out std_logic_vector(31 downto 0);
    check_flag : out std_logic
    );
end parser;

architecture Behavioral of parser is
-- For hex_format
signal main_data : std_logic_vector(31 downto 0); 
signal master_last : std_logic; 
signal master_valid : std_logic;

signal done_hdr_len : std_logic; 
signal done_udp_length : std_logic;

signal data_from_parser : std_logic_vector(15 downto 0);
signal data_from_parser_2 : std_logic_vector(15 downto 0);

signal HDR_LEN : std_logic_vector(3 downto 0);
signal UDP_LENGTH : std_logic_vector (15 downto 0); --32 

signal done_mac_d_1 : std_logic; 
signal done_mac_d_2 : std_logic;
signal done_mac_d_3 : std_logic;

signal destination_mac_1 : std_logic_vector(15 downto 0); 
signal destination_mac_2 : std_logic_vector(15 downto 0); 
signal destination_mac_3 : std_logic_vector(15 downto 0);

signal destination_mac_address : std_logic_vector(47 downto 0);

signal done_mac_s_1 : std_logic; 
signal done_mac_s_2 : std_logic;
signal done_mac_s_3 : std_logic; 

signal source_mac_1 : std_logic_vector(15 downto 0); 
signal source_mac_2 : std_logic_vector(15 downto 0); 
signal source_mac_3 : std_logic_vector(15 downto 0);

signal source_mac_address : std_logic_vector(47 downto 0); 
signal done_IP_s_1 : std_logic; 
signal done_IP_s_2 : std_logic;

signal source_IP_1 : std_logic_vector(15 downto 0); 
signal source_IP_2 : std_logic_vector(15 downto 0); 

signal source_IP_address : std_logic_vector(31 downto 0);

signal done_IP_d_1 : std_logic; 
signal done_IP_d_2 : std_logic; 

signal destination_IP_1 : std_logic_vector(15 downto 0); 
signal destination_IP_2 : std_logic_vector(15 downto 0); 

signal destination_IP_address : std_logic_vector(31 downto 0); 

signal done_UDP_SOURCE_PORT : std_logic;
signal udp_source_port : std_logic_vector(15 downto 0);

signal done_UDP_DESTINATION_PORT : std_logic;
signal udp_destination_port : std_logic_vector(15 downto 0);

signal done_ETH_TYPE : std_logic;
signal eth_type : std_logic_vector(15 downto 0); 

signal done_IP_version : std_logic;
signal ip_version : std_logic_vector(3 downto 0);

signal done_IP_protocol : std_logic ; 
signal ip_protocol : std_logic_vector(7 downto 0); 


signal reset : std_logic := '1';
begin


reset <= main_reset and (not master_last);
C1 : entity work.hex_format port map(clk,main_data,master_last,parser_ready,master_valid);
C2 : entity work.HDR_LEN_PARSER generic map( IPV4_HEADER_OFFSET_BYTE => IPV4_HEADER_OFFSET_BYTE) port map(clk,main_data,reset,done_hdr_len,HDR_LEN);
C3 : entity work.UDP_LENGTH_PARSER generic map(IPV4_HEADER_OFFSET_BYTE => IPV4_HEADER_OFFSET_BYTE) port map(clk,main_data,reset,done_udp_length,HDR_LEN,done_hdr_len,UDP_LENGTH);
C4 : entity work.UDP_DATA_PARSER generic map(IPV4_HEADER_OFFSET_BYTE =>IPV4_HEADER_OFFSET_BYTE ) port map(clk,main_data,reset,UDP_LENGTH,done_udp_length,HDR_LEN,done_hdr_len,data_from_parser);
C5 : entity work.UDP_DATA_PARSER_2 generic map(IPV4_HEADER_OFFSET_BYTE =>IPV4_HEADER_OFFSET_BYTE) port map(clk,main_data,reset,UDP_LENGTH,done_udp_length,HDR_LEN,done_hdr_len,data_from_parser_2); 
C6 : entity work.GLUON port map(clk,data_from_parser,data_from_parser_2,data);
C7 : entity work.DESTINATION_MAC_ADDRESS_1 generic map(RELATIVE_POSITION_OF_DESTINATION_MAC_ADDRESS => RELATIVE_POSITION_OF_DESTINATION_MAC_ADDRESS) port map(clk,main_data,reset,done_mac_d_1,destination_mac_1); 
C8 : entity work.DESTINATION_MAC_ADDRESS_2 generic map(RELATIVE_POSITION_OF_DESTINATION_MAC_ADDRESS => RELATIVE_POSITION_OF_DESTINATION_MAC_ADDRESS) port map(clk,main_data,reset,done_mac_d_2,destination_mac_2);
C9 : entity work.DESTINATION_MAC_ADDRESS_3 generic map(RELATIVE_POSITION_OF_DESTINATION_MAC_ADDRESS => RELATIVE_POSITION_OF_DESTINATION_MAC_ADDRESS) port map(clk,main_data,reset,done_mac_d_3,destination_mac_3); 
C10 : entity work.GLUON_MAC  port map(clk,reset,destination_mac_1,destination_mac_2,destination_mac_3,done_mac_d_1,done_mac_d_2,done_mac_d_3,destination_mac_address); 
C11 : entity work.SOURCE_MAC_ADDRESS_1 generic map(RELATIVE_POSITION_OF_SOURCE_MAC_ADDRESS => RELATIVE_POSITION_OF_SOURCE_MAC_ADDRESS) port map(clk,main_data,reset,done_mac_s_1,source_mac_1); 
C12 : entity work.SOURCE_MAC_ADDRESS_2 generic map(RELATIVE_POSITION_OF_SOURCE_MAC_ADDRESS => RELATIVE_POSITION_OF_SOURCE_MAC_ADDRESS) port map(clk,main_data,reset,done_mac_s_2,source_mac_2);  
C13 : entity work.SOURCE_MAC_ADDRESS_3 generic map(RELATIVE_POSITION_OF_SOURCE_MAC_ADDRESS => RELATIVE_POSITION_OF_SOURCE_MAC_ADDRESS) port map(clk,main_data,reset,done_mac_s_3,source_mac_3); 
C14 : entity work.GLUON_MAC_SOURCE port map(clk,reset,source_mac_1,source_mac_2,source_mac_3,done_mac_s_1,done_mac_s_2,done_mac_s_3,source_mac_address);
C15 : entity work.SOURCE_IP_ADDRESS_1 generic map(RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS => RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS) port map(clk,main_data,reset,done_IP_s_1,source_IP_1); 
C16 : entity work.SOURCE_IP_ADDRESS_2 generic map(RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS => RELATIVE_POSITION_OF_SOURCE_IP_ADDRESS) port map(clk,main_data,reset,done_IP_s_2,source_IP_2); 
C17 : entity work.GLUON_SOURCE_IP port map(clk,reset,source_IP_1,source_IP_2,done_IP_s_1,done_IP_s_2,source_IP_address); 
C18 : entity work.DESTINATION_IP_ADDRESS_1 generic map(RELATIVE_POSITION_OF_DESTINATION_IP_ADDRESS => RELATIVE_POSITION_OF_DESTINATION_IP_ADDRESS) port map(clk,main_data,reset,done_IP_d_1,destination_IP_1); 
C19 : entity work.DESTINATION_IP_ADDRESS_2 generic map(RELATIVE_POSITION_OF_DESTINATION_IP_ADDRESS => RELATIVE_POSITION_OF_DESTINATION_IP_ADDRESS) port map(clk,main_data,reset,done_IP_d_2,destination_IP_2); 
C20 : entity work.GLUON_DESTINATION_IP port map(clk,reset,destination_IP_1,destination_IP_2,done_IP_d_1,done_IP_d_2,destination_IP_address);
C21 : entity work.UDP_SOURCE_PORT generic map(RELATIVE_POSITION_OF_UDP_SOURCE_PORT => RELATIVE_POSITION_OF_UDP_SOURCE_PORT )port map(clk,main_data,reset,done_UDP_SOURCE_PORT,udp_source_port);
C22 : entity work.UDP_DESTINATION_PORT generic map(RELATIVE_POSITION_OF_UDP_DESTINATION_PORT => RELATIVE_POSITION_OF_UDP_DESTINATION_PORT) port map(clk,main_data,reset,done_UDP_DESTINATION_PORT,udp_destination_port);
C23 : entity work.ETH_TYPE generic map(RELATIVE_POSITION_OF_ETH_TYPE => RELATIVE_POSITION_OF_ETH_TYPE) port map(clk,main_data,reset,done_ETH_TYPE,eth_type);
C24 : entity work.IP_VERSION generic map(IPV4_HEADER_OFFSET_BYTE => IPV4_HEADER_OFFSET_BYTE) port map(clk,main_data,reset,done_IP_version,ip_version);
C25 : entity work.IP_PROTOCOL generic map(RELATIVE_POSITION_OF_IP_PROTOCOL => RELATIVE_POSITION_OF_IP_PROTOCOL) port map(clk,main_data,reset,done_IP_protocol,ip_protocol);
C26 : entity work.VERIFICATION generic map(VALUE_OF_MAC_DESTINATION_ADDRESS => VALUE_OF_MAC_DESTINATION_ADDRESS,CHECK_OR_NOT_MAC_DESTINATION_ADDRESS => CHECK_OR_NOT_MAC_DESTINATION_ADDRESS,VALUE_OF_MAC_SOURCE_ADDRESS => VALUE_OF_MAC_SOURCE_ADDRESS,CHECK_OR_NOT_MAC_SOURCE_ADDRESS => CHECK_OR_NOT_MAC_SOURCE_ADDRESS,VALUE_OF_SOURCE_IP_ADDRESS => VALUE_OF_SOURCE_IP_ADDRESS,CHECK_OR_NOT_SOURCE_IP_ADDRESS => CHECK_OR_NOT_SOURCE_IP_ADDRESS,VALUE_OF_DESTINATION_IP_ADDRESS => VALUE_OF_DESTINATION_IP_ADDRESS,CHECK_OR_NOT_DESTINATION_IP_ADDRESS => CHECK_OR_NOT_DESTINATION_IP_ADDRESS,VALUE_OF_UDP_SOURCE_PORT => VALUE_OF_UDP_SOURCE_PORT,CHECK_OR_NOT_UDP_SOURCE_PORT => CHECK_OR_NOT_UDP_SOURCE_PORT,VALUE_OF_UDP_DESTINATION_PORT => VALUE_OF_UDP_DESTINATION_PORT,CHECK_OR_NOT_UDP_DESTINATION_PORT => CHECK_OR_NOT_UDP_DESTINATION_PORT,VALUE_OF_ETH_TYPE =>VALUE_OF_ETH_TYPE,CHECK_OR_NOT_ETH_TYPE => CHECK_OR_NOT_ETH_TYPE,VALUE_OF_IP_PROTOCOL => VALUE_OF_IP_PROTOCOL,CHECK_OR_NOT_IP_PROTOCOL => CHECK_OR_NOT_IP_PROTOCOL,VALUE_OF_IP_VERSION => VALUE_OF_IP_VERSION,CHECK_OR_NOT_IP_VERSION => CHECK_OR_NOT_IP_VERSION) port map(clk,main_data,done_UDP_DESTINATION_PORT,destination_mac_address,source_mac_address,eth_type,ip_version,ip_protocol,source_IP_address,destination_IP_address,udp_source_port,udp_destination_port,check_flag);
end Behavioral;

