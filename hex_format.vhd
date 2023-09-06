
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity hex_format is
port(
     clk:in std_logic;
   
    
       master_data: out std_logic_vector(31 downto 0);
       master_last :out std_logic;
       master_ready:in std_logic;
       master_valid:out std_logic
);
end hex_format;
architecture behave of  hex_format is
-- this function turns hex  to bytes it takes 2 characters of the hex
function str_to_bin( x1:in character;
                     x2:in character)
         return std_logic_vector is
         
         variable myturn:std_logic_vector(7 downto 0);
         
         begin
         
         if(x1='0' and x2='0') then myturn:=X"00";
elsif(x1='0' and x2='1') then myturn:=X"01";
elsif(x1='0' and x2='2') then myturn:=X"02";
elsif(x1='0' and x2='3') then myturn:=X"03";
elsif(x1='0' and x2='4') then myturn:=X"04";
elsif(x1='0' and x2='5') then myturn:=X"05";
elsif(x1='0' and x2='6') then myturn:=X"06";
elsif(x1='0' and x2='7') then myturn:=X"07";
elsif(x1='0' and x2='8') then myturn:=X"08";
elsif(x1='0' and x2='9') then myturn:=X"09";
elsif(x1='0' and x2='a') then myturn:=X"0a";
elsif(x1='0' and x2='b') then myturn:=X"0b";
elsif(x1='0' and x2='c') then myturn:=X"0c";
elsif(x1='0' and x2='d') then myturn:=X"0d";
elsif(x1='0' and x2='e') then myturn:=X"0e";
elsif(x1='0' and x2='f') then myturn:=X"0f";
elsif(x1='1' and x2='0') then myturn:=X"10";
elsif(x1='1' and x2='1') then myturn:=X"11";
elsif(x1='1' and x2='2') then myturn:=X"12";
elsif(x1='1' and x2='3') then myturn:=X"13";
elsif(x1='1' and x2='4') then myturn:=X"14";
elsif(x1='1' and x2='5') then myturn:=X"15";
elsif(x1='1' and x2='6') then myturn:=X"16";
elsif(x1='1' and x2='7') then myturn:=X"17";
elsif(x1='1' and x2='8') then myturn:=X"18";
elsif(x1='1' and x2='9') then myturn:=X"19";
elsif(x1='1' and x2='a') then myturn:=X"1a";
elsif(x1='1' and x2='b') then myturn:=X"1b";
elsif(x1='1' and x2='c') then myturn:=X"1c";
elsif(x1='1' and x2='d') then myturn:=X"1d";
elsif(x1='1' and x2='e') then myturn:=X"1e";
elsif(x1='1' and x2='f') then myturn:=X"1f";
elsif(x1='2' and x2='0') then myturn:=X"20";
elsif(x1='2' and x2='1') then myturn:=X"21";
elsif(x1='2' and x2='2') then myturn:=X"22";
elsif(x1='2' and x2='3') then myturn:=X"23";
elsif(x1='2' and x2='4') then myturn:=X"24";
elsif(x1='2' and x2='5') then myturn:=X"25";
elsif(x1='2' and x2='6') then myturn:=X"26";
elsif(x1='2' and x2='7') then myturn:=X"27";
elsif(x1='2' and x2='8') then myturn:=X"28";
elsif(x1='2' and x2='9') then myturn:=X"29";
elsif(x1='2' and x2='a') then myturn:=X"2a";
elsif(x1='2' and x2='b') then myturn:=X"2b";
elsif(x1='2' and x2='c') then myturn:=X"2c";
elsif(x1='2' and x2='d') then myturn:=X"2d";
elsif(x1='2' and x2='e') then myturn:=X"2e";
elsif(x1='2' and x2='f') then myturn:=X"2f";
elsif(x1='3' and x2='0') then myturn:=X"30";
elsif(x1='3' and x2='1') then myturn:=X"31";
elsif(x1='3' and x2='2') then myturn:=X"32";
elsif(x1='3' and x2='3') then myturn:=X"33";
elsif(x1='3' and x2='4') then myturn:=X"34";
elsif(x1='3' and x2='5') then myturn:=X"35";
elsif(x1='3' and x2='6') then myturn:=X"36";
elsif(x1='3' and x2='7') then myturn:=X"37";
elsif(x1='3' and x2='8') then myturn:=X"38";
elsif(x1='3' and x2='9') then myturn:=X"39";
elsif(x1='3' and x2='a') then myturn:=X"3a";
elsif(x1='3' and x2='b') then myturn:=X"3b";
elsif(x1='3' and x2='c') then myturn:=X"3c";
elsif(x1='3' and x2='d') then myturn:=X"3d";
elsif(x1='3' and x2='e') then myturn:=X"3e";
elsif(x1='3' and x2='f') then myturn:=X"3f";
elsif(x1='4' and x2='0') then myturn:=X"40";
elsif(x1='4' and x2='1') then myturn:=X"41";
elsif(x1='4' and x2='2') then myturn:=X"42";
elsif(x1='4' and x2='3') then myturn:=X"43";
elsif(x1='4' and x2='4') then myturn:=X"44";
elsif(x1='4' and x2='5') then myturn:=X"45";
elsif(x1='4' and x2='6') then myturn:=X"46";
elsif(x1='4' and x2='7') then myturn:=X"47";
elsif(x1='4' and x2='8') then myturn:=X"48";
elsif(x1='4' and x2='9') then myturn:=X"49";
elsif(x1='4' and x2='a') then myturn:=X"4a";
elsif(x1='4' and x2='b') then myturn:=X"4b";
elsif(x1='4' and x2='c') then myturn:=X"4c";
elsif(x1='4' and x2='d') then myturn:=X"4d";
elsif(x1='4' and x2='e') then myturn:=X"4e";
elsif(x1='4' and x2='f') then myturn:=X"4f";
elsif(x1='5' and x2='0') then myturn:=X"50";
elsif(x1='5' and x2='1') then myturn:=X"51";
elsif(x1='5' and x2='2') then myturn:=X"52";
elsif(x1='5' and x2='3') then myturn:=X"53";
elsif(x1='5' and x2='4') then myturn:=X"54";
elsif(x1='5' and x2='5') then myturn:=X"55";
elsif(x1='5' and x2='6') then myturn:=X"56";
elsif(x1='5' and x2='7') then myturn:=X"57";
elsif(x1='5' and x2='8') then myturn:=X"58";
elsif(x1='5' and x2='9') then myturn:=X"59";
elsif(x1='5' and x2='a') then myturn:=X"5a";
elsif(x1='5' and x2='b') then myturn:=X"5b";
elsif(x1='5' and x2='c') then myturn:=X"5c";
elsif(x1='5' and x2='d') then myturn:=X"5d";
elsif(x1='5' and x2='e') then myturn:=X"5e";
elsif(x1='5' and x2='f') then myturn:=X"5f";
elsif(x1='6' and x2='0') then myturn:=X"60";
elsif(x1='6' and x2='1') then myturn:=X"61";
elsif(x1='6' and x2='2') then myturn:=X"62";
elsif(x1='6' and x2='3') then myturn:=X"63";
elsif(x1='6' and x2='4') then myturn:=X"64";
elsif(x1='6' and x2='5') then myturn:=X"65";
elsif(x1='6' and x2='6') then myturn:=X"66";
elsif(x1='6' and x2='7') then myturn:=X"67";
elsif(x1='6' and x2='8') then myturn:=X"68";
elsif(x1='6' and x2='9') then myturn:=X"69";
elsif(x1='6' and x2='a') then myturn:=X"6a";
elsif(x1='6' and x2='b') then myturn:=X"6b";
elsif(x1='6' and x2='c') then myturn:=X"6c";
elsif(x1='6' and x2='d') then myturn:=X"6d";
elsif(x1='6' and x2='e') then myturn:=X"6e";
elsif(x1='6' and x2='f') then myturn:=X"6f";
elsif(x1='7' and x2='0') then myturn:=X"70";
elsif(x1='7' and x2='1') then myturn:=X"71";
elsif(x1='7' and x2='2') then myturn:=X"72";
elsif(x1='7' and x2='3') then myturn:=X"73";
elsif(x1='7' and x2='4') then myturn:=X"74";
elsif(x1='7' and x2='5') then myturn:=X"75";
elsif(x1='7' and x2='6') then myturn:=X"76";
elsif(x1='7' and x2='7') then myturn:=X"77";
elsif(x1='7' and x2='8') then myturn:=X"78";
elsif(x1='7' and x2='9') then myturn:=X"79";
elsif(x1='7' and x2='a') then myturn:=X"7a";
elsif(x1='7' and x2='b') then myturn:=X"7b";
elsif(x1='7' and x2='c') then myturn:=X"7c";
elsif(x1='7' and x2='d') then myturn:=X"7d";
elsif(x1='7' and x2='e') then myturn:=X"7e";
elsif(x1='7' and x2='f') then myturn:=X"7f";
elsif(x1='8' and x2='0') then myturn:=X"80";
elsif(x1='8' and x2='1') then myturn:=X"81";
elsif(x1='8' and x2='2') then myturn:=X"82";
elsif(x1='8' and x2='3') then myturn:=X"83";
elsif(x1='8' and x2='4') then myturn:=X"84";
elsif(x1='8' and x2='5') then myturn:=X"85";
elsif(x1='8' and x2='6') then myturn:=X"86";
elsif(x1='8' and x2='7') then myturn:=X"87";
elsif(x1='8' and x2='8') then myturn:=X"88";
elsif(x1='8' and x2='9') then myturn:=X"89";
elsif(x1='8' and x2='a') then myturn:=X"8a";
elsif(x1='8' and x2='b') then myturn:=X"8b";
elsif(x1='8' and x2='c') then myturn:=X"8c";
elsif(x1='8' and x2='d') then myturn:=X"8d";
elsif(x1='8' and x2='e') then myturn:=X"8e";
elsif(x1='8' and x2='f') then myturn:=X"8f";
elsif(x1='9' and x2='0') then myturn:=X"90";
elsif(x1='9' and x2='1') then myturn:=X"91";
elsif(x1='9' and x2='2') then myturn:=X"92";
elsif(x1='9' and x2='3') then myturn:=X"93";
elsif(x1='9' and x2='4') then myturn:=X"94";
elsif(x1='9' and x2='5') then myturn:=X"95";
elsif(x1='9' and x2='6') then myturn:=X"96";
elsif(x1='9' and x2='7') then myturn:=X"97";
elsif(x1='9' and x2='8') then myturn:=X"98";
elsif(x1='9' and x2='9') then myturn:=X"99";
elsif(x1='9' and x2='a') then myturn:=X"9a";
elsif(x1='9' and x2='b') then myturn:=X"9b";
elsif(x1='9' and x2='c') then myturn:=X"9c";
elsif(x1='9' and x2='d') then myturn:=X"9d";
elsif(x1='9' and x2='e') then myturn:=X"9e";
elsif(x1='9' and x2='f') then myturn:=X"9f";
elsif(x1='a' and x2='0') then myturn:=X"a0";
elsif(x1='a' and x2='1') then myturn:=X"a1";
elsif(x1='a' and x2='2') then myturn:=X"a2";
elsif(x1='a' and x2='3') then myturn:=X"a3";
elsif(x1='a' and x2='4') then myturn:=X"a4";
elsif(x1='a' and x2='5') then myturn:=X"a5";
elsif(x1='a' and x2='6') then myturn:=X"a6";
elsif(x1='a' and x2='7') then myturn:=X"a7";
elsif(x1='a' and x2='8') then myturn:=X"a8";
elsif(x1='a' and x2='9') then myturn:=X"a9";
elsif(x1='a' and x2='a') then myturn:=X"aa";
elsif(x1='a' and x2='b') then myturn:=X"ab";
elsif(x1='a' and x2='c') then myturn:=X"ac";
elsif(x1='a' and x2='d') then myturn:=X"ad";
elsif(x1='a' and x2='e') then myturn:=X"ae";
elsif(x1='a' and x2='f') then myturn:=X"af";
elsif(x1='b' and x2='0') then myturn:=X"b0";
elsif(x1='b' and x2='1') then myturn:=X"b1";
elsif(x1='b' and x2='2') then myturn:=X"b2";
elsif(x1='b' and x2='3') then myturn:=X"b3";
elsif(x1='b' and x2='4') then myturn:=X"b4";
elsif(x1='b' and x2='5') then myturn:=X"b5";
elsif(x1='b' and x2='6') then myturn:=X"b6";
elsif(x1='b' and x2='7') then myturn:=X"b7";
elsif(x1='b' and x2='8') then myturn:=X"b8";
elsif(x1='b' and x2='9') then myturn:=X"b9";
elsif(x1='b' and x2='a') then myturn:=X"ba";
elsif(x1='b' and x2='b') then myturn:=X"bb";
elsif(x1='b' and x2='c') then myturn:=X"bc";
elsif(x1='b' and x2='d') then myturn:=X"bd";
elsif(x1='b' and x2='e') then myturn:=X"be";
elsif(x1='b' and x2='f') then myturn:=X"bf";
elsif(x1='c' and x2='0') then myturn:=X"c0";
elsif(x1='c' and x2='1') then myturn:=X"c1";
elsif(x1='c' and x2='2') then myturn:=X"c2";
elsif(x1='c' and x2='3') then myturn:=X"c3";
elsif(x1='c' and x2='4') then myturn:=X"c4";
elsif(x1='c' and x2='5') then myturn:=X"c5";
elsif(x1='c' and x2='6') then myturn:=X"c6";
elsif(x1='c' and x2='7') then myturn:=X"c7";
elsif(x1='c' and x2='8') then myturn:=X"c8";
elsif(x1='c' and x2='9') then myturn:=X"c9";
elsif(x1='c' and x2='a') then myturn:=X"ca";
elsif(x1='c' and x2='b') then myturn:=X"cb";
elsif(x1='c' and x2='c') then myturn:=X"cc";
elsif(x1='c' and x2='d') then myturn:=X"cd";
elsif(x1='c' and x2='e') then myturn:=X"ce";
elsif(x1='c' and x2='f') then myturn:=X"cf";
elsif(x1='d' and x2='0') then myturn:=X"d0";
elsif(x1='d' and x2='1') then myturn:=X"d1";
elsif(x1='d' and x2='2') then myturn:=X"d2";
elsif(x1='d' and x2='3') then myturn:=X"d3";
elsif(x1='d' and x2='4') then myturn:=X"d4";
elsif(x1='d' and x2='5') then myturn:=X"d5";
elsif(x1='d' and x2='6') then myturn:=X"d6";
elsif(x1='d' and x2='7') then myturn:=X"d7";
elsif(x1='d' and x2='8') then myturn:=X"d8";
elsif(x1='d' and x2='9') then myturn:=X"d9";
elsif(x1='d' and x2='a') then myturn:=X"da";
elsif(x1='d' and x2='b') then myturn:=X"db";
elsif(x1='d' and x2='c') then myturn:=X"dc";
elsif(x1='d' and x2='d') then myturn:=X"dd";
elsif(x1='d' and x2='e') then myturn:=X"de";
elsif(x1='d' and x2='f') then myturn:=X"df";
elsif(x1='e' and x2='0') then myturn:=X"e0";
elsif(x1='e' and x2='1') then myturn:=X"e1";
elsif(x1='e' and x2='2') then myturn:=X"e2";
elsif(x1='e' and x2='3') then myturn:=X"e3";
elsif(x1='e' and x2='4') then myturn:=X"e4";
elsif(x1='e' and x2='5') then myturn:=X"e5";
elsif(x1='e' and x2='6') then myturn:=X"e6";
elsif(x1='e' and x2='7') then myturn:=X"e7";
elsif(x1='e' and x2='8') then myturn:=X"e8";
elsif(x1='e' and x2='9') then myturn:=X"e9";
elsif(x1='e' and x2='a') then myturn:=X"ea";
elsif(x1='e' and x2='b') then myturn:=X"eb";
elsif(x1='e' and x2='c') then myturn:=X"ec";
elsif(x1='e' and x2='d') then myturn:=X"ed";
elsif(x1='e' and x2='e') then myturn:=X"ee";
elsif(x1='e' and x2='f') then myturn:=X"ef";
elsif(x1='f' and x2='0') then myturn:=X"f0";
elsif(x1='f' and x2='1') then myturn:=X"f1";
elsif(x1='f' and x2='2') then myturn:=X"f2";
elsif(x1='f' and x2='3') then myturn:=X"f3";
elsif(x1='f' and x2='4') then myturn:=X"f4";
elsif(x1='f' and x2='5') then myturn:=X"f5";
elsif(x1='f' and x2='6') then myturn:=X"f6";
elsif(x1='f' and x2='7') then myturn:=X"f7";
elsif(x1='f' and x2='8') then myturn:=X"f8";
elsif(x1='f' and x2='9') then myturn:=X"f9";
elsif(x1='f' and x2='a') then myturn:=X"fa";
elsif(x1='f' and x2='b') then myturn:=X"fb";
elsif(x1='f' and x2='c') then myturn:=X"fc";
elsif(x1='f' and x2='d') then myturn:=X"fd";
elsif(x1='f' and x2='e') then myturn:=X"fe";
elsif(x1='f' and x2='f') then myturn:=X"ff";
         end if;
         return myturn;
         
         end function str_to_bin;


-- 4 hex and 3 spaces makes up 11 character line
type myline is array (1 to 11) of character;
signal current:myline;

-- 1 byte for each hex in a line with 4 hex
type srem is array (1  to 4) of std_logic_vector(7 downto 0);
signal holdon:srem; 

-- increase if you want 2048 is for readings of 1-512 lines
type packetrem is array (0 to 2048) of std_logic_vector(7 downto 0);
signal packet:packetrem;
signal len:integer:=0;
signal mystate:std_logic:='0';
signal is_ready:std_logic;
signal my_last_datum:std_logic:='0';
signal master_order:integer:=0;

begin


master_last<=my_last_datum;
is_ready<=master_ready;
master_valid<=mystate;

-- hex's are held as bytes
holdon(1)<=str_to_bin(current(1),current(2));
holdon(2)<=str_to_bin(current(4),current(5));
holdon(3)<=str_to_bin(current(7),current(8));
holdon(4)<=str_to_bin(current(10),current(11));
 process(clk)
--------------------------------------------------------------------------------------------------

-- enter the path of your txt file
file test_vector                : text open read_mode is "C:\Users\uzayk\parser_kmbr\parser_kmbr.srcs\sources_1\new\example.txt";
variable row                    : line;
variable v_data_read            : character;

variable v_data_row_counter     : integer := 0;





begin
  

  ------------------------------------
  if(rising_edge(clk)) then
    
   
    
    -- read from input file in "row" variable
      if(not endfile(test_vector)) then
            
           readline(test_vector,row);
            
           for i in 1 to 11 loop
           
                read(row,v_data_read);
                 current(i)<=v_data_read;
                 
           end loop;                   
      else 
             mystate<='1';     
      end if;
      
      -- first store up all lines as bytes in reading mode
       if(mystate='0') then 
      packet(len+3)    <= holdon(1);
      packet(len+2)    <= holdon(2);
      packet(len+1)    <= holdon(3);
      packet(len)    <= holdon(4);
      len<=len+4;
      
      end if;
      
      -- stream the stored data when reading is finished
      if(mystate='1' and is_ready='1') then    
      if(master_order=len) then
      
                        
                    
                        my_last_datum<='0';
      elsif(master_order=(len-4)) then
      
                        master_data(7 downto 0)<=packet(master_order);
                        master_data(15 downto 8)<=packet(master_order+1);
                        master_data(23 downto 16)<=packet(master_order+2);
                        master_data(31 downto 24)<=packet(master_order+3);
                        my_last_datum<='1';
                        master_order<=master_order+4;
      else
      
                        master_data(7 downto 0)<=packet(master_order);
                        master_data(15 downto 8)<=packet(master_order+1);
                        master_data(23 downto 16)<=packet(master_order+2);
                        master_data(31 downto 24)<=packet(master_order+3);

                        master_order<=master_order+4;


     end if; 
     end if;
      
     
      
    
  

      
end if;

    

end process ;
end behave;
