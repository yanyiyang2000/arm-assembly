// Reference: STMicroelectronics RM0351

.equ TIM2,                  0x40000000          // Base address of TIM2 [RM0351, P.82]
.equ TIM3,                  0x40000400          // Base address of TIM3 [RM0351, P.82]

.equ TIMx_PSC,              0x28                // Offset of TIMx_PSC relative to TIMx
.equ TIMx_ARR,              0x2C                // Offset of TIMx_ARR relative to TIMx
.equ TIMx_CCR1,             0x34                // Offset of TIMx_CCR1 relative to TIMx

.equ TIMx_CR1,              0x00                // Offset of TIMx_CR1 relative to TIMx
.equ TIMx_CR1_CEN,          0                   // Counter enable is             bit 0 of TIMx_CR1
.equ TIMx_CR1_URS,          2                   // Update request source is      bit 2 of TIMx_CR1
.equ TIMx_CR1_OPM,          3                   // One-pulse mode is             bit 3 of TIMx_CR1
.equ TIMx_CR1_ARPE,         7                   // Auto-reload preload enable is bit 7 of TIMx_CR1

.equ TIMx_CR2,              0x04                // Offset of TIMx_CR2 relative to TIMx
.equ TIMx_CR2_MMS,          4                   // Master mode selection is bit 4-6 of TIMx_CR2

.equ TIMx_DIER,             0x0C                // Offset of TIMx_DIER relative to TIMx
.equ TIMx_DIER_UIE,         0                   // Update interrupt enable is bit 0 of TIMx_DIER

.equ TIMx_SR,               0x10                // Offset of TIMx_SR relative to TIMx
.equ TIMx_SR_UIF,           0                   // Update interrupt flag is bit 0 of TIMx_SR

.equ TIMx_EGR,              0x14                // Offset of TIMx_EGR relative to TIMx
.equ TIMx_EGR_UG,           0                   // Update generation is bit 0 of TIMx_EGR

.equ TIMx_CCMR1,            0x18                // Offset of TIMx_CCMR1 relative to TIMx
.equ TIMx_CCMR1_CC1S,       0                   // Capture/Compare 1 selection is bit 0-1 of TIMx_CCMR1
.equ TIMx_CCMR1_OC1PE,      3                   // Output compare 1 preload is    bit 3 of TIMx_CCMR1
.equ TIMx_CCMR1_OC1M,       4                   // Output compare 1 mode is       bit 4-6 of TIMx_CCMR1

.equ TIMx_CCER,             0x20                // Offset of TIMx_CCER relative to TIMx
.equ TIMx_CCER_CC1E,        0                   // Capture/Compare 1 output enable is   bit 0 of TIMx_CCER
.equ TIMx_CCER_CC1P,        1                   // Capture/Compare 1 output polarity is bit 1 of TIMx_CCER
