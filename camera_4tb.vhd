library ieee;
use ieee.std_logic_1164.all;
library work;
use work.P_DISPLAY.all;

entity TB_DISP_DRIVE is end
TB_DISP_DRIVE;

architecture TEST of TB_DISP_DRIVE is
component DISP_DRIVE
port
(
EXP_TIME   : in T_DIGITS;
NO_PICS    : in T_DIGITS;
SHOW_TIME  : in std_ulogic;
ERROR_INP  : in std_ulogic;
DISPLAY    : out T_DISPLAY);
end component;

signal W_EXP_TIME :T_DIGITS;
signal W_NO_PICS  :T_DIGITS;
signal W_SHOW_TIME:std_ulogic:='0';
signal W_ERROR_INP:std_ulogic:='0';
signal W_DISPLAY :T_DISPLAY;

begin
DUT :DISP_DRIVE
port map
(
EXP_TIME  => W_EXP_TIME,
NO_PICS   =>W_NO_PICS,
SHOW_TIME  =>W_SHOW_TIME,
ERROR_INP  =>W_ERROR_INP,
DISPLAY =>W_DISPLAY
);
STIMULI :process
begin

wait for 30 ns;
        W_ERROR_INP <= '0';
        W_SHOW_TIME <= '1';
        W_NO_PICS <=(1,2,7);
        W_EXP_TIME <=(1,4,5);
wait for 30 ns;
        W_ERROR_INP <= '0';
        W_SHOW_TIME <= '0';
        W_NO_PICS <=(2,3,8);
        W_EXP_TIME <=(7,6,7);
wait for 30 ns;
        W_ERROR_INP <= '1';
        W_SHOW_TIME <= '1';
        W_NO_PICS <=(2,8,5);
        W_EXP_TIME <=(3,4,0);


wait;

end process;
DISPLAY_DIGIT(W_DISPLAY);
end TEST;

configuration CFG_TB_DISP_EXT_MUX of TB_DISP_DRIVE is
for TEST
end for;
end CFG_TB_DISP_EXT_MUX;
