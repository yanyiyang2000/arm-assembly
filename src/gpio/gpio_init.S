.syntax unified
.thumb

.include "rcc.inc"
.include "gpio.inc"

.text

// GPIO port A pin 5 (PA5) is configured as follow:
// 1. Alternate function mode (connected to TIM2_CH1)
// 2. push-pull, high speed output

.global GPIOA_PIN5_INIT1
.thumb_func
GPIOA_PIN5_INIT1:
    // Enable GPIO port A clock on AHB2
    ldr     r3, =RCC                                    // load the base addr of RCC
    ldr     r2, [r3, #RCC_AHB2ENR]                      // load the value of RCC_AHB2ENR
    orr     r2, #1<<RCC_AHB2ENR_GPIOAEN                 // set bit 0 (GPIOAEN) to 1 (enable)
    str     r2, [r3, #RCC_AHB2ENR]                      // update the value of RCC_AHB2ENR

    // Configure GPIO port A pin 5 
    // as alternate function mode
    ldr     r3, =GPIOA                                  // load the base addr of GPIOA
    ldr     r2, [r3, #GPIOx_MODER]                      // load the value of GPIOx_MODER
    bic     r2, r2, #0b11<<(2*GPIOx_MODER_MODE5)        // clear bit 10-11 (MODE5) of GPIOx_MODER
    orr     r2, #0b10<<(2*GPIOx_MODER_MODE5)            // set bit 10-11 (MODE5) to 10 (alternate function mode)
    str     r2, [r3, #GPIOx_MODER]                      // update the value of GPIOx_MODER

    // Configure GPIO port A pin 5 alternate function 
    // as TIM2_CH1 [STMicroelectronics DS10198, P.92]
    ldr     r2, [r3, #GPIOx_AFPR]                       // load the value of GPIOx_AFPR
    bic     r2, r2, #0b1111<<(4*GPIOx_AFPR_AFSEL5)      // clear bit 20-23 (AFSEL5) of GPIOx_AFPR
    orr     r2, #0b0001<<(4*GPIOx_AFPR_AFSEL5)          // set bit 20-23 (AFSEL5) to 0001 (AF1)
    str     r2, [r3, #GPIOx_AFPR]                       // update the value of GPIOx_AFPR
    
    // Configure GPIO port A pin 5 output type 
    // as push-pull
    ldr     r2, [r3, #GPIOx_OTYPER]                     // load the value of GPIOx_OTYPER
    and     r2, #0<<GPIOx_OTYPER_OT5                    // set bit 5 (OT5) to 0 (push pull)
    str     r2, [r3, #GPIOx_OTYPER]                     // update the value of GPIOx_OTYPER

    // Configure GPIO port A pin 5 output speed 
    // as high speed
    ldr     r2, [r3, #GPIOx_OSPEEDR]                    // load the value of GPIOx_OSPEEDR
    bic     r2, r2, #0b11<<(2*GPIOx_OSPEEDR_OSPEED5)    // clear bit 10-11 (OSPEED5) of GPIOx_OSPEEDR
    orr     r2, #0b10<<(2*GPIOx_OSPEEDR_OSPEED5)        // set bit 10-11 (OSPEED5) to 10 (high speed)
    str     r2, [r3, #GPIOx_OSPEEDR]                    // update the value of GPIOx_OSPEEDR

    // Return
    bx      lr
    