# VHDL Fixed-Point Multiply-Accumulate (MAC) Unit

A synthesizable, parameterized Fixed-Point Multiply-Accumulate (MAC) architecture designed in VHDL, targeting FPGA-accelerated mathematical operations and DSP pipelines.

## 🛠️ Architecture & Features
* **Operation:** Computes $Count = \sum (n1 \times n2)$ on each rising clock edge using a combination of sequential accumulation and combinational multiplication.
* **Parameterized Widths:** Configurable input bit-width (`WIDTH`, default 8-bit) using `signed` arithmetic from `ieee.numeric_std`.
* **Bit-Growth & Overflow Guarding:** 
  * Combinational multiplier expands output to $2 \times \text{WIDTH}$ (16-bit default) to prevent product truncation.
  * Accumulator register incorporates **4 guard bits** (total width: $2 \times \text{WIDTH} + 4$, or 20-bit default) using explicit `resize()` casting to prevent overflow during consecutive accumulations.
* **Synchronous Active-High Reset:** Resets the running total accumulator signal `accum` to zero on `reset = '1'`.

## 📁 Repository Structure
```text
├── rtl/      # Core VHDL source files (MAC datapath)
├── tb/       # Testbench files and test vector stimuli
├── docs/     # Simulation waveforms and documentation
└── README.md
```

## 🛠️ Tools Used
* **Language:** VHDL (`ieee.std_logic_1164`, `ieee.numeric_std`)
* **Simulation & Verification:** QuestaSim / ModelSim

## 📊 Functional Verification

The datapath was functionally verified using custom VHDL testbenches in **QuestaSim**.

Below is the simulation waveform illustrating consecutive multiplication and accumulation cycles, verifying proper accumulator reset, clock timing, and numerical stability:

![MAC Simulation Waveform](./docs/mac_unit_tb_wf.png)
