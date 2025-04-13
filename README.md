# 4-Bit Serial Multiplier Project

This repository contains the Verilog implementation of a 4-bit serial-in, serial-out multiplier designed and implemented as part of the ECE 499 Lab Design Project by Alexander Reed and Hugo Paulino Korte.

##  Overview

The design performs multiplication of two 4-bit numbers, producing an 8-bit result. It includes the following custom modules:

- **Finite State Machine (FSM)**: A Moore machine to control all other modules.
- **Serial-In Parallel-Out (SIPO)**: Loads two 4-bit operands serially and outputs them in parallel.
- **4x4 Multiplier**: Computes the product of the two 4-bit inputs.
- **Parallel-In Serial-Out (PISO)**: Outputs the 8-bit result serially after computation.
- **Top-Level Module**: Integrates all submodules and handles control flow and I/O.

##  Modules

### Finite State Machine (FSM)
Controls data flow and state transitions based on a Moore architecture. State transitions depend only on the previous state.

### Serial-In Parallel-Out (SIPO)
Receives 8 bits of serial input, splits them into two 4-bit outputs (A and B). Controlled via a `shift_enable` signal.

### 4x4 Multiplier
Takes parallel 4-bit inputs from the SIPO and computes an 8-bit result.

### Parallel-In Serial-Out (PISO)
Outputs the 8-bit product serially once the FSM signals that computation is complete via a `done` flag.

## Tools Used

- **Verilog HDL** for module implementation
- **Cadence Genus** for synthesis and timing analysis
- **Simulation** for various clock rates to test real-world behavior

##  Challenges and Lessons

- **File Structure Compatibility**: Differences in local setups caused netlist and primitive dependency issues.
- **Refactoring Delays**: Incompatibility between the SIPO and multiplier module required late-stage rewrites.
- **FSM Design**: Future iterations will consider using a synchronous FSM to better constrain timing.

## Clock Performance Testing

Simulations were run at different clock frequencies to test the behavior under real-world conditions:

- **10% fmax (~17.8 MHz)**: Fully functional, lower power consumption
- **80% fmax (~142.4 MHz)**: Stable and efficient
- **120% fmax (~213.6 MHz)**: Timing violations occurred, not recommended

##  Place and Route

- **Area Estimate**: Approximately (32 µm)²
- **I/O Ports**: `start`, `data_in`, `clk`, `reset`, `done`, `data_out`

## Reports and Testing

- Detailed synthesis and timing reports were generated using Cadence Genus.
- Each module includes individual testbenches and simulation verification.

---

##  Authors

- Alexander Reed  
- Hugo Paulino Korte

##  License

This project is for academic and educational purposes. Please contact the authors for reuse or collaboration.

