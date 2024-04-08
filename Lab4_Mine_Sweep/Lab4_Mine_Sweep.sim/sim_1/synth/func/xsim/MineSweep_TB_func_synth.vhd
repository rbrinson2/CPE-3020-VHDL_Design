-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Mon Apr  8 13:13:50 2024
-- Host        : rbrinson running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/rbrin/Documents/GitHub/CPE-3020-VHDL_Design/Lab4_Mine_Sweep/Lab4_Mine_Sweep.sim/sim_1/synth/func/xsim/MineSweep_TB_func_synth.vhd
-- Design      : MineSweepWrapper
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Randomizer is
  port (
    \bombLocation_reg[14]_0\ : out STD_LOGIC_VECTOR ( 14 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end Randomizer;

architecture STRUCTURE of Randomizer is
  signal L : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal L1_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \RANDOMIZER_PROC.bomb1[2]_i_2_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb1_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[0]_i_1_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[1]_i_1_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[1]_i_4_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[1]_i_5_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[1]_i_6_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[1]_i_7_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[1]_i_8_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[1]_i_9_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[2]_i_1_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[2]_i_3_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[2]_i_4_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[2]_i_5_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[2]_i_6_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[3]_i_1_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[3]_i_4_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[4]_i_1_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2[4]_i_2_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2_reg_n_0_[2]\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2_reg_n_0_[3]\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb2_reg_n_0_[4]\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb3Count[0]_i_1_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb3Count[1]_i_1_n_0\ : STD_LOGIC;
  signal \RANDOMIZER_PROC.bomb3_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal bomb1 : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal bomb100 : STD_LOGIC;
  signal bomb10_in : STD_LOGIC_VECTOR ( 3 to 3 );
  signal bomb116_out : STD_LOGIC;
  signal \bomb11__0\ : STD_LOGIC;
  signal bomb120_out : STD_LOGIC;
  signal \bomb12__6\ : STD_LOGIC;
  signal bomb20_in : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal bomb213_out : STD_LOGIC;
  signal \bomb21__0\ : STD_LOGIC;
  signal bomb21_in : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \bomb22__6\ : STD_LOGIC;
  signal bomb3 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal bomb3Count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \bombLocation[11]_i_5_n_0\ : STD_LOGIC;
  signal \bombLocation[11]_i_6_n_0\ : STD_LOGIC;
  signal \bombLocation[11]_i_7_n_0\ : STD_LOGIC;
  signal \bombLocation[12]_i_2_n_0\ : STD_LOGIC;
  signal \bombLocation[12]_i_3_n_0\ : STD_LOGIC;
  signal \bombLocation[12]_i_5_n_0\ : STD_LOGIC;
  signal \bombLocation[12]_i_6_n_0\ : STD_LOGIC;
  signal \bombLocation[13]_i_2_n_0\ : STD_LOGIC;
  signal \bombLocation[13]_i_6_n_0\ : STD_LOGIC;
  signal \bombLocation[13]_i_7_n_0\ : STD_LOGIC;
  signal \bombLocation[14]_i_1_n_0\ : STD_LOGIC;
  signal \bombLocation[5]_i_1_n_0\ : STD_LOGIC;
  signal \bombLocation[5]_i_4_n_0\ : STD_LOGIC;
  signal \bombLocation[5]_i_5_n_0\ : STD_LOGIC;
  signal \bombLocation[5]_i_6_n_0\ : STD_LOGIC;
  signal \bombLocation[6]_i_1_n_0\ : STD_LOGIC;
  signal \bombLocation[7]_i_1_n_0\ : STD_LOGIC;
  signal \bombLocation[7]_i_2_n_0\ : STD_LOGIC;
  signal \bombLocation[7]_i_3_n_0\ : STD_LOGIC;
  signal \bombLocation[9]_i_1_n_0\ : STD_LOGIC;
  signal \bombLocation_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal counter1 : STD_LOGIC;
  signal data : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb1[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb1[2]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb1[3]_i_3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb2Count[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb2[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb2[1]_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb2[1]_i_5\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb2[1]_i_7\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb2[1]_i_8\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb2[1]_i_9\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb2[2]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb2[2]_i_5\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb2[2]_i_6\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb2[3]_i_4\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb2[3]_i_5\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb3Count[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \RANDOMIZER_PROC.bomb3Count[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \bombLocation[0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \bombLocation[10]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \bombLocation[11]_i_4\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \bombLocation[11]_i_6\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \bombLocation[12]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \bombLocation[12]_i_4\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \bombLocation[12]_i_5\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \bombLocation[12]_i_6\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \bombLocation[13]_i_6\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \bombLocation[13]_i_7\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \bombLocation[1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \bombLocation[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \bombLocation[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \bombLocation[5]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \bombLocation[5]_i_5\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \bombLocation[7]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \bombLocation[7]_i_3\ : label is "soft_lutpair6";
begin
\RANDOMIZER_PROC.bomb1[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080FF7F"
    )
        port map (
      I0 => \bombLocation[12]_i_3_n_0\,
      I1 => bomb100,
      I2 => Q(1),
      I3 => Q(0),
      I4 => \RANDOMIZER_PROC.bomb1_reg\(0),
      O => p_0_in(0)
    );
\RANDOMIZER_PROC.bomb1[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08FBFB08"
    )
        port map (
      I0 => data(1),
      I1 => Q(1),
      I2 => Q(0),
      I3 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I4 => \RANDOMIZER_PROC.bomb1_reg\(1),
      O => p_0_in(1)
    );
\RANDOMIZER_PROC.bomb1[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F90FFFF6F600000"
    )
        port map (
      I0 => \bombLocation[12]_i_2_n_0\,
      I1 => \bombLocation[12]_i_3_n_0\,
      I2 => bomb100,
      I3 => \RANDOMIZER_PROC.bomb1[2]_i_2_n_0\,
      I4 => \RANDOMIZER_PROC.bomb2[2]_i_6_n_0\,
      I5 => L(2),
      O => p_0_in(2)
    );
\RANDOMIZER_PROC.bomb1[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E178781E"
    )
        port map (
      I0 => bomb120_out,
      I1 => \bomb12__6\,
      I2 => \RANDOMIZER_PROC.bomb1_reg\(2),
      I3 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I4 => \RANDOMIZER_PROC.bomb1_reg\(0),
      O => \RANDOMIZER_PROC.bomb1[2]_i_2_n_0\
    );
\RANDOMIZER_PROC.bomb1[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFB8FF0000B800"
    )
        port map (
      I0 => bomb10_in(3),
      I1 => bomb100,
      I2 => bomb1(3),
      I3 => Q(1),
      I4 => Q(0),
      I5 => L(3),
      O => p_0_in(3)
    );
\RANDOMIZER_PROC.bomb1[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFD4002BBFFD4002"
    )
        port map (
      I0 => bomb120_out,
      I1 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I2 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I3 => \RANDOMIZER_PROC.bomb1_reg\(2),
      I4 => \RANDOMIZER_PROC.bomb1_reg\(3),
      I5 => \bomb12__6\,
      O => bomb1(3)
    );
\RANDOMIZER_PROC.bomb1[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I1 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I2 => \RANDOMIZER_PROC.bomb1_reg\(2),
      I3 => \RANDOMIZER_PROC.bomb1_reg\(3),
      O => L(3)
    );
\RANDOMIZER_PROC.bomb1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => p_0_in(0),
      Q => \RANDOMIZER_PROC.bomb1_reg\(0)
    );
\RANDOMIZER_PROC.bomb1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => p_0_in(1),
      Q => \RANDOMIZER_PROC.bomb1_reg\(1)
    );
\RANDOMIZER_PROC.bomb1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => p_0_in(2),
      Q => \RANDOMIZER_PROC.bomb1_reg\(2)
    );
\RANDOMIZER_PROC.bomb1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => p_0_in(3),
      Q => \RANDOMIZER_PROC.bomb1_reg\(3)
    );
\RANDOMIZER_PROC.bomb1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => bomb100,
      Q => \RANDOMIZER_PROC.bomb1_reg\(4)
    );
\RANDOMIZER_PROC.bomb2Count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      O => counter1
    );
\RANDOMIZER_PROC.bomb2Count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => counter1,
      Q => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\
    );
\RANDOMIZER_PROC.bomb2[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3C3CAA3C"
    )
        port map (
      I0 => \bombLocation[5]_i_1_n_0\,
      I1 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I2 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I3 => Q(1),
      I4 => Q(0),
      O => \RANDOMIZER_PROC.bomb2[0]_i_1_n_0\
    );
\RANDOMIZER_PROC.bomb2[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"606F9F900000FFFF"
    )
        port map (
      I0 => \bomb22__6\,
      I1 => \bomb12__6\,
      I2 => \RANDOMIZER_PROC.bomb2[4]_i_2_n_0\,
      I3 => \RANDOMIZER_PROC.bomb2[1]_i_4_n_0\,
      I4 => \RANDOMIZER_PROC.bomb2[1]_i_5_n_0\,
      I5 => \RANDOMIZER_PROC.bomb2[2]_i_6_n_0\,
      O => \RANDOMIZER_PROC.bomb2[1]_i_1_n_0\
    );
\RANDOMIZER_PROC.bomb2[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000606000"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2[3]_i_4_n_0\,
      I1 => bomb3(3),
      I2 => \RANDOMIZER_PROC.bomb2[1]_i_6_n_0\,
      I3 => \RANDOMIZER_PROC.bomb2[2]_i_5_n_0\,
      I4 => bomb3(2),
      I5 => \RANDOMIZER_PROC.bomb2[1]_i_7_n_0\,
      O => \bomb22__6\
    );
\RANDOMIZER_PROC.bomb2[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0060600000000000"
    )
        port map (
      I0 => L(3),
      I1 => \RANDOMIZER_PROC.bomb2[3]_i_4_n_0\,
      I2 => \RANDOMIZER_PROC.bomb2[1]_i_8_n_0\,
      I3 => L(2),
      I4 => \RANDOMIZER_PROC.bomb2[2]_i_5_n_0\,
      I5 => \RANDOMIZER_PROC.bomb2[1]_i_9_n_0\,
      O => \bomb12__6\
    );
\RANDOMIZER_PROC.bomb2[1]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"147D"
    )
        port map (
      I0 => bomb213_out,
      I1 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I2 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I3 => \bomb21__0\,
      O => \RANDOMIZER_PROC.bomb2[1]_i_4_n_0\
    );
\RANDOMIZER_PROC.bomb2[1]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I1 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I2 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      O => \RANDOMIZER_PROC.bomb2[1]_i_5_n_0\
    );
\RANDOMIZER_PROC.bomb2[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A6A956A95"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb3_reg\(1),
      I1 => bomb3Count(1),
      I2 => \RANDOMIZER_PROC.bomb3_reg\(0),
      I3 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      I4 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I5 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      O => \RANDOMIZER_PROC.bomb2[1]_i_6_n_0\
    );
\RANDOMIZER_PROC.bomb2[1]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => bomb3Count(1),
      I1 => \RANDOMIZER_PROC.bomb3_reg\(0),
      I2 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I3 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      O => \RANDOMIZER_PROC.bomb2[1]_i_7_n_0\
    );
\RANDOMIZER_PROC.bomb2[1]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"659A9A65"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      I1 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I2 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I3 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I4 => \RANDOMIZER_PROC.bomb1_reg\(0),
      O => \RANDOMIZER_PROC.bomb2[1]_i_8_n_0\
    );
\RANDOMIZER_PROC.bomb2[1]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I1 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I2 => \RANDOMIZER_PROC.bomb1_reg\(0),
      O => \RANDOMIZER_PROC.bomb2[1]_i_9_n_0\
    );
\RANDOMIZER_PROC.bomb2[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B88B8BB80000FFFF"
    )
        port map (
      I0 => bomb20_in(2),
      I1 => \RANDOMIZER_PROC.bomb2[4]_i_2_n_0\,
      I2 => \RANDOMIZER_PROC.bomb2[2]_i_3_n_0\,
      I3 => \RANDOMIZER_PROC.bomb2[2]_i_4_n_0\,
      I4 => \RANDOMIZER_PROC.bomb2[2]_i_5_n_0\,
      I5 => \RANDOMIZER_PROC.bomb2[2]_i_6_n_0\,
      O => \RANDOMIZER_PROC.bomb2[2]_i_1_n_0\
    );
\RANDOMIZER_PROC.bomb2[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1E1E781E7878E178"
    )
        port map (
      I0 => \bomb12__6\,
      I1 => \bomb22__6\,
      I2 => \RANDOMIZER_PROC.bomb2_reg_n_0_[2]\,
      I3 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I4 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I5 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      O => bomb20_in(2)
    );
\RANDOMIZER_PROC.bomb2[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F17FF7F1"
    )
        port map (
      I0 => \bomb21__0\,
      I1 => bomb213_out,
      I2 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      I3 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I4 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      O => \RANDOMIZER_PROC.bomb2[2]_i_3_n_0\
    );
\RANDOMIZER_PROC.bomb2[2]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => bomb213_out,
      I1 => \bomb21__0\,
      O => \RANDOMIZER_PROC.bomb2[2]_i_4_n_0\
    );
\RANDOMIZER_PROC.bomb2[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"10EF"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      I1 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I2 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I3 => \RANDOMIZER_PROC.bomb2_reg_n_0_[2]\,
      O => \RANDOMIZER_PROC.bomb2[2]_i_5_n_0\
    );
\RANDOMIZER_PROC.bomb2[2]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      O => \RANDOMIZER_PROC.bomb2[2]_i_6_n_0\
    );
\RANDOMIZER_PROC.bomb2[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF00FFB8B800FF"
    )
        port map (
      I0 => bomb20_in(3),
      I1 => \RANDOMIZER_PROC.bomb2[4]_i_2_n_0\,
      I2 => bomb21_in(3),
      I3 => \RANDOMIZER_PROC.bomb2[3]_i_4_n_0\,
      I4 => Q(1),
      I5 => Q(0),
      O => \RANDOMIZER_PROC.bomb2[3]_i_1_n_0\
    );
\RANDOMIZER_PROC.bomb2[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F870FE1"
    )
        port map (
      I0 => \bomb12__6\,
      I1 => \bomb22__6\,
      I2 => \RANDOMIZER_PROC.bomb2[3]_i_4_n_0\,
      I3 => \RANDOMIZER_PROC.bomb2[2]_i_5_n_0\,
      I4 => \RANDOMIZER_PROC.bomb2[1]_i_5_n_0\,
      O => bomb20_in(3)
    );
\RANDOMIZER_PROC.bomb2[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3FC00BF40BF400FF"
    )
        port map (
      I0 => L1_in(0),
      I1 => \RANDOMIZER_PROC.bomb2[1]_i_5_n_0\,
      I2 => \RANDOMIZER_PROC.bomb2[2]_i_5_n_0\,
      I3 => \RANDOMIZER_PROC.bomb2[3]_i_4_n_0\,
      I4 => bomb213_out,
      I5 => \bomb21__0\,
      O => bomb21_in(3)
    );
\RANDOMIZER_PROC.bomb2[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0004FFFB"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2_reg_n_0_[2]\,
      I1 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I2 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I3 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      I4 => \RANDOMIZER_PROC.bomb2_reg_n_0_[3]\,
      O => \RANDOMIZER_PROC.bomb2[3]_i_4_n_0\
    );
\RANDOMIZER_PROC.bomb2[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I1 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      O => L1_in(0)
    );
\RANDOMIZER_PROC.bomb2[4]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2[4]_i_2_n_0\,
      O => \RANDOMIZER_PROC.bomb2[4]_i_1_n_0\
    );
\RANDOMIZER_PROC.bomb2[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000100FFFFFEFF"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2_reg_n_0_[3]\,
      I1 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      I2 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I3 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I4 => \RANDOMIZER_PROC.bomb2_reg_n_0_[2]\,
      I5 => \RANDOMIZER_PROC.bomb2_reg_n_0_[4]\,
      O => \RANDOMIZER_PROC.bomb2[4]_i_2_n_0\
    );
\RANDOMIZER_PROC.bomb2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => \RANDOMIZER_PROC.bomb2[0]_i_1_n_0\,
      Q => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\
    );
\RANDOMIZER_PROC.bomb2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => \RANDOMIZER_PROC.bomb2[1]_i_1_n_0\,
      Q => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\
    );
\RANDOMIZER_PROC.bomb2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => \RANDOMIZER_PROC.bomb2[2]_i_1_n_0\,
      Q => \RANDOMIZER_PROC.bomb2_reg_n_0_[2]\
    );
\RANDOMIZER_PROC.bomb2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => \RANDOMIZER_PROC.bomb2[3]_i_1_n_0\,
      Q => \RANDOMIZER_PROC.bomb2_reg_n_0_[3]\
    );
\RANDOMIZER_PROC.bomb2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => \RANDOMIZER_PROC.bomb2[4]_i_1_n_0\,
      Q => \RANDOMIZER_PROC.bomb2_reg_n_0_[4]\
    );
\RANDOMIZER_PROC.bomb3Count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bomb3Count(1),
      I1 => bomb3Count(0),
      O => \RANDOMIZER_PROC.bomb3Count[0]_i_1_n_0\
    );
\RANDOMIZER_PROC.bomb3Count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => bomb3Count(0),
      I1 => bomb3Count(1),
      O => \RANDOMIZER_PROC.bomb3Count[1]_i_1_n_0\
    );
\RANDOMIZER_PROC.bomb3Count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => \RANDOMIZER_PROC.bomb3Count[0]_i_1_n_0\,
      Q => bomb3Count(0)
    );
\RANDOMIZER_PROC.bomb3Count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => \RANDOMIZER_PROC.bomb3Count[1]_i_1_n_0\,
      Q => bomb3Count(1)
    );
\RANDOMIZER_PROC.bomb3_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => bomb3(0),
      Q => \RANDOMIZER_PROC.bomb3_reg\(0)
    );
\RANDOMIZER_PROC.bomb3_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => bomb3(1),
      Q => \RANDOMIZER_PROC.bomb3_reg\(1)
    );
\RANDOMIZER_PROC.bomb3_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => bomb3(2),
      Q => \RANDOMIZER_PROC.bomb3_reg\(2)
    );
\RANDOMIZER_PROC.bomb3_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => bomb3(3),
      Q => \RANDOMIZER_PROC.bomb3_reg\(3)
    );
\RANDOMIZER_PROC.bomb3_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      CLR => btnU_IBUF,
      D => bomb3(4),
      Q => \RANDOMIZER_PROC.bomb3_reg\(4)
    );
\bombLocation[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb3_reg\(0),
      I1 => bomb3Count(1),
      O => bomb3(0)
    );
\bombLocation[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"87"
    )
        port map (
      I0 => \bombLocation[12]_i_3_n_0\,
      I1 => bomb100,
      I2 => \RANDOMIZER_PROC.bomb1_reg\(0),
      O => data(0)
    );
\bombLocation[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F1F7FEF801070E0"
    )
        port map (
      I0 => bomb116_out,
      I1 => \bomb11__0\,
      I2 => bomb100,
      I3 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I4 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I5 => bomb1(1),
      O => data(1)
    );
\bombLocation[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEEAAAAE"
    )
        port map (
      I0 => bomb120_out,
      I1 => \bombLocation[11]_i_5_n_0\,
      I2 => \bombLocation[11]_i_6_n_0\,
      I3 => L(3),
      I4 => bomb3(3),
      O => bomb116_out
    );
\bombLocation[11]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAEAEEA"
    )
        port map (
      I0 => \bomb12__6\,
      I1 => \bombLocation[11]_i_7_n_0\,
      I2 => \bombLocation[11]_i_6_n_0\,
      I3 => L(3),
      I4 => \RANDOMIZER_PROC.bomb2[3]_i_4_n_0\,
      O => \bomb11__0\
    );
\bombLocation[11]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \bomb12__6\,
      I1 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I2 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I3 => bomb120_out,
      O => bomb1(1)
    );
\bombLocation[11]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0084002121008400"
    )
        port map (
      I0 => bomb3(0),
      I1 => bomb3(2),
      I2 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I3 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I4 => \RANDOMIZER_PROC.bomb1_reg\(2),
      I5 => bomb3(1),
      O => \bombLocation[11]_i_5_n_0\
    );
\bombLocation[11]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb1_reg\(2),
      I1 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I2 => \RANDOMIZER_PROC.bomb1_reg\(1),
      O => \bombLocation[11]_i_6_n_0\
    );
\bombLocation[11]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8400210000210084"
    )
        port map (
      I0 => L1_in(0),
      I1 => \RANDOMIZER_PROC.bomb2[2]_i_5_n_0\,
      I2 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I3 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I4 => \RANDOMIZER_PROC.bomb1_reg\(2),
      I5 => \RANDOMIZER_PROC.bomb2[1]_i_5_n_0\,
      O => \bombLocation[11]_i_7_n_0\
    );
\bombLocation[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F6F906090609F6F"
    )
        port map (
      I0 => \bombLocation[12]_i_2_n_0\,
      I1 => \bombLocation[12]_i_3_n_0\,
      I2 => bomb100,
      I3 => L(2),
      I4 => \bombLocation[12]_i_5_n_0\,
      I5 => \bombLocation[12]_i_6_n_0\,
      O => data(2)
    );
\bombLocation[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6220"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I1 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I2 => bomb116_out,
      I3 => \bomb11__0\,
      O => \bombLocation[12]_i_2_n_0\
    );
\bombLocation[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => bomb116_out,
      I1 => \bomb11__0\,
      O => \bombLocation[12]_i_3_n_0\
    );
\bombLocation[12]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I1 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I2 => \RANDOMIZER_PROC.bomb1_reg\(2),
      O => L(2)
    );
\bombLocation[12]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"96FF"
    )
        port map (
      I0 => \bomb12__6\,
      I1 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I2 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I3 => bomb120_out,
      O => \bombLocation[12]_i_5_n_0\
    );
\bombLocation[12]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E178"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I1 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I2 => \RANDOMIZER_PROC.bomb1_reg\(2),
      I3 => \bomb12__6\,
      O => \bombLocation[12]_i_6_n_0\
    );
\bombLocation[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFA0405FFFB0004"
    )
        port map (
      I0 => bomb100,
      I1 => bomb120_out,
      I2 => L(2),
      I3 => L(1),
      I4 => L(3),
      I5 => \bomb12__6\,
      O => \bombLocation[13]_i_2_n_0\
    );
\bombLocation[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E01FFA05FA057F80"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I1 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I2 => \RANDOMIZER_PROC.bomb1_reg\(2),
      I3 => \RANDOMIZER_PROC.bomb1_reg\(3),
      I4 => \bomb11__0\,
      I5 => bomb116_out,
      O => bomb10_in(3)
    );
\bombLocation[13]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9000009000000000"
    )
        port map (
      I0 => L(3),
      I1 => bomb3(3),
      I2 => \bombLocation[13]_i_6_n_0\,
      I3 => L(2),
      I4 => bomb3(2),
      I5 => \bombLocation[13]_i_7_n_0\,
      O => bomb120_out
    );
\bombLocation[13]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I1 => \RANDOMIZER_PROC.bomb1_reg\(1),
      O => L(1)
    );
\bombLocation[13]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"956A6A95"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb3_reg\(1),
      I1 => bomb3Count(1),
      I2 => \RANDOMIZER_PROC.bomb3_reg\(0),
      I3 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I4 => \RANDOMIZER_PROC.bomb1_reg\(0),
      O => \bombLocation[13]_i_6_n_0\
    );
\bombLocation[13]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => bomb3Count(1),
      I1 => \RANDOMIZER_PROC.bomb3_reg\(0),
      I2 => \RANDOMIZER_PROC.bomb1_reg\(0),
      O => \bombLocation[13]_i_7_n_0\
    );
\bombLocation[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => E(0),
      I1 => Q(0),
      I2 => Q(1),
      O => \bombLocation[14]_i_1_n_0\
    );
\bombLocation[14]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb1_reg\(2),
      I1 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I2 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I3 => \RANDOMIZER_PROC.bomb1_reg\(3),
      I4 => \RANDOMIZER_PROC.bomb1_reg\(4),
      O => bomb100
    );
\bombLocation[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb3_reg\(0),
      I1 => bomb3Count(1),
      I2 => \RANDOMIZER_PROC.bomb3_reg\(1),
      O => bomb3(1)
    );
\bombLocation[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => bomb3Count(1),
      I1 => \RANDOMIZER_PROC.bomb3_reg\(0),
      I2 => \RANDOMIZER_PROC.bomb3_reg\(1),
      I3 => \RANDOMIZER_PROC.bomb3_reg\(2),
      O => bomb3(2)
    );
\bombLocation[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb3_reg\(1),
      I1 => \RANDOMIZER_PROC.bomb3_reg\(0),
      I2 => bomb3Count(1),
      I3 => \RANDOMIZER_PROC.bomb3_reg\(2),
      I4 => \RANDOMIZER_PROC.bomb3_reg\(3),
      O => bomb3(3)
    );
\bombLocation[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb3_reg\(2),
      I1 => bomb3Count(1),
      I2 => \RANDOMIZER_PROC.bomb3_reg\(0),
      I3 => \RANDOMIZER_PROC.bomb3_reg\(1),
      I4 => \RANDOMIZER_PROC.bomb3_reg\(3),
      I5 => \RANDOMIZER_PROC.bomb3_reg\(4),
      O => bomb3(4)
    );
\bombLocation[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"14EBEB14"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2[4]_i_2_n_0\,
      I1 => \bomb21__0\,
      I2 => bomb213_out,
      I3 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I4 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      O => \bombLocation[5]_i_1_n_0\
    );
\bombLocation[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAEAAAAAEAAA"
    )
        port map (
      I0 => \bomb22__6\,
      I1 => \bombLocation[5]_i_4_n_0\,
      I2 => \RANDOMIZER_PROC.bomb2[1]_i_7_n_0\,
      I3 => \RANDOMIZER_PROC.bomb2[3]_i_4_n_0\,
      I4 => \bombLocation[5]_i_5_n_0\,
      I5 => bomb3(3),
      O => \bomb21__0\
    );
\bombLocation[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAAEAAEA"
    )
        port map (
      I0 => \bomb12__6\,
      I1 => \bombLocation[5]_i_6_n_0\,
      I2 => \RANDOMIZER_PROC.bomb2[3]_i_4_n_0\,
      I3 => \bombLocation[5]_i_5_n_0\,
      I4 => L(3),
      O => bomb213_out
    );
\bombLocation[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8188484424221211"
    )
        port map (
      I0 => bomb3(1),
      I1 => \RANDOMIZER_PROC.bomb2_reg_n_0_[2]\,
      I2 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I3 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I4 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      I5 => bomb3(2),
      O => \bombLocation[5]_i_4_n_0\
    );
\bombLocation[5]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2004"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2_reg_n_0_[2]\,
      I1 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I2 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I3 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      O => \bombLocation[5]_i_5_n_0\
    );
\bombLocation[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1020010240800408"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb1_reg\(2),
      I1 => \RANDOMIZER_PROC.bomb1_reg\(1),
      I2 => \RANDOMIZER_PROC.bomb1_reg\(0),
      I3 => \RANDOMIZER_PROC.bomb2[2]_i_5_n_0\,
      I4 => L1_in(0),
      I5 => \RANDOMIZER_PROC.bomb2[1]_i_5_n_0\,
      O => \bombLocation[5]_i_6_n_0\
    );
\bombLocation[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"606F9F90"
    )
        port map (
      I0 => \bomb22__6\,
      I1 => \bomb12__6\,
      I2 => \RANDOMIZER_PROC.bomb2[4]_i_2_n_0\,
      I3 => \RANDOMIZER_PROC.bomb2[1]_i_4_n_0\,
      I4 => \RANDOMIZER_PROC.bomb2[1]_i_5_n_0\,
      O => \bombLocation[6]_i_1_n_0\
    );
\bombLocation[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6F60606F606F6F60"
    )
        port map (
      I0 => \bombLocation[7]_i_2_n_0\,
      I1 => \bombLocation[7]_i_3_n_0\,
      I2 => \RANDOMIZER_PROC.bomb2[4]_i_2_n_0\,
      I3 => \RANDOMIZER_PROC.bomb2[2]_i_3_n_0\,
      I4 => \RANDOMIZER_PROC.bomb2[2]_i_5_n_0\,
      I5 => \RANDOMIZER_PROC.bomb2[2]_i_4_n_0\,
      O => \bombLocation[7]_i_1_n_0\
    );
\bombLocation[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"28822828"
    )
        port map (
      I0 => \bomb12__6\,
      I1 => \bomb22__6\,
      I2 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      I3 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I4 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      O => \bombLocation[7]_i_2_n_0\
    );
\bombLocation[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"758AEF10"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      I1 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I2 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I3 => \RANDOMIZER_PROC.bomb2_reg_n_0_[2]\,
      I4 => \bomb22__6\,
      O => \bombLocation[7]_i_3_n_0\
    );
\bombLocation[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAA9A"
    )
        port map (
      I0 => \RANDOMIZER_PROC.bomb2_reg_n_0_[4]\,
      I1 => \RANDOMIZER_PROC.bomb2_reg_n_0_[2]\,
      I2 => \RANDOMIZER_PROC.bomb2Count_reg_n_0_[0]\,
      I3 => \RANDOMIZER_PROC.bomb2_reg_n_0_[0]\,
      I4 => \RANDOMIZER_PROC.bomb2_reg_n_0_[1]\,
      I5 => \RANDOMIZER_PROC.bomb2_reg_n_0_[3]\,
      O => \bombLocation[9]_i_1_n_0\
    );
\bombLocation_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => bomb3(0),
      Q => \bombLocation_reg[14]_0\(0)
    );
\bombLocation_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => data(0),
      Q => \bombLocation_reg[14]_0\(10)
    );
\bombLocation_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => data(1),
      Q => \bombLocation_reg[14]_0\(11)
    );
\bombLocation_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => data(2),
      Q => \bombLocation_reg[14]_0\(12)
    );
\bombLocation_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => data(3),
      Q => \bombLocation_reg[14]_0\(13)
    );
\bombLocation_reg[13]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \bombLocation[13]_i_2_n_0\,
      I1 => bomb10_in(3),
      O => data(3),
      S => bomb100
    );
\bombLocation_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => bomb100,
      Q => \bombLocation_reg[14]_0\(14)
    );
\bombLocation_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => bomb3(1),
      Q => \bombLocation_reg[14]_0\(1)
    );
\bombLocation_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => bomb3(2),
      Q => \bombLocation_reg[14]_0\(2)
    );
\bombLocation_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => bomb3(3),
      Q => \bombLocation_reg[14]_0\(3)
    );
\bombLocation_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => bomb3(4),
      Q => \bombLocation_reg[14]_0\(4)
    );
\bombLocation_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => \bombLocation[5]_i_1_n_0\,
      Q => \bombLocation_reg[14]_0\(5)
    );
\bombLocation_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => \bombLocation[6]_i_1_n_0\,
      Q => \bombLocation_reg[14]_0\(6)
    );
\bombLocation_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => \bombLocation[7]_i_1_n_0\,
      Q => \bombLocation_reg[14]_0\(7)
    );
\bombLocation_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => \bombLocation_reg[8]_i_1_n_0\,
      Q => \bombLocation_reg[14]_0\(8)
    );
\bombLocation_reg[8]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => bomb21_in(3),
      I1 => bomb20_in(3),
      O => \bombLocation_reg[8]_i_1_n_0\,
      S => \RANDOMIZER_PROC.bomb2[4]_i_2_n_0\
    );
\bombLocation_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bombLocation[14]_i_1_n_0\,
      CLR => btnU_IBUF,
      D => \bombLocation[9]_i_1_n_0\,
      Q => \bombLocation_reg[14]_0\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain is
  port (
    syncOut : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    \syncChain_reg[3]_0\ : in STD_LOGIC
  );
end SynchronizerChain;

architecture STRUCTURE of SynchronizerChain is
  signal MOVE_SYNC_gate_n_0 : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[0].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[0].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
MOVE_SYNC_gate: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_0\,
      O => MOVE_SYNC_gate_n_0
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => MOVE_SYNC_gate_n_0,
      Q => syncOut
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_0 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    \syncChain_reg[3]_1\ : out STD_LOGIC;
    \zeroMode__0\ : out STD_LOGIC;
    \syncChain_reg[3]_2\ : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    moveTracker117_out : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_13\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    moveTracker111_out : in STD_LOGIC;
    \FSM_sequential_currState_reg[0]\ : in STD_LOGIC;
    \FSM_sequential_currState_reg[0]_0\ : in STD_LOGIC;
    \FSM_sequential_currState_reg[0]_1\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_13_0\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_13_1\ : in STD_LOGIC;
    \syncChain_reg[3]_3\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_0 : entity is "SynchronizerChain";
end SynchronizerChain_0;

architecture STRUCTURE of SynchronizerChain_0 is
  signal \MOVE_SYNC_gate__9_n_0\ : STD_LOGIC;
  signal \MineSweep_inst/moveTracker114_out\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  signal \^syncchain_reg[3]_0\ : STD_LOGIC;
  signal \^syncchain_reg[3]_2\ : STD_LOGIC;
  signal \^zeromode__0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[10].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[10].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
  \syncChain_reg[3]_0\ <= \^syncchain_reg[3]_0\;
  \syncChain_reg[3]_2\ <= \^syncchain_reg[3]_2\;
  \zeroMode__0\ <= \^zeromode__0\;
\FSM_sequential_currState[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^syncchain_reg[3]_2\,
      I1 => \FSM_sequential_currState_reg[0]\,
      I2 => \FSM_sequential_currState_reg[0]_0\,
      I3 => \FSM_sequential_currState_reg[0]_1\,
      O => \^zeromode__0\
    );
\FSM_sequential_currState[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^syncchain_reg[3]_0\,
      I1 => \FSM_sequential_currState[1]_i_13_0\,
      I2 => \FSM_sequential_currState[1]_i_13\,
      I3 => \FSM_sequential_currState[1]_i_13_1\,
      O => \^syncchain_reg[3]_2\
    );
\FSM_sequential_currState[1]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222222222222220"
    )
        port map (
      I0 => \^syncchain_reg[3]_0\,
      I1 => Q(1),
      I2 => \^syncchain_reg[3]_2\,
      I3 => \FSM_sequential_currState_reg[0]\,
      I4 => \FSM_sequential_currState_reg[0]_0\,
      I5 => \FSM_sequential_currState_reg[0]_1\,
      O => \MineSweep_inst/moveTracker114_out\
    );
\FSM_sequential_currState[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAEAA"
    )
        port map (
      I0 => moveTracker117_out,
      I1 => \FSM_sequential_currState[1]_i_13\,
      I2 => Q(0),
      I3 => \^zeromode__0\,
      I4 => moveTracker111_out,
      I5 => \MineSweep_inst/moveTracker114_out\,
      O => \syncChain_reg[3]_1\
    );
\MOVE_SYNC_gate__9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_3\,
      O => \MOVE_SYNC_gate__9_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__9_n_0\,
      Q => \^syncchain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_1 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    moveTracker111_out : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_currState[1]_i_8\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_8_0\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_8_1\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_8_2\ : in STD_LOGIC;
    \syncChain_reg[3]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_1 : entity is "SynchronizerChain";
end SynchronizerChain_1;

architecture STRUCTURE of SynchronizerChain_1 is
  signal \MOVE_SYNC_gate__10_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  signal \^syncchain_reg[3]_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[11].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[11].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
  \syncChain_reg[3]_0\ <= \^syncchain_reg[3]_0\;
\FSM_sequential_currState[1]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222222222222220"
    )
        port map (
      I0 => \^syncchain_reg[3]_0\,
      I1 => Q(0),
      I2 => \FSM_sequential_currState[1]_i_8\,
      I3 => \FSM_sequential_currState[1]_i_8_0\,
      I4 => \FSM_sequential_currState[1]_i_8_1\,
      I5 => \FSM_sequential_currState[1]_i_8_2\,
      O => moveTracker111_out
    );
\MOVE_SYNC_gate__10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_1\,
      O => \MOVE_SYNC_gate__10_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__10_n_0\,
      Q => \^syncchain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_10 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    \syncChain_reg[3]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_10 : entity is "SynchronizerChain";
end SynchronizerChain_10;

architecture STRUCTURE of SynchronizerChain_10 is
  signal \MOVE_SYNC_gate__4_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[5].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[5].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
\MOVE_SYNC_gate__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_1\,
      O => \MOVE_SYNC_gate__4_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__4_n_0\,
      Q => \syncChain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_11 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    \syncChain_reg[3]_1\ : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    \FSM_sequential_currState[0]_i_2\ : in STD_LOGIC;
    \FSM_sequential_currState[0]_i_2_0\ : in STD_LOGIC;
    \FSM_sequential_currState[0]_i_2_1\ : in STD_LOGIC;
    \syncChain_reg[3]_2\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_11 : entity is "SynchronizerChain";
end SynchronizerChain_11;

architecture STRUCTURE of SynchronizerChain_11 is
  signal \MOVE_SYNC_gate__5_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  signal \^syncchain_reg[3]_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[6].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[6].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
  \syncChain_reg[3]_0\ <= \^syncchain_reg[3]_0\;
\FSM_sequential_currState[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^syncchain_reg[3]_0\,
      I1 => \FSM_sequential_currState[0]_i_2\,
      I2 => \FSM_sequential_currState[0]_i_2_0\,
      I3 => \FSM_sequential_currState[0]_i_2_1\,
      O => \syncChain_reg[3]_1\
    );
\MOVE_SYNC_gate__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_2\,
      O => \MOVE_SYNC_gate__5_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__5_n_0\,
      Q => \^syncchain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_12 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    \syncChain_reg[3]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_12 : entity is "SynchronizerChain";
end SynchronizerChain_12;

architecture STRUCTURE of SynchronizerChain_12 is
  signal \MOVE_SYNC_gate__6_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[7].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[7].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
\MOVE_SYNC_gate__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_1\,
      O => \MOVE_SYNC_gate__6_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__6_n_0\,
      Q => \syncChain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_13 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    \syncChain_reg[3]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_13 : entity is "SynchronizerChain";
end SynchronizerChain_13;

architecture STRUCTURE of SynchronizerChain_13 is
  signal \MOVE_SYNC_gate__7_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[8].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[8].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
\MOVE_SYNC_gate__7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_1\,
      O => \MOVE_SYNC_gate__7_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__7_n_0\,
      Q => \syncChain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_14 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    moveTracker117_out : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_currState[1]_i_8\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_8_0\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_8_1\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_8_2\ : in STD_LOGIC;
    \syncChain_reg[3]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_14 : entity is "SynchronizerChain";
end SynchronizerChain_14;

architecture STRUCTURE of SynchronizerChain_14 is
  signal \MOVE_SYNC_gate__8_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  signal \^syncchain_reg[3]_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[9].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[9].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
  \syncChain_reg[3]_0\ <= \^syncchain_reg[3]_0\;
\FSM_sequential_currState[1]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222222222222220"
    )
        port map (
      I0 => \^syncchain_reg[3]_0\,
      I1 => Q(0),
      I2 => \FSM_sequential_currState[1]_i_8\,
      I3 => \FSM_sequential_currState[1]_i_8_0\,
      I4 => \FSM_sequential_currState[1]_i_8_1\,
      I5 => \FSM_sequential_currState[1]_i_8_2\,
      O => moveTracker117_out
    );
\MOVE_SYNC_gate__8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_1\,
      O => \MOVE_SYNC_gate__8_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__8_n_0\,
      Q => \^syncchain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_2 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    \syncChain_reg[3]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_2 : entity is "SynchronizerChain";
end SynchronizerChain_2;

architecture STRUCTURE of SynchronizerChain_2 is
  signal \MOVE_SYNC_gate__11_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[12].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[12].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
\MOVE_SYNC_gate__11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_1\,
      O => \MOVE_SYNC_gate__11_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__11_n_0\,
      Q => \syncChain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_3 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    \syncChain_reg[3]_1\ : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_2\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \zeroMode__0\ : in STD_LOGIC;
    moveTracker17_out : in STD_LOGIC_VECTOR ( 0 to 0 );
    moveTracker12_out : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_7_0\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_7_1\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_7_2\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_7_3\ : in STD_LOGIC;
    \syncChain_reg[3]_2\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_3 : entity is "SynchronizerChain";
end SynchronizerChain_3;

architecture STRUCTURE of SynchronizerChain_3 is
  signal \MOVE_SYNC_gate__12_n_0\ : STD_LOGIC;
  signal \MineSweep_inst/moveTracker15_out\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  signal \^syncchain_reg[3]_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[13].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[13].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
  \syncChain_reg[3]_0\ <= \^syncchain_reg[3]_0\;
\FSM_sequential_currState[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAEAA"
    )
        port map (
      I0 => \MineSweep_inst/moveTracker15_out\,
      I1 => \FSM_sequential_currState[1]_i_2\,
      I2 => Q(0),
      I3 => \zeroMode__0\,
      I4 => moveTracker17_out(0),
      I5 => moveTracker12_out,
      O => \syncChain_reg[3]_1\
    );
\FSM_sequential_currState[1]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222222222222220"
    )
        port map (
      I0 => \^syncchain_reg[3]_0\,
      I1 => Q(1),
      I2 => \FSM_sequential_currState[1]_i_7_0\,
      I3 => \FSM_sequential_currState[1]_i_7_1\,
      I4 => \FSM_sequential_currState[1]_i_7_2\,
      I5 => \FSM_sequential_currState[1]_i_7_3\,
      O => \MineSweep_inst/moveTracker15_out\
    );
\MOVE_SYNC_gate__12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_2\,
      O => \MOVE_SYNC_gate__12_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__12_n_0\,
      Q => \^syncchain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_4 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    moveTracker12_out : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_currState[1]_i_7\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_7_0\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_7_1\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_7_2\ : in STD_LOGIC;
    \syncChain_reg[3]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_4 : entity is "SynchronizerChain";
end SynchronizerChain_4;

architecture STRUCTURE of SynchronizerChain_4 is
  signal \MOVE_SYNC_gate__13_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  signal \^syncchain_reg[3]_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[14].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[14].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
  \syncChain_reg[3]_0\ <= \^syncchain_reg[3]_0\;
\FSM_sequential_currState[1]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222222222222220"
    )
        port map (
      I0 => \^syncchain_reg[3]_0\,
      I1 => Q(0),
      I2 => \FSM_sequential_currState[1]_i_7\,
      I3 => \FSM_sequential_currState[1]_i_7_0\,
      I4 => \FSM_sequential_currState[1]_i_7_1\,
      I5 => \FSM_sequential_currState[1]_i_7_2\,
      O => moveTracker12_out
    );
\MOVE_SYNC_gate__13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_1\,
      O => \MOVE_SYNC_gate__13_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__13_n_0\,
      Q => \^syncchain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_5 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    moveTracker17_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    \syncChain_reg[3]_1\ : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_currState[1]_i_7\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_7_0\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_7_1\ : in STD_LOGIC;
    \FSM_sequential_currState[0]_i_2\ : in STD_LOGIC;
    \FSM_sequential_currState[0]_i_2_0\ : in STD_LOGIC;
    \FSM_sequential_currState[0]_i_2_1\ : in STD_LOGIC;
    \syncChain_reg[3]_2\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_5 : entity is "SynchronizerChain";
end SynchronizerChain_5;

architecture STRUCTURE of SynchronizerChain_5 is
  signal \MOVE_SYNC_gate__14_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  signal \^syncchain_reg[3]_0\ : STD_LOGIC;
  signal \^syncchain_reg[3]_1\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[15].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[15].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
  \syncChain_reg[3]_0\ <= \^syncchain_reg[3]_0\;
  \syncChain_reg[3]_1\ <= \^syncchain_reg[3]_1\;
\FSM_sequential_currState[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^syncchain_reg[3]_0\,
      I1 => \FSM_sequential_currState[0]_i_2\,
      I2 => \FSM_sequential_currState[0]_i_2_0\,
      I3 => \FSM_sequential_currState[0]_i_2_1\,
      O => \^syncchain_reg[3]_1\
    );
\FSM_sequential_currState[1]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222222222222220"
    )
        port map (
      I0 => \^syncchain_reg[3]_0\,
      I1 => Q(0),
      I2 => \FSM_sequential_currState[1]_i_7\,
      I3 => \^syncchain_reg[3]_1\,
      I4 => \FSM_sequential_currState[1]_i_7_0\,
      I5 => \FSM_sequential_currState[1]_i_7_1\,
      O => moveTracker17_out(0)
    );
\MOVE_SYNC_gate__14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_2\,
      O => \MOVE_SYNC_gate__14_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__14_n_0\,
      Q => \^syncchain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_6 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    \syncChain_reg[3]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_6 : entity is "SynchronizerChain";
end SynchronizerChain_6;

architecture STRUCTURE of SynchronizerChain_6 is
  signal \MOVE_SYNC_gate__0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[1].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[1].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
\MOVE_SYNC_gate__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_1\,
      O => \MOVE_SYNC_gate__0_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__0_n_0\,
      Q => \syncChain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_7 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    \syncChain_reg[3]_1\ : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    \FSM_sequential_currState[0]_i_2\ : in STD_LOGIC;
    syncOut : in STD_LOGIC;
    \FSM_sequential_currState[0]_i_2_0\ : in STD_LOGIC;
    \syncChain_reg[3]_2\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_7 : entity is "SynchronizerChain";
end SynchronizerChain_7;

architecture STRUCTURE of SynchronizerChain_7 is
  signal \MOVE_SYNC_gate__1_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  signal \^syncchain_reg[3]_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[2].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[2].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
  \syncChain_reg[3]_0\ <= \^syncchain_reg[3]_0\;
\FSM_sequential_currState[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^syncchain_reg[3]_0\,
      I1 => \FSM_sequential_currState[0]_i_2\,
      I2 => syncOut,
      I3 => \FSM_sequential_currState[0]_i_2_0\,
      O => \syncChain_reg[3]_1\
    );
\MOVE_SYNC_gate__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_2\,
      O => \MOVE_SYNC_gate__1_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__1_n_0\,
      Q => \^syncchain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_8 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    \syncChain_reg[3]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_8 : entity is "SynchronizerChain";
end SynchronizerChain_8;

architecture STRUCTURE of SynchronizerChain_8 is
  signal \MOVE_SYNC_gate__2_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[3].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[3].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
\MOVE_SYNC_gate__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_1\,
      O => \MOVE_SYNC_gate__2_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__2_n_0\,
      Q => \syncChain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SynchronizerChain_9 is
  port (
    \syncChain_reg[3]_0\ : out STD_LOGIC;
    sw_IBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    \syncChain_reg[3]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SynchronizerChain_9 : entity is "SynchronizerChain";
end SynchronizerChain_9;

architecture STRUCTURE of SynchronizerChain_9 is
  signal \MOVE_SYNC_gate__3_n_0\ : STD_LOGIC;
  signal \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\ : STD_LOGIC;
  signal \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[4].SynchronizerChain_inst/syncChain_reg ";
  attribute srl_name : string;
  attribute srl_name of \syncChain_reg[1]_srl2_MOVE_SYNC_c_0\ : label is "\MOVE_SYNC[4].SynchronizerChain_inst/syncChain_reg[1]_srl2_MOVE_SYNC_c_0 ";
begin
\MOVE_SYNC_gate__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      I1 => \syncChain_reg[3]_1\,
      O => \MOVE_SYNC_gate__3_n_0\
    );
\syncChain_reg[1]_srl2_MOVE_SYNC_c_0\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk_IBUF_BUFG,
      D => sw_IBUF(0),
      Q => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\
    );
\syncChain_reg[2]_MOVE_SYNC_c_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \syncChain_reg[1]_srl2_MOVE_SYNC_c_0_n_0\,
      Q => \syncChain_reg[2]_MOVE_SYNC_c_1_n_0\,
      R => '0'
    );
\syncChain_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \MOVE_SYNC_gate__3_n_0\,
      Q => \syncChain_reg[3]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TileDriver is
  port (
    \tiles_reg[15]_0\ : out STD_LOGIC_VECTOR ( 14 downto 0 );
    D : in STD_LOGIC_VECTOR ( 14 downto 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC
  );
end TileDriver;

architecture STRUCTURE of TileDriver is
begin
\tiles_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(9),
      Q => \tiles_reg[15]_0\(9)
    );
\tiles_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(10),
      Q => \tiles_reg[15]_0\(10)
    );
\tiles_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(11),
      Q => \tiles_reg[15]_0\(11)
    );
\tiles_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(12),
      Q => \tiles_reg[15]_0\(12)
    );
\tiles_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(13),
      Q => \tiles_reg[15]_0\(13)
    );
\tiles_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(14),
      Q => \tiles_reg[15]_0\(14)
    );
\tiles_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(0),
      Q => \tiles_reg[15]_0\(0)
    );
\tiles_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(1),
      Q => \tiles_reg[15]_0\(1)
    );
\tiles_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(2),
      Q => \tiles_reg[15]_0\(2)
    );
\tiles_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(3),
      Q => \tiles_reg[15]_0\(3)
    );
\tiles_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(4),
      Q => \tiles_reg[15]_0\(4)
    );
\tiles_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(5),
      Q => \tiles_reg[15]_0\(5)
    );
\tiles_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(6),
      Q => \tiles_reg[15]_0\(6)
    );
\tiles_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(7),
      Q => \tiles_reg[15]_0\(7)
    );
\tiles_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => D(8),
      Q => \tiles_reg[15]_0\(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MineSweep is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \syncChain_reg[3]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \tiles_reg[15]\ : out STD_LOGIC_VECTOR ( 14 downto 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    btnU_IBUF : in STD_LOGIC;
    \RANDOMIZER_PROC.bomb3Count_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \zeroMode__0\ : in STD_LOGIC;
    syncOut : in STD_LOGIC;
    \FSM_sequential_currState_reg[1]_0\ : in STD_LOGIC;
    \FSM_sequential_currState_reg[1]_1\ : in STD_LOGIC;
    \DETECT.moveTracker_reg[1]_0\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_2_0\ : in STD_LOGIC;
    \DETECT.moveTracker_reg[3]_0\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_2_1\ : in STD_LOGIC;
    \DETECT.moveTracker_reg[5]_0\ : in STD_LOGIC;
    \FSM_sequential_currState[1]_i_2_2\ : in STD_LOGIC;
    \DETECT.moveTracker_reg[7]_0\ : in STD_LOGIC;
    \DETECT.moveTracker_reg[8]_0\ : in STD_LOGIC;
    \DETECT.moveTracker_reg[9]_0\ : in STD_LOGIC;
    \DETECT.moveTracker_reg[10]_0\ : in STD_LOGIC;
    \DETECT.moveTracker_reg[11]_0\ : in STD_LOGIC;
    \DETECT.moveTracker_reg[12]_0\ : in STD_LOGIC;
    \DETECT.moveTracker_reg[13]_0\ : in STD_LOGIC;
    \DETECT.moveTracker_reg[14]_0\ : in STD_LOGIC;
    \DETECT.moveTracker_reg[15]_0\ : in STD_LOGIC
  );
end MineSweep;

architecture STRUCTURE of MineSweep is
  signal \DETECT.moveTracker_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[13]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[14]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg[9]_i_1_n_0\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg_n_0_[0]\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg_n_0_[1]\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg_n_0_[2]\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg_n_0_[3]\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg_n_0_[4]\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg_n_0_[5]\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg_n_0_[6]\ : STD_LOGIC;
  signal \DETECT.moveTracker_reg_n_0_[7]\ : STD_LOGIC;
  signal \FSM_sequential_currState[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_currState[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_currState[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_currState[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_currState[1]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_currState[1]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_currState[1]_i_6_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal bombLocation : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal currState : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gamePlayMode : STD_LOGIC;
  signal gamePlayMode_reg_i_1_n_0 : STD_LOGIC;
  signal moveTracker : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^syncchain_reg[3]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[0]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[0]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[0]_i_2\ : label is "soft_lutpair17";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[10]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[10]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[10]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[10]_i_2\ : label is "soft_lutpair27";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[11]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[11]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[11]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[11]_i_2\ : label is "soft_lutpair28";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[12]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[12]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[12]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[12]_i_2\ : label is "soft_lutpair29";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[13]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[13]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[13]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[13]_i_2\ : label is "soft_lutpair30";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[14]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[14]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[14]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[14]_i_2\ : label is "soft_lutpair31";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[15]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[15]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[15]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[15]_i_2\ : label is "soft_lutpair32";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[1]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[1]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[1]_i_2\ : label is "soft_lutpair18";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[2]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[2]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[2]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[2]_i_2\ : label is "soft_lutpair19";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[3]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[3]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[3]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[3]_i_2\ : label is "soft_lutpair20";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[4]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[4]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[4]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[4]_i_2\ : label is "soft_lutpair21";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[5]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[5]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[5]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[5]_i_2\ : label is "soft_lutpair22";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[6]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[6]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[6]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[6]_i_2\ : label is "soft_lutpair23";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[7]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[7]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[7]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[7]_i_2\ : label is "soft_lutpair24";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[8]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[8]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[8]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[8]_i_2\ : label is "soft_lutpair25";
  attribute XILINX_LEGACY_PRIM of \DETECT.moveTracker_reg[9]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \DETECT.moveTracker_reg[9]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[9]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \DETECT.moveTracker_reg[9]_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \FSM_sequential_currState[0]_i_1\ : label is "soft_lutpair33";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_currState_reg[0]\ : label is "waiting:00,playing:01,movedetected:10";
  attribute FSM_ENCODED_STATES of \FSM_sequential_currState_reg[1]\ : label is "waiting:00,playing:01,movedetected:10";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of gamePlayMode_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM of gamePlayMode_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of gamePlayMode_reg : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of gamePlayMode_reg_i_1 : label is "soft_lutpair33";
begin
  Q(0) <= \^q\(0);
  \syncChain_reg[3]\(7 downto 0) <= \^syncchain_reg[3]\(7 downto 0);
\DETECT.moveTracker_reg[0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[0]_i_1_n_0\,
      G => moveTracker(0),
      GE => '1',
      Q => \DETECT.moveTracker_reg_n_0_[0]\
    );
\DETECT.moveTracker_reg[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => syncOut,
      I1 => \DETECT.moveTracker_reg_n_0_[0]\,
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[0]_i_1_n_0\
    );
\DETECT.moveTracker_reg[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => syncOut,
      I2 => \DETECT.moveTracker_reg_n_0_[0]\,
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(0)
    );
\DETECT.moveTracker_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[10]_i_1_n_0\,
      G => moveTracker(10),
      GE => '1',
      Q => \^syncchain_reg[3]\(2)
    );
\DETECT.moveTracker_reg[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \DETECT.moveTracker_reg[10]_0\,
      I1 => \^syncchain_reg[3]\(2),
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[10]_i_1_n_0\
    );
\DETECT.moveTracker_reg[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \DETECT.moveTracker_reg[10]_0\,
      I2 => \^syncchain_reg[3]\(2),
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(10)
    );
\DETECT.moveTracker_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[11]_i_1_n_0\,
      G => moveTracker(11),
      GE => '1',
      Q => \^syncchain_reg[3]\(3)
    );
\DETECT.moveTracker_reg[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \DETECT.moveTracker_reg[11]_0\,
      I1 => \^syncchain_reg[3]\(3),
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[11]_i_1_n_0\
    );
\DETECT.moveTracker_reg[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \DETECT.moveTracker_reg[11]_0\,
      I2 => \^syncchain_reg[3]\(3),
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(11)
    );
\DETECT.moveTracker_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[12]_i_1_n_0\,
      G => moveTracker(12),
      GE => '1',
      Q => \^syncchain_reg[3]\(4)
    );
\DETECT.moveTracker_reg[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \DETECT.moveTracker_reg[12]_0\,
      I1 => \^syncchain_reg[3]\(4),
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[12]_i_1_n_0\
    );
\DETECT.moveTracker_reg[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \DETECT.moveTracker_reg[12]_0\,
      I2 => \^syncchain_reg[3]\(4),
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(12)
    );
\DETECT.moveTracker_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[13]_i_1_n_0\,
      G => moveTracker(13),
      GE => '1',
      Q => \^syncchain_reg[3]\(5)
    );
\DETECT.moveTracker_reg[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \DETECT.moveTracker_reg[13]_0\,
      I1 => \^syncchain_reg[3]\(5),
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[13]_i_1_n_0\
    );
\DETECT.moveTracker_reg[13]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \DETECT.moveTracker_reg[13]_0\,
      I2 => \^syncchain_reg[3]\(5),
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(13)
    );
\DETECT.moveTracker_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[14]_i_1_n_0\,
      G => moveTracker(14),
      GE => '1',
      Q => \^syncchain_reg[3]\(6)
    );
\DETECT.moveTracker_reg[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \DETECT.moveTracker_reg[14]_0\,
      I1 => \^syncchain_reg[3]\(6),
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[14]_i_1_n_0\
    );
\DETECT.moveTracker_reg[14]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \DETECT.moveTracker_reg[14]_0\,
      I2 => \^syncchain_reg[3]\(6),
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(14)
    );
\DETECT.moveTracker_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[15]_i_1_n_0\,
      G => moveTracker(15),
      GE => '1',
      Q => \^syncchain_reg[3]\(7)
    );
\DETECT.moveTracker_reg[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \DETECT.moveTracker_reg[15]_0\,
      I1 => \^syncchain_reg[3]\(7),
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[15]_i_1_n_0\
    );
\DETECT.moveTracker_reg[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \DETECT.moveTracker_reg[15]_0\,
      I2 => \^syncchain_reg[3]\(7),
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(15)
    );
\DETECT.moveTracker_reg[1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[1]_i_1_n_0\,
      G => moveTracker(1),
      GE => '1',
      Q => \DETECT.moveTracker_reg_n_0_[1]\
    );
\DETECT.moveTracker_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \DETECT.moveTracker_reg[1]_0\,
      I1 => \DETECT.moveTracker_reg_n_0_[1]\,
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[1]_i_1_n_0\
    );
\DETECT.moveTracker_reg[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \DETECT.moveTracker_reg[1]_0\,
      I2 => \DETECT.moveTracker_reg_n_0_[1]\,
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(1)
    );
\DETECT.moveTracker_reg[2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[2]_i_1_n_0\,
      G => moveTracker(2),
      GE => '1',
      Q => \DETECT.moveTracker_reg_n_0_[2]\
    );
\DETECT.moveTracker_reg[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \FSM_sequential_currState[1]_i_2_0\,
      I1 => \DETECT.moveTracker_reg_n_0_[2]\,
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[2]_i_1_n_0\
    );
\DETECT.moveTracker_reg[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \FSM_sequential_currState[1]_i_2_0\,
      I2 => \DETECT.moveTracker_reg_n_0_[2]\,
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(2)
    );
\DETECT.moveTracker_reg[3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[3]_i_1_n_0\,
      G => moveTracker(3),
      GE => '1',
      Q => \DETECT.moveTracker_reg_n_0_[3]\
    );
\DETECT.moveTracker_reg[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \DETECT.moveTracker_reg[3]_0\,
      I1 => \DETECT.moveTracker_reg_n_0_[3]\,
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[3]_i_1_n_0\
    );
\DETECT.moveTracker_reg[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \DETECT.moveTracker_reg[3]_0\,
      I2 => \DETECT.moveTracker_reg_n_0_[3]\,
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(3)
    );
\DETECT.moveTracker_reg[4]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[4]_i_1_n_0\,
      G => moveTracker(4),
      GE => '1',
      Q => \DETECT.moveTracker_reg_n_0_[4]\
    );
\DETECT.moveTracker_reg[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \FSM_sequential_currState[1]_i_2_1\,
      I1 => \DETECT.moveTracker_reg_n_0_[4]\,
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[4]_i_1_n_0\
    );
\DETECT.moveTracker_reg[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \FSM_sequential_currState[1]_i_2_1\,
      I2 => \DETECT.moveTracker_reg_n_0_[4]\,
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(4)
    );
\DETECT.moveTracker_reg[5]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[5]_i_1_n_0\,
      G => moveTracker(5),
      GE => '1',
      Q => \DETECT.moveTracker_reg_n_0_[5]\
    );
\DETECT.moveTracker_reg[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \DETECT.moveTracker_reg[5]_0\,
      I1 => \DETECT.moveTracker_reg_n_0_[5]\,
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[5]_i_1_n_0\
    );
\DETECT.moveTracker_reg[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \DETECT.moveTracker_reg[5]_0\,
      I2 => \DETECT.moveTracker_reg_n_0_[5]\,
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(5)
    );
\DETECT.moveTracker_reg[6]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[6]_i_1_n_0\,
      G => moveTracker(6),
      GE => '1',
      Q => \DETECT.moveTracker_reg_n_0_[6]\
    );
\DETECT.moveTracker_reg[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \FSM_sequential_currState[1]_i_2_2\,
      I1 => \DETECT.moveTracker_reg_n_0_[6]\,
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[6]_i_1_n_0\
    );
\DETECT.moveTracker_reg[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \FSM_sequential_currState[1]_i_2_2\,
      I2 => \DETECT.moveTracker_reg_n_0_[6]\,
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(6)
    );
\DETECT.moveTracker_reg[7]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[7]_i_1_n_0\,
      G => moveTracker(7),
      GE => '1',
      Q => \DETECT.moveTracker_reg_n_0_[7]\
    );
\DETECT.moveTracker_reg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \DETECT.moveTracker_reg[7]_0\,
      I1 => \DETECT.moveTracker_reg_n_0_[7]\,
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[7]_i_1_n_0\
    );
\DETECT.moveTracker_reg[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \DETECT.moveTracker_reg[7]_0\,
      I2 => \DETECT.moveTracker_reg_n_0_[7]\,
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(7)
    );
\DETECT.moveTracker_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[8]_i_1_n_0\,
      G => moveTracker(8),
      GE => '1',
      Q => \^syncchain_reg[3]\(0)
    );
\DETECT.moveTracker_reg[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \DETECT.moveTracker_reg[8]_0\,
      I1 => \^syncchain_reg[3]\(0),
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[8]_i_1_n_0\
    );
\DETECT.moveTracker_reg[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \DETECT.moveTracker_reg[8]_0\,
      I2 => \^syncchain_reg[3]\(0),
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(8)
    );
\DETECT.moveTracker_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \DETECT.moveTracker_reg[9]_i_1_n_0\,
      G => moveTracker(9),
      GE => '1',
      Q => \^syncchain_reg[3]\(1)
    );
\DETECT.moveTracker_reg[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \DETECT.moveTracker_reg[9]_0\,
      I1 => \^syncchain_reg[3]\(1),
      I2 => \zeroMode__0\,
      I3 => currState(0),
      I4 => \^q\(0),
      O => \DETECT.moveTracker_reg[9]_i_1_n_0\
    );
\DETECT.moveTracker_reg[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005D55"
    )
        port map (
      I0 => currState(0),
      I1 => \DETECT.moveTracker_reg[9]_0\,
      I2 => \^syncchain_reg[3]\(1),
      I3 => \zeroMode__0\,
      I4 => \^q\(0),
      O => moveTracker(9)
    );
\FSM_sequential_currState[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => \^q\(0),
      I1 => \zeroMode__0\,
      I2 => currState(0),
      I3 => \FSM_sequential_currState[1]_i_2_n_0\,
      O => \FSM_sequential_currState[0]_i_1_n_0\
    );
\FSM_sequential_currState[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => currState(0),
      I1 => \FSM_sequential_currState[1]_i_2_n_0\,
      O => \FSM_sequential_currState[1]_i_1_n_0\
    );
\FSM_sequential_currState[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \FSM_sequential_currState[1]_i_3_n_0\,
      I1 => \FSM_sequential_currState[1]_i_4_n_0\,
      I2 => \FSM_sequential_currState[1]_i_5_n_0\,
      I3 => \FSM_sequential_currState[1]_i_6_n_0\,
      I4 => \FSM_sequential_currState_reg[1]_0\,
      I5 => \FSM_sequential_currState_reg[1]_1\,
      O => \FSM_sequential_currState[1]_i_2_n_0\
    );
\FSM_sequential_currState[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40F04040"
    )
        port map (
      I0 => \DETECT.moveTracker_reg_n_0_[4]\,
      I1 => \FSM_sequential_currState[1]_i_2_1\,
      I2 => \zeroMode__0\,
      I3 => \DETECT.moveTracker_reg_n_0_[5]\,
      I4 => \DETECT.moveTracker_reg[5]_0\,
      O => \FSM_sequential_currState[1]_i_3_n_0\
    );
\FSM_sequential_currState[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40F04040"
    )
        port map (
      I0 => \DETECT.moveTracker_reg_n_0_[6]\,
      I1 => \FSM_sequential_currState[1]_i_2_2\,
      I2 => \zeroMode__0\,
      I3 => \DETECT.moveTracker_reg_n_0_[7]\,
      I4 => \DETECT.moveTracker_reg[7]_0\,
      O => \FSM_sequential_currState[1]_i_4_n_0\
    );
\FSM_sequential_currState[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40F04040"
    )
        port map (
      I0 => \DETECT.moveTracker_reg_n_0_[1]\,
      I1 => \DETECT.moveTracker_reg[1]_0\,
      I2 => \zeroMode__0\,
      I3 => \DETECT.moveTracker_reg_n_0_[0]\,
      I4 => syncOut,
      O => \FSM_sequential_currState[1]_i_5_n_0\
    );
\FSM_sequential_currState[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40F04040"
    )
        port map (
      I0 => \DETECT.moveTracker_reg_n_0_[2]\,
      I1 => \FSM_sequential_currState[1]_i_2_0\,
      I2 => \zeroMode__0\,
      I3 => \DETECT.moveTracker_reg_n_0_[3]\,
      I4 => \DETECT.moveTracker_reg[3]_0\,
      O => \FSM_sequential_currState[1]_i_6_n_0\
    );
\FSM_sequential_currState_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \FSM_sequential_currState[0]_i_1_n_0\,
      Q => currState(0)
    );
\FSM_sequential_currState_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => \FSM_sequential_currState[1]_i_1_n_0\,
      Q => \^q\(0)
    );
RANDOMIZER: entity work.Randomizer
     port map (
      E(0) => gamePlayMode,
      Q(1) => \^q\(0),
      Q(0) => currState(0),
      \bombLocation_reg[14]_0\(14 downto 0) => bombLocation(14 downto 0),
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG
    );
TileDriver_inst: entity work.TileDriver
     port map (
      D(14 downto 0) => bombLocation(14 downto 0),
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      \tiles_reg[15]_0\(14 downto 0) => \tiles_reg[15]\(14 downto 0)
    );
gamePlayMode_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => gamePlayMode_reg_i_1_n_0,
      G => \RANDOMIZER_PROC.bomb3Count_reg[1]\(0),
      GE => '1',
      Q => gamePlayMode
    );
gamePlayMode_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => currState(0),
      I1 => \^q\(0),
      O => gamePlayMode_reg_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MineSweepWrapper is
  port (
    clk : in STD_LOGIC;
    btnU : in STD_LOGIC;
    sw : in STD_LOGIC_VECTOR ( 15 downto 0 );
    led : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MineSweepWrapper : entity is true;
end MineSweepWrapper;

architecture STRUCTURE of MineSweepWrapper is
  signal \MOVE_SYNC[10].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[10].SynchronizerChain_inst_n_1\ : STD_LOGIC;
  signal \MOVE_SYNC[10].SynchronizerChain_inst_n_3\ : STD_LOGIC;
  signal \MOVE_SYNC[11].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[12].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[13].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[13].SynchronizerChain_inst_n_1\ : STD_LOGIC;
  signal \MOVE_SYNC[14].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[15].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[15].SynchronizerChain_inst_n_2\ : STD_LOGIC;
  signal \MOVE_SYNC[1].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[2].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[2].SynchronizerChain_inst_n_1\ : STD_LOGIC;
  signal \MOVE_SYNC[3].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[4].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[5].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[6].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[6].SynchronizerChain_inst_n_1\ : STD_LOGIC;
  signal \MOVE_SYNC[7].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[8].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal \MOVE_SYNC[9].SynchronizerChain_inst_n_0\ : STD_LOGIC;
  signal MOVE_SYNC_c_0_n_0 : STD_LOGIC;
  signal MOVE_SYNC_c_1_n_0 : STD_LOGIC;
  signal MOVE_SYNC_c_n_0 : STD_LOGIC;
  signal MineSweep_inst_n_0 : STD_LOGIC;
  signal MineSweep_inst_n_2 : STD_LOGIC;
  signal MineSweep_inst_n_3 : STD_LOGIC;
  signal MineSweep_inst_n_4 : STD_LOGIC;
  signal MineSweep_inst_n_5 : STD_LOGIC;
  signal MineSweep_inst_n_6 : STD_LOGIC;
  signal MineSweep_inst_n_7 : STD_LOGIC;
  signal MineSweep_inst_n_8 : STD_LOGIC;
  signal btnU_IBUF : STD_LOGIC;
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal currState : STD_LOGIC_VECTOR ( 1 to 1 );
  signal led_OBUF : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal moveTracker111_out : STD_LOGIC;
  signal moveTracker117_out : STD_LOGIC;
  signal moveTracker12_out : STD_LOGIC;
  signal moveTracker17_out : STD_LOGIC_VECTOR ( 15 to 15 );
  signal p_0_in : STD_LOGIC;
  signal sw_IBUF : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal syncOut : STD_LOGIC;
  signal \zeroMode__0\ : STD_LOGIC;
begin
\MOVE_SYNC[0].SynchronizerChain_inst\: entity work.SynchronizerChain
     port map (
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      sw_IBUF(0) => sw_IBUF(0),
      \syncChain_reg[3]_0\ => MOVE_SYNC_c_1_n_0,
      syncOut => syncOut
    );
\MOVE_SYNC[10].SynchronizerChain_inst\: entity work.SynchronizerChain_0
     port map (
      \FSM_sequential_currState[1]_i_13\ => \MOVE_SYNC[8].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState[1]_i_13_0\ => \MOVE_SYNC[11].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState[1]_i_13_1\ => \MOVE_SYNC[9].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState_reg[0]\ => \MOVE_SYNC[15].SynchronizerChain_inst_n_2\,
      \FSM_sequential_currState_reg[0]_0\ => \MOVE_SYNC[2].SynchronizerChain_inst_n_1\,
      \FSM_sequential_currState_reg[0]_1\ => \MOVE_SYNC[6].SynchronizerChain_inst_n_1\,
      Q(1) => MineSweep_inst_n_6,
      Q(0) => MineSweep_inst_n_8,
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      moveTracker111_out => moveTracker111_out,
      moveTracker117_out => moveTracker117_out,
      sw_IBUF(0) => sw_IBUF(10),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[10].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => \MOVE_SYNC[10].SynchronizerChain_inst_n_1\,
      \syncChain_reg[3]_2\ => \MOVE_SYNC[10].SynchronizerChain_inst_n_3\,
      \syncChain_reg[3]_3\ => MOVE_SYNC_c_1_n_0,
      \zeroMode__0\ => \zeroMode__0\
    );
\MOVE_SYNC[11].SynchronizerChain_inst\: entity work.SynchronizerChain_1
     port map (
      \FSM_sequential_currState[1]_i_8\ => \MOVE_SYNC[10].SynchronizerChain_inst_n_3\,
      \FSM_sequential_currState[1]_i_8_0\ => \MOVE_SYNC[15].SynchronizerChain_inst_n_2\,
      \FSM_sequential_currState[1]_i_8_1\ => \MOVE_SYNC[2].SynchronizerChain_inst_n_1\,
      \FSM_sequential_currState[1]_i_8_2\ => \MOVE_SYNC[6].SynchronizerChain_inst_n_1\,
      Q(0) => MineSweep_inst_n_5,
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      moveTracker111_out => moveTracker111_out,
      sw_IBUF(0) => sw_IBUF(11),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[11].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => MOVE_SYNC_c_1_n_0
    );
\MOVE_SYNC[12].SynchronizerChain_inst\: entity work.SynchronizerChain_2
     port map (
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      sw_IBUF(0) => sw_IBUF(12),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[12].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => MOVE_SYNC_c_1_n_0
    );
\MOVE_SYNC[13].SynchronizerChain_inst\: entity work.SynchronizerChain_3
     port map (
      \FSM_sequential_currState[1]_i_2\ => \MOVE_SYNC[12].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState[1]_i_7_0\ => \MOVE_SYNC[10].SynchronizerChain_inst_n_3\,
      \FSM_sequential_currState[1]_i_7_1\ => \MOVE_SYNC[15].SynchronizerChain_inst_n_2\,
      \FSM_sequential_currState[1]_i_7_2\ => \MOVE_SYNC[2].SynchronizerChain_inst_n_1\,
      \FSM_sequential_currState[1]_i_7_3\ => \MOVE_SYNC[6].SynchronizerChain_inst_n_1\,
      Q(1) => MineSweep_inst_n_3,
      Q(0) => MineSweep_inst_n_4,
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      moveTracker12_out => moveTracker12_out,
      moveTracker17_out(0) => moveTracker17_out(15),
      sw_IBUF(0) => sw_IBUF(13),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[13].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => \MOVE_SYNC[13].SynchronizerChain_inst_n_1\,
      \syncChain_reg[3]_2\ => MOVE_SYNC_c_1_n_0,
      \zeroMode__0\ => \zeroMode__0\
    );
\MOVE_SYNC[14].SynchronizerChain_inst\: entity work.SynchronizerChain_4
     port map (
      \FSM_sequential_currState[1]_i_7\ => \MOVE_SYNC[10].SynchronizerChain_inst_n_3\,
      \FSM_sequential_currState[1]_i_7_0\ => \MOVE_SYNC[15].SynchronizerChain_inst_n_2\,
      \FSM_sequential_currState[1]_i_7_1\ => \MOVE_SYNC[2].SynchronizerChain_inst_n_1\,
      \FSM_sequential_currState[1]_i_7_2\ => \MOVE_SYNC[6].SynchronizerChain_inst_n_1\,
      Q(0) => MineSweep_inst_n_2,
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      moveTracker12_out => moveTracker12_out,
      sw_IBUF(0) => sw_IBUF(14),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[14].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => MOVE_SYNC_c_1_n_0
    );
\MOVE_SYNC[15].SynchronizerChain_inst\: entity work.SynchronizerChain_5
     port map (
      \FSM_sequential_currState[0]_i_2\ => \MOVE_SYNC[14].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState[0]_i_2_0\ => \MOVE_SYNC[12].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState[0]_i_2_1\ => \MOVE_SYNC[13].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState[1]_i_7\ => \MOVE_SYNC[10].SynchronizerChain_inst_n_3\,
      \FSM_sequential_currState[1]_i_7_0\ => \MOVE_SYNC[2].SynchronizerChain_inst_n_1\,
      \FSM_sequential_currState[1]_i_7_1\ => \MOVE_SYNC[6].SynchronizerChain_inst_n_1\,
      Q(0) => p_0_in,
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      moveTracker17_out(0) => moveTracker17_out(15),
      sw_IBUF(0) => sw_IBUF(15),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[15].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => \MOVE_SYNC[15].SynchronizerChain_inst_n_2\,
      \syncChain_reg[3]_2\ => MOVE_SYNC_c_1_n_0
    );
\MOVE_SYNC[1].SynchronizerChain_inst\: entity work.SynchronizerChain_6
     port map (
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      sw_IBUF(0) => sw_IBUF(1),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[1].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => MOVE_SYNC_c_1_n_0
    );
\MOVE_SYNC[2].SynchronizerChain_inst\: entity work.SynchronizerChain_7
     port map (
      \FSM_sequential_currState[0]_i_2\ => \MOVE_SYNC[3].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState[0]_i_2_0\ => \MOVE_SYNC[1].SynchronizerChain_inst_n_0\,
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      sw_IBUF(0) => sw_IBUF(2),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[2].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => \MOVE_SYNC[2].SynchronizerChain_inst_n_1\,
      \syncChain_reg[3]_2\ => MOVE_SYNC_c_1_n_0,
      syncOut => syncOut
    );
\MOVE_SYNC[3].SynchronizerChain_inst\: entity work.SynchronizerChain_8
     port map (
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      sw_IBUF(0) => sw_IBUF(3),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[3].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => MOVE_SYNC_c_1_n_0
    );
\MOVE_SYNC[4].SynchronizerChain_inst\: entity work.SynchronizerChain_9
     port map (
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      sw_IBUF(0) => sw_IBUF(4),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[4].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => MOVE_SYNC_c_1_n_0
    );
\MOVE_SYNC[5].SynchronizerChain_inst\: entity work.SynchronizerChain_10
     port map (
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      sw_IBUF(0) => sw_IBUF(5),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[5].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => MOVE_SYNC_c_1_n_0
    );
\MOVE_SYNC[6].SynchronizerChain_inst\: entity work.SynchronizerChain_11
     port map (
      \FSM_sequential_currState[0]_i_2\ => \MOVE_SYNC[7].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState[0]_i_2_0\ => \MOVE_SYNC[4].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState[0]_i_2_1\ => \MOVE_SYNC[5].SynchronizerChain_inst_n_0\,
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      sw_IBUF(0) => sw_IBUF(6),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[6].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => \MOVE_SYNC[6].SynchronizerChain_inst_n_1\,
      \syncChain_reg[3]_2\ => MOVE_SYNC_c_1_n_0
    );
\MOVE_SYNC[7].SynchronizerChain_inst\: entity work.SynchronizerChain_12
     port map (
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      sw_IBUF(0) => sw_IBUF(7),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[7].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => MOVE_SYNC_c_1_n_0
    );
\MOVE_SYNC[8].SynchronizerChain_inst\: entity work.SynchronizerChain_13
     port map (
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      sw_IBUF(0) => sw_IBUF(8),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[8].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => MOVE_SYNC_c_1_n_0
    );
\MOVE_SYNC[9].SynchronizerChain_inst\: entity work.SynchronizerChain_14
     port map (
      \FSM_sequential_currState[1]_i_8\ => \MOVE_SYNC[10].SynchronizerChain_inst_n_3\,
      \FSM_sequential_currState[1]_i_8_0\ => \MOVE_SYNC[15].SynchronizerChain_inst_n_2\,
      \FSM_sequential_currState[1]_i_8_1\ => \MOVE_SYNC[2].SynchronizerChain_inst_n_1\,
      \FSM_sequential_currState[1]_i_8_2\ => \MOVE_SYNC[6].SynchronizerChain_inst_n_1\,
      Q(0) => MineSweep_inst_n_7,
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      moveTracker117_out => moveTracker117_out,
      sw_IBUF(0) => sw_IBUF(9),
      \syncChain_reg[3]_0\ => \MOVE_SYNC[9].SynchronizerChain_inst_n_0\,
      \syncChain_reg[3]_1\ => MOVE_SYNC_c_1_n_0
    );
MOVE_SYNC_c: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => '1',
      Q => MOVE_SYNC_c_n_0
    );
MOVE_SYNC_c_0: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => MOVE_SYNC_c_n_0,
      Q => MOVE_SYNC_c_0_n_0
    );
MOVE_SYNC_c_1: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => btnU_IBUF,
      D => MOVE_SYNC_c_0_n_0,
      Q => MOVE_SYNC_c_1_n_0
    );
MineSweep_inst: entity work.MineSweep
     port map (
      \DETECT.moveTracker_reg[10]_0\ => \MOVE_SYNC[10].SynchronizerChain_inst_n_0\,
      \DETECT.moveTracker_reg[11]_0\ => \MOVE_SYNC[11].SynchronizerChain_inst_n_0\,
      \DETECT.moveTracker_reg[12]_0\ => \MOVE_SYNC[12].SynchronizerChain_inst_n_0\,
      \DETECT.moveTracker_reg[13]_0\ => \MOVE_SYNC[13].SynchronizerChain_inst_n_0\,
      \DETECT.moveTracker_reg[14]_0\ => \MOVE_SYNC[14].SynchronizerChain_inst_n_0\,
      \DETECT.moveTracker_reg[15]_0\ => \MOVE_SYNC[15].SynchronizerChain_inst_n_0\,
      \DETECT.moveTracker_reg[1]_0\ => \MOVE_SYNC[1].SynchronizerChain_inst_n_0\,
      \DETECT.moveTracker_reg[3]_0\ => \MOVE_SYNC[3].SynchronizerChain_inst_n_0\,
      \DETECT.moveTracker_reg[5]_0\ => \MOVE_SYNC[5].SynchronizerChain_inst_n_0\,
      \DETECT.moveTracker_reg[7]_0\ => \MOVE_SYNC[7].SynchronizerChain_inst_n_0\,
      \DETECT.moveTracker_reg[8]_0\ => \MOVE_SYNC[8].SynchronizerChain_inst_n_0\,
      \DETECT.moveTracker_reg[9]_0\ => \MOVE_SYNC[9].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState[1]_i_2_0\ => \MOVE_SYNC[2].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState[1]_i_2_1\ => \MOVE_SYNC[4].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState[1]_i_2_2\ => \MOVE_SYNC[6].SynchronizerChain_inst_n_0\,
      \FSM_sequential_currState_reg[1]_0\ => \MOVE_SYNC[13].SynchronizerChain_inst_n_1\,
      \FSM_sequential_currState_reg[1]_1\ => \MOVE_SYNC[10].SynchronizerChain_inst_n_1\,
      Q(0) => MineSweep_inst_n_0,
      \RANDOMIZER_PROC.bomb3Count_reg[1]\(0) => currState(1),
      btnU_IBUF => btnU_IBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      \syncChain_reg[3]\(7) => p_0_in,
      \syncChain_reg[3]\(6) => MineSweep_inst_n_2,
      \syncChain_reg[3]\(5) => MineSweep_inst_n_3,
      \syncChain_reg[3]\(4) => MineSweep_inst_n_4,
      \syncChain_reg[3]\(3) => MineSweep_inst_n_5,
      \syncChain_reg[3]\(2) => MineSweep_inst_n_6,
      \syncChain_reg[3]\(1) => MineSweep_inst_n_7,
      \syncChain_reg[3]\(0) => MineSweep_inst_n_8,
      syncOut => syncOut,
      \tiles_reg[15]\(14 downto 0) => led_OBUF(15 downto 1),
      \zeroMode__0\ => \zeroMode__0\
    );
btnU_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => btnU,
      O => btnU_IBUF
    );
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
gamePlayMode_reg_i_3: unisim.vcomponents.BUFG
     port map (
      I => MineSweep_inst_n_0,
      O => currState(1)
    );
\led_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => led(0)
    );
\led_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(10),
      O => led(10)
    );
\led_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(11),
      O => led(11)
    );
\led_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(12),
      O => led(12)
    );
\led_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(13),
      O => led(13)
    );
\led_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(14),
      O => led(14)
    );
\led_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(15),
      O => led(15)
    );
\led_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(1),
      O => led(1)
    );
\led_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(2),
      O => led(2)
    );
\led_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(3),
      O => led(3)
    );
\led_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(4),
      O => led(4)
    );
\led_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(5),
      O => led(5)
    );
\led_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(6),
      O => led(6)
    );
\led_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(7),
      O => led(7)
    );
\led_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(8),
      O => led(8)
    );
\led_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led_OBUF(9),
      O => led(9)
    );
\sw_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(0),
      O => sw_IBUF(0)
    );
\sw_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(10),
      O => sw_IBUF(10)
    );
\sw_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(11),
      O => sw_IBUF(11)
    );
\sw_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(12),
      O => sw_IBUF(12)
    );
\sw_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(13),
      O => sw_IBUF(13)
    );
\sw_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(14),
      O => sw_IBUF(14)
    );
\sw_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(15),
      O => sw_IBUF(15)
    );
\sw_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(1),
      O => sw_IBUF(1)
    );
\sw_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(2),
      O => sw_IBUF(2)
    );
\sw_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(3),
      O => sw_IBUF(3)
    );
\sw_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(4),
      O => sw_IBUF(4)
    );
\sw_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(5),
      O => sw_IBUF(5)
    );
\sw_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(6),
      O => sw_IBUF(6)
    );
\sw_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(7),
      O => sw_IBUF(7)
    );
\sw_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(8),
      O => sw_IBUF(8)
    );
\sw_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sw(9),
      O => sw_IBUF(9)
    );
end STRUCTURE;
