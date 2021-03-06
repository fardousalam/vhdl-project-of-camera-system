library ieee;
use ieee.std_logic_1164.all;
entity TB_DISP_MUX is
end TB_DISP_MUX;
architecture TEST of TB_DISP_MUX is
component DISP_MUX
port(EXP_TIME : in integer;
NO_PICS : in integer;
SHOW_TIME : in std_ulogic;
E_ERROR : in std_ulogic;
DISP_PHOTO : out integer);
end component;
signal W_EXP_TIME : integer := 0;
signal W_NO_PICS : integer := 0;
signal W_SHOW_TIME : std_ulogic := '0';
signal W_E_ERROR : std_ulogic :='0';
signal W_DISP_PHOTO : integer:= 0;
begin
DUT : DISP_MUX
port map (
EXP_TIME => W_EXP_TIME,
E_ERROR=> W_E_ERROR,
NO_PICS => W_NO_PICS,
SHOW_TIME => W_SHOW_TIME,
DISP_PHOTO => W_DISP_PHOTO);
STIMULI : process
begin
W_E_ERROR<='0';
W_SHOW_TIME<='0';
W_NO_PICS<=2;
W_EXP_TIME<=64;
wait for 30 ns;
W_E_ERROR<='1';
W_SHOW_TIME<='0';
W_NO_PICS<=2;
W_EXP_TIME<=64;
wait for 30 ns;
W_E_ERROR<='1';
W_SHOW_TIME<='1';
W_NO_PICS<=2;
W_EXP_TIME<=64;
wait for 30 ns;
W_E_ERROR<='0';
W_SHOW_TIME<='1';
W_NO_PICS<=2;
W_EXP_TIME<=64;
wait for 30 ns;

end process;
end TEST;
configuration CFG_TB_DISP_MUX of TB_DISP_MUX is
for TEST
end for;
end CFG_TB_DISP_MUX;
