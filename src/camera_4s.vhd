library ieee;
use ieee. std_logic_1164.all;
------------------
library work;
use work.P_DISPLAY.all;
--------------------------------
entity
DISP_DRIVE  is port
(
EXP_TIME   : in T_DIGITS;
NO_PICS    : in T_DIGITS;
SHOW_TIME  : in std_ulogic;
ERROR_INP  : in std_ulogic;
DISPLAY    : out T_DISPLAY);
end DISP_DRIVE;

architecture RTL of DISP_DRIVE is 
SIGNAL DISP_PHOTO : T_DIGITS;
begin
mul :process(SHOW_TIME,ERROR_INP)   
begin 
 for i in 0 to 2 loop
   if ERROR_INP ='1' then      
         DISP_PHOTO(i) <= 1;
   else
     if SHOW_TIME ='1' then      
         DISP_PHOTO(i) <=EXP_TIME(i);
     else
             DISP_PHOTO(i) <=NO_PICS(i);
  end if;
end if;
end loop;
end process mul;    


Process (DISP_PHOTO(0))
begin 
     if DISP_PHOTO(0) = 0 then
	   DISPLAY(0) <= SEG_0;
	elsif DISP_PHOTO(0) = 1 then
	   DISPLAY(0) <= SEG_1;
	elsif DISP_PHOTO(0) = 2 then
	   DISPLAY(0) <= SEG_2; 
    elsif DISP_PHOTO (0)= 3 then
	   DISPLAY(0) <= SEG_3;
	elsif DISP_PHOTO(0) = 4 then
	   DISPLAY(0) <= SEG_4;
	elsif DISP_PHOTO(0) = 5 then
	   DISPLAY(0) <= SEG_5;
	elsif DISP_PHOTO (0)= 6 then
	   DISPLAY(0) <= SEG_6;
	elsif DISP_PHOTO(0) = 7 then
	   DISPLAY(0) <= SEG_7;
	elsif DISP_PHOTO (0)= 8 then
	   DISPLAY(0)<= SEG_8;
	elsif DISP_PHOTO (0)= 9 then
	   DISPLAY(0)<= SEG_9;
	elsif DISP_PHOTO (0)= 10 then
	   DISPLAY(0)<= SEG_E;
end if;
end Process;

Process (DISP_PHOTO(1))
begin 
     if DISP_PHOTO(1) = 0 then
	   DISPLAY(1)<= SEG_0;
	elsif DISP_PHOTO(1) = 1 then
	   DISPLAY(1)<= SEG_1;
	elsif DISP_PHOTO(1) = 2 then
	   DISPLAY(1)<= SEG_2; 
    elsif DISP_PHOTO(1) = 3 then
	   DISPLAY(1)<= SEG_3;
	elsif DISP_PHOTO(1) = 4 then
	   DISPLAY(1)<= SEG_4;
	elsif DISP_PHOTO(1) = 5 then
	   DISPLAY(1)<= SEG_5;
	elsif DISP_PHOTO(1) = 6 then
	   DISPLAY(1)<= SEG_6;
	elsif DISP_PHOTO (1)= 7 then
	   DISPLAY(1)<= SEG_7;
	elsif DISP_PHOTO (1)= 8 then
	   DISPLAY(1)<= SEG_8;
	elsif DISP_PHOTO (1)= 9 then
	   DISPLAY(1)<= SEG_9;
	elsif DISP_PHOTO(1) = 10 then
	   DISPLAY(1)<= SEG_E;
end if;
end Process;

Process (DISP_PHOTO(2))
begin 
     if DISP_PHOTO(2) = 0 then
	   DISPLAY(2)<= SEG_0;
	elsif DISP_PHOTO(2) = 1 then
	   DISPLAY(2)<= SEG_1;
	elsif DISP_PHOTO(2) = 2 then
	   DISPLAY(2)<= SEG_2; 
    elsif DISP_PHOTO(2) = 3 then
	   DISPLAY(2)<= SEG_3;
	elsif DISP_PHOTO(2) = 4 then
	   DISPLAY(2)<= SEG_4;
	elsif DISP_PHOTO(2) = 5 then
	   DISPLAY(2)<= SEG_5;
	elsif DISP_PHOTO(2) = 6 then
	   DISPLAY(2)<= SEG_6;
	elsif DISP_PHOTO(2) = 7 then
	   DISPLAY(2)<= SEG_7;
	elsif DISP_PHOTO(2) = 8 then
	   DISPLAY(2)<= SEG_8;
	elsif DISP_PHOTO(2) = 9 then
	   DISPLAY(2)<= SEG_9;
	elsif DISP_PHOTO(2) = 10 then
	   DISPLAY(2)<= SEG_E;
end if;
end Process;
             

end RTL;
