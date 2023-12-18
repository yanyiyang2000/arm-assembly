.syntax unified
.thumb

.include "rcc.inc"
.include "tim.inc"

.text

// Reference: STMicroelectronics RM0351

// Demo for TIM2 PWM mode

// The clock source of TIM2 is PCLK (4MHz)
// After the pre-scaler TIM2 is 1kHz

// When TIM2_CNT < TIM2_CCR1, TIM2_CH1 outputs high
// When TIM2_CNT > TIM2_CCR1, TIM2_CH1 outputs low

.global TIM2_INIT1
TIM2_INIT1:
    // Enable TIM2 clock on APB1
    ldr     r3, =RCC                                // load the base addr of RCC
    ldr     r2, [r3, #RCC_APB1ENR1]                 // load the value of RCC_APB1ENR1
    orr     r2, #1<<RCC_APB1ENR1_TIM2EN             // set bit 0 (TIM2EN) to 1 (enable)
    str     r2, [r3, #RCC_APB1ENR1]                 // update the value of RCC_APB1ENR1

    // Enable TIM2 auto-reload preload
    ldr     r3, =TIM2                               // load the base addr of TIM2
    ldr     r2, [r3, #TIMx_CR1]                     // load the value of TIMx_CR1
    orr     r2, #1<<TIMx_CR1_ARPE                   // set bit 7 (ARPE) to 1 (buffered)
    str     r2, [r3, #TIMx_CR1]                     // update the value of TIMx_CR1

    // Prescale the clock to 1kHz
    mov     r2, #3999                               // 1ms / count
    str     r2, [r3, #TIMx_PSC]                     // update the value of TIMx_PSC

    // Set value of TIM2_CNT to 1000
    mov     r2, #999                                // 1s / master cycle
    str     r2, [r3, #TIMx_ARR]                     // update the value of TIMx_ARR

    // Set value of TIM2_CCR1 to 500
    mov     r2, #499                                // 0.5s / slave cycle
    str     r2, [r3, #TIMx_CCR1]                    // update the value of TIMx_CCR1

    // Configure TIM2 capture/compare 1 as output
    ldr     r2, [r3, #TIMx_CCMR1]                   // load the value of TIMx_CCMR1
    and     r2, #0b00<<TIMx_CCMR1_CC1S              // set bit 0-1 (CC1S) to 00 (output)
    str     r2, [r3, #TIMx_CCMR1]                   // update the value of TIMx_CCMR1

    // Set TIM2 capture/compare 1 mode to PWM mode 1
    bic     r2, r2, #0b111<<TIMx_CCMR1_OC1M         // clear bit 4-6 (OC1M) of TIMx_CCMR1
    orr     r2, #0b110<<TIMx_CCMR1_OC1M             // set bit 4-6 (OC1M) to 110 (PWM mode 1)
    str     r2, [r3, #TIMx_CCMR1]                   // update the value of TIMx_CCMR1

    // Generate an artificial update event to 
    // update value in ARR from ARR preload register. 
    // Otherwise the value in ARR would not be updated 
    // with 999 until the current count overflows.
    ldr     r2, [r3, #TIMx_EGR]                     // load the value of TIMx_EGR
    orr     r2, #1<<TIMx_EGR_UG                     // set bit 0 (UG) to 1 (generate update)
    str     r2, [r3, #TIMx_EGR]                     // update the value of TIMx_EGR

    // Ensure outstanding memory transactions complete
    dsb

    // Enable TIM2 capture/compare 1
    ldr     r2, [r3, #TIMx_CCER]                    // load the value of TIMx_CCER
    orr     r2, #1<<TIMx_CCER_CC1E                  // set bit 0 (CC1E) to 1 (enable)
    str     r2, [r3, #TIMx_CCER]                    // update the value of TIMx_CCER

    // Enable TIM2 counter
    ldr     r2, [r3, #TIMx_CR1]                     // load the value of TIMx_CR1
    orr     r2, #1<<TIMx_CR1_CEN                    // set bit 0 (CEN) to 1 (enable)
    str     r2, [r3, #TIMx_CR1]                     // update the value of TIMx_CR1

    // Return
    bx      lr
    