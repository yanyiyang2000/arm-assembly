.syntax unified
.thumb

.include "NVIC.inc"
.include "RCC.inc"
.include "TIM.inc"

.text

// The clock source of TIM6 is 4MHz
// After pre-scaler TIM6 is 1kHz
// Every 10 seconds TIM2 will generate an interrupt

.global TIM3_init
.thumb_func
TIM3_init:
    // Enable TIM3 interrupt (see linker script for interrupt number)
    ldr     r3, =NVIC_ISER0                         // load the base addr of ISER1
    ldr     r2, [r3]                                // load the value of ISER0
    orr     r2, #1<<29                              // set bit 29 (TIM3 interrupt) to 1 (enable)
    str     r2, [r3]                                // update the value of ISER0

    // Enable TIM3 clock on APB1
    ldr     r3, =RCC                                // load the base addr of RCC
    ldr     r2, [r3, #RCC_APB1ENR1]                 // load the value of RCC_APB1ENR1
    orr     r2, #1<<RCC_APB1ENR1_TIM3EN             // set bit 0 (TIM2EN) to 1 (enable)
    str     r2, [r3, #RCC_APB1ENR1]                 // update the value of RCC_APB1ENR1

    // Allow only counter overflow/underflow 
    // to generate update interrupt
    ldr     r3, =TIM3                               // load the base addr of TIM3
    ldr     r2, [r3, #TIMx_CR1]                     // load the value of TIMx_CR1
    orr     r2, #1<<TIMx_CR1_URS                    // set bit 3 (URS) to 1

    // Enable TIM3 auto-reload preload
    orr     r2, #1<<TIMx_CR1_ARPE                   // set bit 7 (ARPE) to 1 (buffered)
    str     r2, [r3, #TIMx_CR1]                     // update the value of TIMx_CR1

    // Enable TIM3 update interrupt
    ldr     r2, [r3, #TIMx_DIER]                    // load the value of TIMx_DIER
    orr     r2, #1<<TIMx_DIER_UIE                   // set bit 0 (UIE) to 1 (enable)
    str     r2, [r3, #TIMx_DIER]                    // update the value of TIMx_DIER

    // Prescale TIM3 to 1kHz
    mov     r2, #3999                               // 1ms / count
    str     r2, [r3, #TIMx_PSC]                     // update the value of TIMx_PSC

    // Set value of TIM3_CNT to 10000
    mov     r2, #9999                               // 10s / cycle
    str     r2, [r3, #TIMx_ARR]                     // update the value of TIMx_ARR

    // Generate an artificial update event to 
    // update ARR shadow register. Otherwise the 
    // value in the shadow register would not be 
    // updated with 999 until the current count 
    // overflows. [RM0351, P.1018]
    ldr     r2, [r3, #TIMx_EGR]                     // load the value of TIMx_EGR
    orr     r2, #1<<TIMx_EGR_UG                     // set bit 0 (UG) to 1 (generate update)
    str     r2, [r3, #TIMx_EGR]                     // update the value of TIMx_EGR

    // Ensure outstanding memory transactions complete
    dsb

    // Enable TIM3 counter
    ldr     r2, [r3, #TIMx_CR1]                     // load the value of TIMx_CR1
    orr     r2, #1<<TIMx_CR1_CEN                    // set bit 0 (CEN) to 1 (enable)
    str     r2, [r3, #TIMx_CR1]                     // update the value of TIMx_CR1

    // Return
    bx      lr


    .global TIM3_IRQHandler
.thumb_func
TIM3_IRQHandler:
    // Clear TIM3 update interrupt flag (UIF)
    ldr     r3, =TIM3                               // load the base addr of TIM3
    ldr     r2, [r3, #TIMx_SR]                      // load the value of TIMx_SR
    bic     r2, #1<<TIMx_SR_UIF                     // set bit 0 (UIF) to 0 (No update occurred)
    str     r2, [r3, #TIMx_SR]                      // update the value of TIMx_SR

    bkpt                                            // breakpoint, stop here!

    // Do something to watch
    mov     r9, #0x1234

    // Return
    bx      lr