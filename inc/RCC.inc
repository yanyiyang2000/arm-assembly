// Reference: STMicroelectronics RM0351

.equ RCC,                   0x40021000      // Base address of RCC [RM0351, P.78]

.equ RCC_CR,                0x00            // Offset of clock control register relative to RCC

.equ RCC_AHB1ENR,           0x48            // Offset of AHB1 peripheral clock enable register relative to RCC
.equ RCC_AHB1ENR_DMA1EN,    0               // DMA1 clock enable is bit 0 of RCC_AHB1ENR
.equ RCC_AHB1ENR_DMA2EN,    1               // DMA2 clock enable is bit 1 of RCC_AHB1ENR

.equ RCC_AHB2ENR,           0x4C            // Offset of AHB2 peripheral clock enable register relative to RCC
.equ RCC_AHB2ENR_GPIOAEN,   0               // GPIO port A clock enable is bit 0 of RCC_AHB2ENR

.equ RCC_APB1ENR1,          0x58            // Offset of APB1 peripheral clock enable register 1 relative to RCC
.equ RCC_APB1ENR1_TIM2EN,   0               // TIM2 clock enable is bit 0 of RCC_APB1ENR1
.equ RCC_APB1ENR1_TIM3EN,   1               // TIM3 clock enable is bit 4 of RCC_APB1ENR1
.equ RCC_APB1ENR1_DAC1EN,   29              // DAC1 clock enable is bit 29 of RCC_APB1ENR1
