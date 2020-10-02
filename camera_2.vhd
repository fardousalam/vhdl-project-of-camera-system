library ieee;
use ieee.std_logic_1164.all;
entity DISP_MUX is
port(EXP_TIME : in integer;
NO_PICS : in integer;
SHOW_TIME : in std_ulogic;
E_ERROR : in std_ulogic;
DISP_PHOTO : out integer);
end DISP_MUX;
architecture RTL of DISP_MUX is
begin
process(NO_PICS, EXP_TIME, SHOW_TIME,E_ERROR)
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
end RTL;
