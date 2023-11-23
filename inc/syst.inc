// Reference: ARM v7-M Architecture Reference Manual [ARM DDI 0403D]

.equ SYST,                  0xE000E010      // Base addr of SYST [B3-708]

.equ SYST_CSR,              0x00            // Offset of SYST_CSR relative to SYST [B3-745]
.equ SYST_CSR_ENABLE,       0               // SysTick enable is           bit 0 of SYST_CSR
.equ SYST_CSR_TICKINT,      1               // SysTick interrupt enable is bit 1 of SYST_CSR
.equ SYST_CSR_CLKSOURCE,    2               // SysTick clock source is     bit 2 of SYST_CSR
.equ SYST_CSR_COUNTFLAG,    16              // SysTick count status is     bit 16 of SYST_CSR

.equ SYST_RVR,              0x04            // Offset of SYST_RVR relative to SYST [B3-745]

.equ SYST_CVR,              0x08            // Offset of SYST_CVR relative to SYST [B3-745]
