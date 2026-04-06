# TRM Architecture

**TRM Architecture** is an experimental 4-core CPU architecture project. It includes a custom instruction set, pipeline, memory management, and educational firmware (TSBIOS) with a bootloader.

This project is designed for learning and experimentation with low-level CPU design, OS integration, and assembly programming.

For detailed architecture, pipeline stages, instruction set, and memory system, see **[TRM_ARCHITECTURE.txt](TRM_ARCHITECTURE.txt)**.

## Features

- 4-core CPU with register file, ALU, barrel shifter, and flags/branch unit
- Custom instruction set (TRM ISA)
- Pipeline stages: IF, DF, EX, MEM, WB
- Virtual memory support with MMU and TLB
- Educational firmware: TSBIOS
- Bootloader for OS initialization
- Input/Output port system for display and peripherals
