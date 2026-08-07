# VHDL Fixed-Point Multiply-Accumulate (MAC) Unit

A synthesizable, parameterized Fixed-Point Multiply-Accumulate (MAC) architecture designed in VHDL, targeting FPGA-accelerated mathematical operations and DSP pipelines.

## 🛠️ Architecture & Features
* **Operation:** Computes Y = sum(A * B) + Y_prev on every clock cycle with synchronous control logic.
* **Fixed-Point Precision:** Implements parameterized bit-width configurations (`generic` map) for flexible datapath width and numerical precision control.
* **Synchronous Datapath:** Includes active-high reset (`rst`), clock enable (`en`), and accumulator register handling to prevent wraparound errors during repeated additions.
* **Coding Standard:** Written using pure IEEE `numeric_std` packages for standard synthesizable RTL design.

## 📁 Repository Structure
```text
├── rtl/      # Core VHDL source files (MAC datapath)
├── tb/       # Testbench files and test vector stimuli
├── docs/     # Simulation waveforms and documentation
└── README.md
```
