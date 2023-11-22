// Reference: STMicroelectronics RM0351

.equ DMA1,              0x40020000  // Base address of DMA1 [RM0351, P.78]
.equ DMA2,              0x40020400  // Base address of DMA2 [RM0351, P.78]

.equ DMA_IFCR,          0x04        // Offset of DMA_IFCR relative to DMAx
.equ DMA_IFCR_CGIF1,    0           // Global interrupt flag clear for CH1 is  bit 0 of DMA_IFCR
.equ DMA_IFCR_CTCIF1,   1           // Transfer complete flag clear for CH1 is bit 1 of DMA_IFCR
.equ DMA_IFCR_CHTIF1,   2           // Half transfer flag clear for CH1 is     bit 2 of DMA_IFCR
.equ DMA_IFCR_CHEIF1,   3           // Transfer error flag clear for CH1 is    bit 3 of DMA_IFCR

.equ DMA_CCR1,          0x08        // Offset of DMA_CCR1 relative to DMAx
.equ DMA_CCR2,          0x1C
.equ DMA_CCR3,          0x30
.equ DMA_CCR4,          0x44
.equ DMA_CCR5,          0x58
.equ DMA_CCR6,          0x6C
.equ DMA_CCR7,          0x80
.equ DMA_CCRx_EN,       0           // Channel enable is                     bit 0 of DMA_CCRx
.equ DMA_CCRx_TCIE,     1           // Transfer complete interrupt enable is bit 1 of DMA_CCRx
.equ DMA_CCRx_HTIE,     2           // Half transfer interrupt enable is     bit 2 of DMA_CCRx
.equ DMA_CCRx_TEIE,     3           // Transfer error interrupt enable is    bit 3 of DMA_CCRx
.equ DMA_CCRx_DIR,      4           // Data transfer direction is            bit 4 of DMA_CCRx
.equ DMA_CCRx_CIRC,     5           // Circular mode is                      bit 5 of DMA_CCRx
.equ DMA_CCRx_PINC,     6           // Peripheral increment mode is          bit 6 of DMA_CCRx
.equ DMA_CCRx_MINC,     7           // Memory increment mode is              bit 7 of DMA_CCRx
.equ DMA_CCRx_PSIZE,    8           // Peripheral size is                    bit 8-9 of DMA_CCRx
.equ DMA_CCRx_MSIZE,    10          // Memory size is                        bit 10-11 of DMA_CCRx
.equ DMA_CCRx_PL,       12          // Priority level is                     bit 12-13 of DMA_CCRx
.equ DMA_CCRx_MEM2MEM,  14          // Memory-to-memory mode is              bit 14 of DMA_CCRx

.equ DMA_CNDTR1,        0x0C        // Offset of DMA_CNDTR1 relative to DMAx
.equ DMA_CNDTR2,        0x20
.equ DMA_CNDTR3,        0x34
.equ DMA_CNDTR4,        0x48
.equ DMA_CNDTR5,        0x5C
.equ DMA_CNDTR6,        0x70
.equ DMA_CNDTR7,        0x84
.equ DMA_CNDTRx_NDT,    0           // Number of data to transfer is bit 0-15 of DMA_CNDTRx

.equ DMA_CPAR1,         0x10        // Offset of DMA_CPAR1 relative to DMAx
.equ DMA_CPAR2,         0x24
.equ DMA_CPAR3,         0x38
.equ DMA_CPAR4,         0x4C
.equ DMA_CPAR5,         0x60
.equ DMA_CPAR6,         0x74
.equ DMA_CPAR7,         0x88

.equ DMA_CMAR1,         0x14        // Offset of DMA_CMAR1 relative to DMAx
.equ DMA_CMAR2,         0x28
.equ DMA_CMAR3,         0x3C
.equ DMA_CMAR4,         0x50
.equ DMA_CMAR5,         0x64
.equ DMA_CMAR6,         0x78
.equ DMA_CMAR7,         0x8C

.equ DMA_CSELR,         0xA8        // Offset of DMA_CSELR relative to DMAx
.equ DMA_CSELR_C4S,     12          // DMA channel 4 selection is bit 12-15 of DMA_CSELR
