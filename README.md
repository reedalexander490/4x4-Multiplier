# 4 Bit Multiplier

**Authors:** Alexander Reed, Hugo Paulino Korte  
**Course:** ECE 499  
**Lab Design Project**

## Module Documentation

### Finite State Machine

**Description:**  
The finite state machine (FSM) acts as a controller for the different modules of the multiplier. We are using a Moore FSM, where the output is based on the current state. The case statement in the module code demonstrates that it is a Moore FSM, as it only changes state when the previous state is active.

**State Diagram:**  
<img width="377" height="362" alt="image" src="https://github.com/user-attachments/assets/4257606d-39d1-4135-8683-1ec71dce2491" />

**Output:**  
<img width="496" height="229" alt="image" src="https://github.com/user-attachments/assets/be97f92c-50e4-4bcc-9e6a-b80f3a2358b5" />

**Testbench:**  
<img width="526" height="741" alt="image" src="https://github.com/user-attachments/assets/5efb66cf-ca6f-4e72-b8db-58a9a32a8bef" />

**Module Code:**  
<img width="418" height="721" alt="image" src="https://github.com/user-attachments/assets/7431f1fc-0d4e-41ee-8e55-b20868cb93ec" />

**Genus:**  
<img width="726" height="308" alt="image" src="https://github.com/user-attachments/assets/ef3b628d-68b6-47d2-9210-7c008905b1bb" />

**Reports:**  
<img width="471" height="455" alt="image" src="https://github.com/user-attachments/assets/3b4e2209-69f6-4310-abb0-8c1aa9adda54" />
<img width="491" height="259" alt="image" src="https://github.com/user-attachments/assets/ade13619-6f7a-4cc7-81ad-269b79929af2" />

---

### Serial In Parallel Out

**Description:**  
The Serial In Parallel Out (SIPO) block takes in serial data, one bit per clock cycle. The first four bits are loaded into the A output, and the second four are loaded into the B output. The module is controlled by the `shift_enable` signal. When `shift_enable` is high, the module loads data; when low, it prevents data loading to avoid timing issues and data overlap. The module was tested by resetting it, feeding it serial data, and enabling the `shift_enable` flag, which allowed the module to parallelize the data.

**Output:**  
<img width="726" height="426" alt="image" src="https://github.com/user-attachments/assets/3489d344-c8eb-4e87-af23-e4767d9e6d51" />

**Code:**  
<img width="425" height="476" alt="image" src="https://github.com/user-attachments/assets/60adb259-7016-41b9-98e6-4355e6a000f5" />
<img width="430" height="455" alt="image" src="https://github.com/user-attachments/assets/649d3ca8-293a-45d8-942c-84357bc7479d" />

**Symbol:**  
<img width="436" height="187" alt="image" src="https://github.com/user-attachments/assets/74b19e2f-6a29-4366-bbea-c53f6a1f4a6c" />


**Genus:**  
<img width="365" height="193" alt="image" src="https://github.com/user-attachments/assets/7e5662ef-6542-445c-b1d0-fa47af35d6ee" />

**Reports:**  
<img width="479" height="327" alt="image" src="https://github.com/user-attachments/assets/44e7e93e-16ba-4b22-930b-d93a839aaafc" />
<img width="474" height="193" alt="image" src="https://github.com/user-attachments/assets/ae26f226-39af-4f74-9938-e88450e0ea1c" />


---

### Parallel In Serial Out

**Description:**  
The Parallel In Serial Out (PISO) takes in 8-bit parallel data from the multiplier, along with control signals from the FSM. When the PISO receives the `done` signal, it knows that the multiplier has finished computing and is ready to provide output. Once the module has both `data_in` and `done`, it outputs the data bitwise, one bit per clock cycle. The `done` signal is also passed to the user to indicate when the multiplier will send data.

**Output:**  
<img width="727" height="89" alt="image" src="https://github.com/user-attachments/assets/79cba72d-b7d9-4919-80c8-2aa00fc4de2b" />


**Symbol:**  
<img width="727" height="264" alt="image" src="https://github.com/user-attachments/assets/b76f1ab1-4d58-4bca-a76d-aacdaa1cc4b2" />


**Code:**  
<img width="435" height="268" alt="image" src="https://github.com/user-attachments/assets/92efde44-4ee0-47bd-899a-005092470e2e" />
<img width="348" height="316" alt="image" src="https://github.com/user-attachments/assets/5cf3bd78-58e3-429d-97df-e78db572f826" />


**Genus:**  
<img width="726" height="161" alt="image" src="https://github.com/user-attachments/assets/81e2db48-4e78-4141-b832-0b4207c2d7d3" />


**Reports:**  
<img width="477" height="366" alt="image" src="https://github.com/user-attachments/assets/56b289c3-d49c-4394-b098-2cfc4594ce97" />
<img width="502" height="186" alt="image" src="https://github.com/user-attachments/assets/362cf87c-4478-4776-9809-1d695c537fa9" />


---

### 4x4 Multiplier

**Description:**  
This block multiplies two four-bit inputs and outputs an 8-bit result. We are using a Moore FSM, as evidenced by the fact that the next state is based on the previous case.

**Output:**  
<img width="727" height="322" alt="image" src="https://github.com/user-attachments/assets/7800eb48-a734-4340-bae8-f6402caac1fc" />


**Testbench:**  
<img width="574" height="402" alt="image" src="https://github.com/user-attachments/assets/ae1c301a-f441-4d57-8ceb-5ed386dcf123" />

**Module Code:**  
<img width="483" height="699" alt="image" src="https://github.com/user-attachments/assets/1c3f4663-d342-4e54-aeb5-8b7dcd9061ee" />
<img width="472" height="683" alt="image" src="https://github.com/user-attachments/assets/d33b257f-416e-4ed7-b5e9-85e85e154f68" />


**Symbol:**  
<img width="581" height="126" alt="image" src="https://github.com/user-attachments/assets/fb31e99e-94ae-4a3c-85c0-f50f2812d27e" />


**Genus:**  
<img width="386" height="404" alt="image" src="https://github.com/user-attachments/assets/2d1f6a54-7d20-43d0-bfa3-23496bd50af9" />

**Reports:**  
<img width="549" height="265" alt="image" src="https://github.com/user-attachments/assets/3d15673d-042e-412f-a0cc-440705aac635" />
<img width="494" height="376" alt="image" src="https://github.com/user-attachments/assets/7653775d-09b3-4ae0-8450-bcaaeb022458" />
<img width="587" height="276" alt="image" src="https://github.com/user-attachments/assets/64620339-8f19-4590-b543-601db7052913" />

---

### Top Level

**Description:**  
The top-level block diagram of the module contains the Serial to Parallel, the 4x4 Multiplier, the Parallel to Serial, and the Finite State Machine. The FSM is a Moore-type machine that controls the other three modules based on combinational logic. The block is designed by incorporating all Verilog files and their dependencies into a single file before synthesizing and running the Place and Route (PNR). This simplifies the netlisting process and ensures that all dependencies are correctly generated using primitives from the standard cell library.

<img width="375" height="160" alt="image" src="https://github.com/user-attachments/assets/014e529b-5e29-4c29-b47c-c90a70d927c0" />

**Output:**  
<img width="578" height="286" alt="image" src="https://github.com/user-attachments/assets/25a1f8aa-c373-44a5-8a00-d8cc65c7988f" />

**Testbench:**  
<img width="323" height="459" alt="image" src="https://github.com/user-attachments/assets/224aa245-f1de-425d-b776-a8e96026f800" />


**Module Code:**  
<img width="430" height="470" alt="image" src="https://github.com/user-attachments/assets/2f553654-abc0-4905-9af3-9dea035aea6e" />

**Genus:**  
<img width="583" height="358" alt="image" src="https://github.com/user-attachments/assets/0adcf1e3-61eb-4113-ad38-843c9890f815" />


**Report:**  
<img width="370" height="318" alt="image" src="https://github.com/user-attachments/assets/03cf219c-8b2d-418b-b658-717352006474" />
<img width="412" height="205" alt="image" src="https://github.com/user-attachments/assets/faf27f20-c885-413e-ad64-24727289862e" />


---

## Challenges and Improvements Going Forward

### Challenges:
The primary challenge encountered was managing dependencies due to different file structures between our computers, leading to compatibility issues with netlists and primitives. Additionally, we faced challenges with refactoring, particularly with the Serial In Parallel Out module, which was not compatible with the multiplier module due to unsynchronized data.

### Going Forward:
To address these challenges, we would consolidate the design onto one computer to resolve file structure issues. We would also invest more time in the initial design stage to ensure compatibility before simulation, as logic errors are easier to catch than compatibility errors. Furthermore, we would switch to a synchronous finite-state machine to avoid unconstrained timing paths, which require manual path exception handling.

---

## Non-Ideal Clock Simulation

To simulate the circuit's behavior under real conditions, we ran the circuit with target clock frequencies of 10%, 80%, and 120% of fmax.

**Clock Period Calculation:**  
Clock Period = (Data Path Delay) + (Slack) = 1629 ps + 3988 ps = 5617 ps  
Fmax = (1/T) = 5617 ps ≈ 178 MHz

### 10% fmax (17.8 MHz)
When running the module at 10% fmax, the output remains consistent with our top module running at the maximum frequency. This is due to the asynchronous nature of our module, which relies on combinational logic for state changes rather than purely clock-based transitions. The timing report generated by Genus indicates that the circuit operates slower at reduced clock speeds, but this configuration saves power as switching losses are minimized.

### 80% fmax (142.4 MHz)
At 80% fmax, the output is similar to the ideal version of the module, albeit 20% slower. However, this configuration is more power-efficient, demonstrating a balance between performance and energy consumption.

### 120% fmax (213.6 MHz)
Running the module at 120% fmax results in violations, as the clock speed exceeds the logic's ability to keep up. This configuration also leads to increased power losses due to faster switching. Therefore, we do not recommend operating the circuit at 120% fmax.

---

## Place and Route

**Required Design Area:**  
The required design area for the IC is approximately (32 µm)². The necessary I/O includes a start signal, data input, reset, clock (clk), data output, and a done signal.
