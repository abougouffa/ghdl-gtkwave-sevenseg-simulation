library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sevenseg_test is
end;

architecture sim of sevenseg_test is
  component sevenseg is
    port(
      num: in unsigned(3 downto 0);
      rst: in std_logic;
      segments: out std_logic_vector(6 downto 0)
    );
  end component;

  signal in_signal: unsigned(3 downto 0) := "0000";
  signal rst_signal: std_logic := '0';
  signal out_segments: std_logic_vector(6 downto 0);

begin
  -- device under test
  dut : sevenseg port map(in_signal, rst_signal, out_segments);

  -- simulate outputs for inputs from 0 to 15 (0x0 .. 0xF)
  process begin
    for i in 0 to 15 loop
      in_signal <= to_unsigned(i, 4);
      rst_signal <= '1' when i = 10 else '0';
      wait for 10 ns;
    end loop;
    wait;
  end process;

end sim;
