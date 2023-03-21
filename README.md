# RISC-V
## Introduction
Implementation of a 32-bit single-cycle microarchitecture RISC-V processor based on Harvard Architecture using Verilog HDL.
The simulation was performed on Modelsim to run two programs the first is Fibonacci series & second is counter written with C language and compiled into machine code. 
The synthesis was done on Intel® Quartus Prime and implemented on Cyclone® IV FPGA and testing counter program on FPGA through Bluetooth module connected with it and mobile phone via UART module.
![Screenshot (285)](https://user-images.githubusercontent.com/102371006/224100404-f1938d91-d56d-44b3-8e47-51e2041fcc7b.png)

## RTL view of Top Module:
![Screenshot (280)](https://user-images.githubusercontent.com/102371006/224103119-f3aefa26-e7e3-4a31-aa27-e14bc2363b08.png)

## Main Modules:
### 1- ALU
### 2- Program counter calculation circuit
### 3- Register File
### 4- Data Memory
### 5- Instruction memory
### 6- Control Unit

## Other modules:
### 1- Sign extension unit
### 2- (32-1) Multiplexer

## Modelsim Results of Fibonacci series:
![Screenshot (281)](https://user-images.githubusercontent.com/102371006/224440190-656529c8-9807-44c1-aac6-689438f7d744.png)

## Modelsim Results of Counter:
![Screenshot (302)](https://user-images.githubusercontent.com/102371006/226504580-5b725a8a-2bb6-4960-b5e8-f5a3fd0b6360.png)

## Testing on FPGA:
![Screenshot (303)](https://user-images.githubusercontent.com/102371006/226596212-a050aafe-1071-4f6b-8e61-1970d1a2a755.png)


