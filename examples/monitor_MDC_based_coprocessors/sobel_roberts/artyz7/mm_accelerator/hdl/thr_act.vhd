-- -------------------------------------------------------------------------------
-- This file has been automatically generated by the Caph compiler (version 2.8.4d)
-- from file main.cph, on 2018-05-11 at 16:31:33, by <unknown>
-- For more information, see : http://caph.univ-bpclermont.fr
-- -------------------------------------------------------------------------------

library ieee,caph,work;
use ieee.std_logic_1164.all;
use caph.core.all;
use caph.data_types.all;
use ieee.numeric_std.all;
use work.all;
use work.edgeDetectionOk_globals.all;

entity thr is
   port (
    in_g_empty: in std_logic;
    in_g: in std_logic_vector(13 downto 0);
    in_g_rd: out std_logic;
    out_pel_full: in std_logic;
    out_pel: out std_logic_vector(7 downto 0);
    out_pel_wr: out std_logic;
    clock: in std_logic;
    reset: in std_logic
    );
end thr;

architecture FSM of thr is
begin
  comb: process(in_g, in_g_empty, out_pel_full)
    variable p_g : signed(13 downto 0);
  begin
    -- in_g.rdy, in_g > 80, out_pel.rdy / p_g=in_g, wr(out_pel,255)
    if in_g_empty='0' and ((from_std_logic_vector(in_g,14)) > (to_signed(80,14))) and out_pel_full='0' then
      p_g := from_std_logic_vector(in_g,14);
      in_g_rd <= '1';
      out_pel <= std_logic_vector(to_unsigned(255,8));
      out_pel_wr <= '1';
    -- in_g.rdy, out_pel.rdy / p_g=in_g, wr(out_pel,0)
    elsif in_g_empty='0' and out_pel_full='0' then
      p_g := from_std_logic_vector(in_g,14);
      in_g_rd <= '1';
      out_pel <= std_logic_vector(to_unsigned(0,8));
      out_pel_wr <= '1';
    else
      in_g_rd <= '0';
      out_pel_wr <= '0';
      out_pel <= (others => 'X');
    end if;
  end process;
  seq: process(clock, reset)
  begin
    if (reset='0') then
    elsif rising_edge(clock) then
    end if;
  end process;
end FSM;
