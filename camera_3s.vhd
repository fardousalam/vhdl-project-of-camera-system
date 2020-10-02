library ieee;
use ieee.std_logic_1164.all;
use work.P_DISPLAY.ALL;
entity DSP_DRV is
port(EXP_TIME : in T_DIGITS;
NO_PICS : in T_DIGITS;
SHOW_TIME : in std_ulogic;
E_ERROR : in std_ulogic;
DISPLAY : out T_DISPLAY);
end DSP_DRV;
architecture RTL of DSP_DRV is
 signal DISP_PHOTO: integer;
begin
process(NO_PICS, EXP_TIME, SHOW_TIME)
begin

if (E_ERROR='1') then

DISP_PHOTO <=10;

Else
if
(SHOW_TIME = '1') then
    DISP_PHOTO <= EXP_TIME;
else
    DISP_PHOTO <= NO_PICS;
end if;

end if;
end process;
Process (DISP_PHOTO)
begin 
     if DISP_PHOTO = 0 then
	   DISPLAY<= SEG_0;
	elsif DISP_PHOTO = 1 then
	   DISPLAY<= SEG_1;
	elsif DISP_PHOTO = 2 then
	   DISPLAY<= SEG_2; 
    elsif DISP_PHOTO = 3 then
	   DISPLAY<= SEG_3;
	elsif DISP_PHOTO = 4 then
	   DISPLAY<= SEG_4;
	elsif DISP_PHOTO = 5 then
	   DISPLAY<= SEG_5;
	elsif DISP_PHOTO = 6 then
	   DISPLAY<= SEG_6;
	elsif DISP_PHOTO = 7 then
	   DISPLAY<= SEG_7;
	elsif DISP_PHOTO = 8 then
	   DISPLAY<= SEG_8;
	elsif DISP_PHOTO = 9 then
	   DISPLAY<= SEG_9;
	elsif DISP_PHOTO = 10 then
	   DISPLAY<= SEG_E;
end if;
end Process;
 
 end RTL;

