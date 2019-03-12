library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- On a standard seven segments, there is 7 LEDs
-- placed as an eight symbol.
-- These LEDs are connected to the 7 input signals (cathodes)
-- and a common anode.
--
--       A
--    -------
-- F |       | B
--   |   G   |
--    -------
-- E |       | C
--   |       |
--    -------
--       D

entity sevenseg is
  port(
    num: in unsigned(3 downto 0); -- A number from 1 to F
    segments: out std_logic_vector(6 downto 0)
  );
end sevenseg;

architecture sevenseg_behavior of sevenseg is
begin
  segments <= "1000000" when num="0000" else -- 0 <=> (A,B,C,D,E,F) = ON, (G) = OFF
              "1111001" when num="0001" else -- 1 <=> (B,C) = ON, (A,F,E,D,G) = OFF
              "0100100" when num="0010" else -- 2 <=> (A,B,E,D,G) = ON, (F,C) = OFF
              "0110000" when num="0011" else -- 3
              "0011001" when num="0100" else -- 4
              "0010010" when num="0101" else -- 5
              "0000010" when num="0110" else -- 6
              "1111000" when num="0111" else -- 7
              "0000000" when num="1000" else -- 8
              "0010000" when num="1001" else -- 9
              "0001000" when num="1010" else -- A
              "0000011" when num="1011" else -- B
              "0100111" when num="1100" else -- C
              "0100001" when num="1101" else -- D
              "0000110" when num="1110" else -- E
              "0001110" when num="1111" else -- F
              "ZZZZZZZ";
end sevenseg_behavior;
