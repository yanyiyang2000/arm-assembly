// Reference: STMicroelectronics RM0351

.equ DAC1,                  0x40007400      // Base address of DAC1 [RM0351, P.78]

.equ DAC_CR,                0x00            // Offset of DAC_CR relative to DACx
.equ DAC_CR_EN2,            16              // DAC channel 2 enable            is bit 16 of DAC_CR
.equ DAC_CR_TEN2,           18              // DAC channel 2 trigger enable    is bit 18 of DAC_CR
.equ DAC_CR_TSEL2,          19              // DAC channel 2 trigger selection is bit 19-21 of DAC_CR
.equ DAC_CR_DMAEN2,         28              // DAC channel 2 DMA enable        is bit 28 of DAC_CR

.equ DAC_DHR12R2,           0x14            // Offset of DAC_DHR12R2 relative to DACx
.equ DAC_DHR12R2_DACC2DHR,  0               // DAC channel 2 12-bit right-aligned data is bit 0-11 of DAC_DHR12R2
