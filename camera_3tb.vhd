library ieee;
use ieee.std_logic_1164.all;
use work.P_DISPLAY.ALL;
entity TB_DSP_DRV is
end TB_DSP_DRV;
architecture TEST of TB_DSP_DRV is
component DSP_DRV
port(EXP_TIME : in T_DIGITS;
NO_PICS : in T_DIGITS;
SHOW_TIME : in std_ulogic;
E_ERROR : in std_ulogic;
DISPLAY : out T_DISPLAY);
end component;
signal W_EXP_TIME : T_DIGITS := 0;
signal W_NO_PICS : T_DIGITS := 0;
signal W_SHOW_TIME : std_ulogic := '0';
signal W_E_ERROR : std_ulogic :='0';
signal W_DISP : T_DISPLAY;
begin
DUT : DSP_DRV
port map (
EXP_TIME => W_EXP_TIME,
E_ERROR=> W_E_ERROR,
NO_PICS => W_NO_PICS,
SHOW_TIME => W_SHOW_TIME,
DISPLAY => W_DISP);
STIMULI : process
begin
W_E_ERROR<='0';
W_SHOW_TIME<='0';
W_NO_PICS<=2;
W_EXP_TIME<=7;

wait for 30 ns;
W_E_ERROR<='1';
W_SHOW_TIME<='0';
W_NO_PICS<=2;
W_EXP_TIME<=8;
wait for 30 ns;
W_E_ERROR<='1';
W_SHOW_TIME<='1';
W_NO_PICS<=2;
W_EXP_TIME<=4;

wait for 30 ns;
W_E_ERROR<='0';
W_SHOW_TIME<='1';
W_NO_PICS<=2;
W_EXP_TIME<=5;

wait for 30 ns;

end process;
end TEST;
configuration CFG_TB_DSP_DRV of TB_DSP_DRV is
for TEST
end for;
end CFG_TB_DSP_DRV;
