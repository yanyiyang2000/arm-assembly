// Reference: ARM v7-M Architecture Reference Manual [ARM DDI 0403D]

.equ SCB,               0xE000ED00      // Base address of SCB [B3-710]

.equ SCB_SHPR3,         0x20            // Offset of system handler priority register 3 relative to SCB
.equ SCB_SHPR3_PRI15,   24              // Priority of system handler 15 (SysTick) is bit 24-31 of SCB_SHPR3

.equ SCB_SHCSR,         0x24            // Offset of system handler control and state register relative to SCB
