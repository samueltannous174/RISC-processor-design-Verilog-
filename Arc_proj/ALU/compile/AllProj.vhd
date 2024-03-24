-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : ALU
-- Author      : Jihad Anfous
-- Company     : Birzeit University
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\samue\Downloads\Arc_proj\ALU\compile\AllProj.vhd
-- Generated   : Sun Jan 28 22:20:07 2024
-- From        : C:\Users\samue\Downloads\Arc_proj\ALU\src\AllProj.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

entity AllProj is 
end AllProj;

architecture AllProj of AllProj is

---- Component declarations -----

component \ALU\
  port(
       operandA : in STD_LOGIC_VECTOR(31 downto 0);
       operandB : in STD_LOGIC_VECTOR(31 downto 0);
       opcode : in STD_LOGIC_VECTOR(5 downto 0);
       result : out STD_LOGIC_VECTOR(31 downto 0);
       retReg : out STD_LOGIC_VECTOR(31 downto 0);
       zero : out STD_LOGIC;
       bgt : out STD_LOGIC;
       blt : out STD_LOGIC
  );
end component;
component Before_PC
  port(
       currentPC : in STD_LOGIC_VECTOR(31 downto 0);
       Imm26 : in STD_LOGIC_VECTOR(25 downto 0);
       Imm16 : in STD_LOGIC_VECTOR(15 downto 0);
       ExtOp : in STD_LOGIC;
       sel : in STD_LOGIC_VECTOR(1 downto 0);
       out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component DataMemory
  generic(
       MEM_DEPTH : integer := 16;
       Stack_Depth : integer := MEM_DEPTH/2
  );
  port(
       clk : in STD_LOGIC;
       MemAddr : in STD_LOGIC_VECTOR(31 downto 0);
       MemRD : in STD_LOGIC;
       MemWR : in STD_LOGIC;
       StackOP : in STD_LOGIC;
       stack_pointer : in STD_LOGIC_VECTOR(31 downto 0);
       MemDataIn : in STD_LOGIC_VECTOR(31 downto 0);
       MemDataOut : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component Extender
  port(
       immediate : in STD_LOGIC_VECTOR(15 downto 0);
       sign_extend : in STD_LOGIC;
       result : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component InstMemory
  port(
       addr : in STD_LOGIC_VECTOR(31 downto 0);
       instruction : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component \MUX2x1\
  port(
       a : in STD_LOGIC_VECTOR(31 downto 0);
       b : in STD_LOGIC_VECTOR(31 downto 0);
       select : in STD_LOGIC;
       y : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component ProgramCounter
  port(
       clk : in STD_LOGIC;
       nextAddress : in STD_LOGIC_VECTOR(31 downto 0);
       currentAddress : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component RegisterFile
  port(
       clk : in STD_LOGIC;
       read_registerA : in STD_LOGIC_VECTOR(3 downto 0);
       read_registerB : in STD_LOGIC_VECTOR(3 downto 0);
       write_register : in STD_LOGIC_VECTOR(3 downto 0);
       write_enable : in STD_LOGIC;
       write_data : in STD_LOGIC_VECTOR(31 downto 0);
       read_dataA : out STD_LOGIC_VECTOR(31 downto 0);
       read_dataB : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal BUS106 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS121 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS129 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS147 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS153 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS164 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS176 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS184 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS225 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS241 : STD_LOGIC_VECTOR(25 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

---- Declarations for Dangling outputs ----
signal DANGLING_U21_instruction_5 : STD_LOGIC;
signal DANGLING_U21_instruction_4 : STD_LOGIC;
signal DANGLING_U21_instruction_3 : STD_LOGIC;
signal DANGLING_U21_instruction_2 : STD_LOGIC;
signal DANGLING_U21_instruction_1 : STD_LOGIC;
signal DANGLING_U21_instruction_0 : STD_LOGIC;

begin

----  Component instantiations  ----

U14 : Before_PC
  port map(
       currentPC(31) => BUS147(31),
       currentPC(30) => BUS147(30),
       currentPC(29) => BUS147(29),
       currentPC(28) => BUS147(28),
       currentPC(27) => BUS147(27),
       currentPC(26) => BUS147(26),
       currentPC(25) => Dangling_Input_Signal,
       currentPC(24) => Dangling_Input_Signal,
       currentPC(23) => Dangling_Input_Signal,
       currentPC(22) => Dangling_Input_Signal,
       currentPC(21) => Dangling_Input_Signal,
       currentPC(20) => Dangling_Input_Signal,
       currentPC(19) => Dangling_Input_Signal,
       currentPC(18) => Dangling_Input_Signal,
       currentPC(17) => Dangling_Input_Signal,
       currentPC(16) => Dangling_Input_Signal,
       currentPC(15) => Dangling_Input_Signal,
       currentPC(14) => Dangling_Input_Signal,
       currentPC(13) => Dangling_Input_Signal,
       currentPC(12) => Dangling_Input_Signal,
       currentPC(11) => Dangling_Input_Signal,
       currentPC(10) => Dangling_Input_Signal,
       currentPC(9) => Dangling_Input_Signal,
       currentPC(8) => Dangling_Input_Signal,
       currentPC(7) => Dangling_Input_Signal,
       currentPC(6) => Dangling_Input_Signal,
       currentPC(5) => Dangling_Input_Signal,
       currentPC(4) => Dangling_Input_Signal,
       currentPC(3) => Dangling_Input_Signal,
       currentPC(2) => Dangling_Input_Signal,
       currentPC(1) => Dangling_Input_Signal,
       currentPC(0) => Dangling_Input_Signal,
       Imm26 => BUS241,
       Imm16(15) => BUS241(17),
       Imm16(14) => BUS241(16),
       Imm16(13) => BUS241(15),
       Imm16(12) => BUS241(14),
       Imm16(11) => BUS241(13),
       Imm16(10) => BUS241(12),
       Imm16(9) => BUS241(11),
       Imm16(8) => BUS241(10),
       Imm16(7) => BUS241(9),
       Imm16(6) => BUS241(8),
       Imm16(5) => BUS241(7),
       Imm16(4) => BUS241(6),
       Imm16(3) => BUS241(5),
       Imm16(2) => BUS241(4),
       Imm16(1) => BUS241(3),
       Imm16(0) => BUS241(2),
       ExtOp => Dangling_Input_Signal,
       sel(1) => Dangling_Input_Signal,
       sel(0) => Dangling_Input_Signal,
       out => BUS225
  );

U15 : DataMemory
  port map(
       clk => Dangling_Input_Signal,
       MemAddr => BUS164,
       MemRD => Dangling_Input_Signal,
       MemWR => Dangling_Input_Signal,
       StackOP => Dangling_Input_Signal,
       stack_pointer(31) => Dangling_Input_Signal,
       stack_pointer(30) => Dangling_Input_Signal,
       stack_pointer(29) => Dangling_Input_Signal,
       stack_pointer(28) => Dangling_Input_Signal,
       stack_pointer(27) => Dangling_Input_Signal,
       stack_pointer(26) => Dangling_Input_Signal,
       stack_pointer(25) => Dangling_Input_Signal,
       stack_pointer(24) => Dangling_Input_Signal,
       stack_pointer(23) => Dangling_Input_Signal,
       stack_pointer(22) => Dangling_Input_Signal,
       stack_pointer(21) => Dangling_Input_Signal,
       stack_pointer(20) => Dangling_Input_Signal,
       stack_pointer(19) => Dangling_Input_Signal,
       stack_pointer(18) => Dangling_Input_Signal,
       stack_pointer(17) => Dangling_Input_Signal,
       stack_pointer(16) => Dangling_Input_Signal,
       stack_pointer(15) => Dangling_Input_Signal,
       stack_pointer(14) => Dangling_Input_Signal,
       stack_pointer(13) => Dangling_Input_Signal,
       stack_pointer(12) => Dangling_Input_Signal,
       stack_pointer(11) => Dangling_Input_Signal,
       stack_pointer(10) => Dangling_Input_Signal,
       stack_pointer(9) => Dangling_Input_Signal,
       stack_pointer(8) => Dangling_Input_Signal,
       stack_pointer(7) => Dangling_Input_Signal,
       stack_pointer(6) => Dangling_Input_Signal,
       stack_pointer(5) => Dangling_Input_Signal,
       stack_pointer(4) => Dangling_Input_Signal,
       stack_pointer(3) => Dangling_Input_Signal,
       stack_pointer(2) => Dangling_Input_Signal,
       stack_pointer(1) => Dangling_Input_Signal,
       stack_pointer(0) => Dangling_Input_Signal,
       MemDataIn => BUS121,
       MemDataOut => BUS176
  );

U18 : Extender
  port map(
       immediate(15) => BUS241(17),
       immediate(14) => BUS241(16),
       immediate(13) => BUS241(15),
       immediate(12) => BUS241(14),
       immediate(11) => BUS241(13),
       immediate(10) => BUS241(12),
       immediate(9) => BUS241(11),
       immediate(8) => BUS241(10),
       immediate(7) => BUS241(9),
       immediate(6) => BUS241(8),
       immediate(5) => BUS241(7),
       immediate(4) => BUS241(6),
       immediate(3) => BUS241(5),
       immediate(2) => BUS241(4),
       immediate(1) => BUS241(3),
       immediate(0) => BUS241(2),
       sign_extend => Dangling_Input_Signal,
       result => BUS153
  );

U21 : InstMemory
  port map(
       addr => BUS147,
       instruction(31) => BUS241(25),
       instruction(30) => BUS241(24),
       instruction(29) => BUS241(23),
       instruction(28) => BUS241(22),
       instruction(27) => BUS241(21),
       instruction(26) => BUS241(20),
       instruction(25) => BUS241(19),
       instruction(24) => BUS241(18),
       instruction(23) => BUS241(17),
       instruction(22) => BUS241(16),
       instruction(21) => BUS241(15),
       instruction(20) => BUS241(14),
       instruction(19) => BUS241(13),
       instruction(18) => BUS241(12),
       instruction(17) => BUS241(11),
       instruction(16) => BUS241(10),
       instruction(15) => BUS241(9),
       instruction(14) => BUS241(8),
       instruction(13) => BUS241(7),
       instruction(12) => BUS241(6),
       instruction(11) => BUS241(5),
       instruction(10) => BUS241(4),
       instruction(9) => BUS241(3),
       instruction(8) => BUS241(2),
       instruction(7) => BUS241(1),
       instruction(6) => BUS241(0),
       instruction(5) => DANGLING_U21_instruction_5,
       instruction(4) => DANGLING_U21_instruction_4,
       instruction(3) => DANGLING_U21_instruction_3,
       instruction(2) => DANGLING_U21_instruction_2,
       instruction(1) => DANGLING_U21_instruction_1,
       instruction(0) => DANGLING_U21_instruction_0
  );

U25 : \MUX2x1\
  port map(
       a => BUS164,
       b => BUS176,
       select => Dangling_Input_Signal,
       y => BUS184
  );

U26 : \MUX2x1\
  port map(
       a => BUS121,
       b => BUS153,
       select => Dangling_Input_Signal,
       y => BUS129
  );

U4 : ProgramCounter
  port map(
       clk => Dangling_Input_Signal,
       nextAddress => BUS225,
       currentAddress => BUS147
  );

U5 : RegisterFile
  port map(
       clk => Dangling_Input_Signal,
       read_registerA(3) => BUS241(21),
       read_registerA(2) => BUS241(20),
       read_registerA(1) => BUS241(19),
       read_registerA(0) => BUS241(18),
       read_registerB(3) => BUS241(17),
       read_registerB(2) => BUS241(16),
       read_registerB(1) => BUS241(15),
       read_registerB(0) => BUS241(14),
       write_register(3) => BUS241(25),
       write_register(2) => BUS241(24),
       write_register(1) => BUS241(23),
       write_register(0) => BUS241(22),
       write_enable => Dangling_Input_Signal,
       write_data => BUS184,
       read_dataA => BUS106,
       read_dataB => BUS121
  );

U6 : \ALU\
  port map(
       operandA => BUS106,
       operandB => BUS129,
       opcode(5) => BUS147(31),
       opcode(4) => BUS147(30),
       opcode(3) => BUS147(29),
       opcode(2) => BUS147(28),
       opcode(1) => BUS147(27),
       opcode(0) => BUS147(26),
       result => BUS164
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end AllProj;
