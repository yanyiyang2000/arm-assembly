.syntax unified
.thumb

.include "scb.inc"
.include "syst.inc"


.data

.global SysTick_ms
SysTick_ms:
    .word 0


.text

// 4MHz MSI clock is used as system clock after reset

.global SYSTICK_INIT
.thumb_func
SYSTICK_INIT:
    // Set SysTick interrupt handler priority
    ldr     r3, =SCB                    // load the base addr of SCB
    ldr     r2, [r3, #SCB_SHPR3]        // load the value of SCB_SHPR3
    orr     r2, #0x80<<SCB_SHPR3_PRI15  // set bit 24-31 (PRI15) to 0x80 (medium priority)
    str     r2, [r3, #SCB_SHPR3]        // update the value of SCB_SHPR3

    // Disable SysTick
    ldr     r3, =SYST                   // load the base addr of SYST
    ldr     r2, [r3, #SYST_CSR]         // load the value of SYST_CSR
    and     r2, #0<<SYST_CSR_ENABLE     // set bit 0 (ENABLE) to 0 (disable)
    
    // Enable SysTick interrupt
    orr     r2, #1<<SYST_CSR_TICKINT    // set bit 1 (TICKINT) to 1 (enable)
    str     r2, [r3, #SYST_CSR]         // update the value of SYST_CSR

    // Set SysTick reload value
    mov     r2, #3999                   // 1ms / cycle
    str     r2, [r3, #SYST_RVR]         // update the value of SYST_RVR

    // Clear SysTick current value
    mov     r2, #0                      
    str     r2, [r3, #SYST_CVR]         // update the value of SYST_CVR

    // Enable SysTick
    ldr     r2, [r3, #SYST_CSR]         // load the value of SYST_CSR
    orr     r2, #1<<SYST_CSR_ENABLE     // set bit 0 (ENABLE) to 1 (enable)
    str     r2, [r3, #SYST_CSR]         // update the value of SYST_CSR

    // Return
    bx      lr


.global SysTick_Handler
.thumb_func
SysTick_Handler:
    // 
    bkpt
    
    // Update SysTick_ms
    movw    r3, #:lower16:SysTick_ms    // load the addr of SysTick_ms
    movt    r3, #:upper16:SysTick_ms    
    ldr     r2, [r3]                    // load the value of SysTick_ms
    add     r2, r2, #1                  // increment SysTick_ms by 1
    ldr     r2, [r3]                    // update the value of SysTick_ms

    // Return
    bx      lr