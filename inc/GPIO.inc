// Reference: STMicroelectronics RM0351

.equ GPIOA,                     0x48000000  // Base address of GPIOA [RM0351, P.78]

.equ GPIOx_MODER,               0x00        // Offset of GPIOx port mode register relative to GPIOx
.equ GPIOx_MODER_MODE5,         5           // Mode of pin 5 is bit 10 - 11 of GPIOx_MODER

.equ GPIOx_OTYPER,              0x04        // Offset of GPIOx port output type register relative to GPIOx
.equ GPIOx_OTYPER_OT5,          5           // Output type of pin 5 is bit 5 of GPIOx_OTYPER

.equ GPIOx_OSPEEDR,             0x08        // Offset of GPIOx port output speed register relative to GPIOx
.equ GPIOx_OSPEEDR_OSPEED5,     5           // Output speed of pin 5 is bit 10-11 of GPIOx_OSPEEDR

.equ GPIOx_PUPDR,               0x0C        // Offset of GPIOx port pull-up/pull-down register relative to GPIOx
.equ GPIOx_PUPDR_PUPD5,         5           // Pull up / pull down of pin 5 is bit 10-11 of GPIOx_PUPDR

.equ GPIOx_ODR,                 0x14        // Offset of GPIOx port output data register relative to GPIOx
.equ GPIOx_ODR_OD5,             5           // Output data of pin 5 is bit 5 of GPIOx_ODR

.equ GPIOx_AFPR,                0x20        // Offset of GPIOx alternate function low register relative to GPIOx
.equ GPIOx_AFPR_AFSEL5,         5           // Alternate function selection of pin 5 is bit 20-23 of GPIOx_AFPR
