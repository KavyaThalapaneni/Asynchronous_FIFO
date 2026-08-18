# Asynchronous FIFO

## Overview

This project implements a **dual-clock Asynchronous FIFO** for reliable data transfer between two different clock domains.

## Features

* Independent read and write clock domains
* Gray-code pointer synchronization
* Two-flip-flop synchronizers for CDC
* Full and empty flag generation
* Dual-port memory architecture
* Robust metastability handling

## Files

* `fifo.v` – Top-level FIFO module
* `wptr_full.v` – Write pointer and full detection
* `rptr_empty.v` – Read pointer and empty detection
* `sync_r2w.v` – Read pointer synchronization to write clock domain
* `sync_w2r.v` – Write pointer synchronization to read clock domain
* `testbench.v` – Functional verification
## Architecture
![Architecture](documents/Asynch_architecture.jpeg)
## Tools

**Verilog HDL | Vivado | Simulation | STA**

## Result

Successfully verified asynchronous data transfer between independent clock domains with correct **full** and **empty** flag operation.
