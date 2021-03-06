library ieee;
use ieee.std_logic_1164.all;
package P_DISPLAY is
subtype T_DIGITS_ARRAY is integer range 0 to 10;
type T_DIGITS is array(0 to 2) of T_DIGITS_ARRAY;      --array datatype
subtype T_DISPLAY_ARRAY is std_ulogic_vector (6 downto 0);
type T_DISPLAY is array(0 to 2) of T_DISPLAY_ARRAY;

constant SEG_0 :std_ulogic_vector (6 downto 0):="0111111";
constant SEG_1 :std_ulogic_vector (6 downto 0):="0000011";
constant SEG_2 :std_ulogic_vector (6 downto 0 ):="1101101"; 
constant SEG_3 :std_ulogic_vector(6 downto 0):= "1100111";
constant SEG_4 :std_ulogic_vector(6 downto 0):="1010011";
constant SEG_5 :std_ulogic_vector(6 downto 0):="1110110";
constant SEG_6 :std_ulogic_vector(6 downto 0):="1111110";
constant SEG_7 :std_ulogic_vector(6 downto 0):="0100011";
constant SEG_8 :std_ulogic_vector(6 downto 0):="1111111";
constant SEG_9 :std_ulogic_vector(6 downto 0):="1110111";
constant SEG_E :std_ulogic_vector(6 downto 0):="1111100";

--pragma translate_off
procedure DISPLAY_DIGIT(signal DISPLAY:T_DISPLAY);
--pragma translate_on
end P_DISPLAY;
--pragma translate_off
use std.textio.all;
package body P_DISPLAY is

constant ACTIVE_SEG: character:='#';
constant EMPTY_SEG: character:=' ';
--Width and height of a digit
constant WIDTH:integer:=8;
constant HEIGHT:integer:=9;
--Datatypes to store the complete display in a matrix
subtype T_MATRIX_ROW  is bit_vector(1 to WIDTH);
type T_DISP_MATRIX is array(1 to HEIGHT) of T_MATRIX_ROW;
--Definition of the appearance of the 6 segments
subtype T_DIGIT_ROW is bit_vector (1 to WIDTH);
type T_SEG_DEF is array (1 to HEIGHT) of T_DIGIT_ROW;
type T_DIGIT_DEF is array(0 to 6)of T_SEG_DEF;
constant DIGIT_DEF:T_DIGIT_DEF :=(("00000000", -- ....
				   "00000010", --.    #
				   "00000010", --.    0
                                   "00000010", --.    #
                                   "00000000", -- ....
                                   "00000000", --.    .
                                   "00000000", --.    .
                                   "00000000", --.    .
                                   "00000000"),-- ....
                                 
                                  ("00000000", --  ....
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000", -- .    .
 				   "00000000", --  ....
				   "00000010", -- .    #
				   "00000010", -- .    1
 				   "00000010", -- .    #
				   "00000000"),--  ....

				  ("00000000", --  ....
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000", --  ....
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00111100"),--   #2#

				  ("00000000", --  ....
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000", --  ....
				   "01000000", -- #    .
 				   "01000000", -- 3    .
				   "01000000", -- #    .
				   "00000000"),--  ....

				  ("00000000", --  ....
				   "01000000", -- #    .
				   "01000000", -- 4    .
				   "01000000", -- #    .
				   "00000000", --  ....
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000"),--  ....

		      		  ("00111100", --  #5##
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000", --  ....
			           "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000"),--  ....

  				  ("00000000", --  ....
 				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00111100", --  #6##
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000", -- .    .
				   "00000000"));-- ....

procedure DISPLAY_DIGIT(signal DISPLAY:T_DISPLAY) is
file OUTFILE : TEXT is out "display.txt";

variable L : line;
variable DISP_TEXT: string(T_MATRIX_ROW'range);

variable DISP_MATRIX: T_DISP_MATRIX;
variable COL_L: integer;
variable COL_R: integer;

begin
-- Clear the display
DISP_MATRIX := (others => (others => '0'));
-- Loop over all segments
for SSD in 0 to 2 loop
for SEGMENT in 0 to 6 loop
if DISPLAY(SSD)(SEGMENT) = '1' then
-- Copy the matrix to the final display
-- Loop over all rows of the display
for ROW in T_SEG_DEF'range loop
DISP_MATRIX(ROW)(T_DIGIT_ROW'range) :=
DISP_MATRIX(ROW)(T_DIGIT_ROW'range) or
DIGIT_DEF(SEGMENT)(ROW);
end loop;
end if;
end loop;
-- Write the matrix to a textfile
for I in T_DISP_MATRIX'range loop
-- Start with an empty line
DISP_TEXT := (others => EMPTY_SEG);
for J in T_MATRIX_ROW'range loop
if DISP_MATRIX(I)(J) = '1' then
DISP_TEXT(J) := ACTIVE_SEG;
end if;
end loop;
-- Write the line
write(L, DISP_TEXT);
writeline(OUTFILE, L);
end loop;
end loop;
end DISPLAY_DIGIT;
end P_DISPLAY;
-- pragma translate_on
