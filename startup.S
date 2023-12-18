.syntax unified
.cpu    cortex-m3
.thumb


.text

.type Reset_Handler, %function
.global Reset_Handler
.thumb_func
Reset_Handler:
    bl      main			// this can be changed to any function entry
	b       .


.type Default_Handler, %function
.global Default_Handler
.thumb_func
Default_Handler:
	bkpt						// breakpoint, stop here!
	b		Default_Handler


/* ISR (Vector) table of STM32L47x [RM0351, P.396] */
.section .isr_vector, "a"                   // make a section for ISR table for debugging purpose

.word   _sdata                          	// first available address after stack, defined in the linker script
.word	Reset_Handler                       // first available address after ISR table
.word	NMI_Handler
.word	HardFault_Handler
.word	MemManage_Handler
.word	BusFault_Handler
.word	UsageFault_Handler
.word	0
.word	0
.word	0
.word	0
.word	SVC_Handler
.word	DebugMon_Handler
.word	0
.word   PendSV_Handler
.word   SysTick_Handler

.word	WWDG_IRQHandler						// Interrupt 0 of ISER0
.word	PVD_PVM_IRQHandler
.word	RTC_TAMP_STAMP_CSS_LSE_IRQHandler
.word	RTC_WKUP_IRQHandler
.word	FLASH_IRQHandler
.word	RCC_IRQHandler
.word	EXTI0_IRQHandler
.word	EXTI1_IRQHandler
.word	EXTI2_IRQHandler
.word	EXTI3_IRQHandler
.word	EXTI4_IRQHandler					// Interrupt 10
.word	DMA1_CH1_IRQHandler					// Interrupt 11
.word	DMA1_CH2_IRQHandler
.word	DMA1_CH3_IRQHandler
.word	DMA1_CH4_IRQHandler
.word	DMA1_CH5_IRQHandler
.word	DMA1_CH6_IRQHandler
.word	DMA1_CH7_IRQHandler
.word	ADC1_2_IRQHandler
.word	CAN1_TX_IRQHandler
.word	CAN1_RX0_IRQHandler					// Interrupt 20
.word	CAN1_RX1_IRQHandler
.word	CAN1_SCE_IRQHandler
.word	EXTI9_5_IRQHandler
.word	TIM1_BRK_TIM15_IRQHandler
.word	TIM1_UP_TIM16_IRQHandler
.word	TIM1_TRG_COM_TIM17_IRQHandler
.word	TIM1_CC_IRQHandler
.word	TIM2_IRQHandler						// Interrupt 28
.word	TIM3_IRQHandler
.word	TIM4_IRQHandler						// Interrupt 30
.word	I2C1_EV_IRQHandler
.word	I2C1_ER_IRQHandler					// Interrupt 0 of ISER1
.word	I2C2_EV_IRQHandler
.word	I2C2_ER_IRQHandler
.word	SPI1_IRQHandler
.word	SPI2_IRQHandler
.word	USART1_IRQHandler
.word	USART2_IRQHandler
.word	USART3_IRQHandler
.word	EXTI15_10_IRQHandler
.word	RTC_Alarm_IRQHandler
.word	DFSDM1_FLT3_IRQHandler				// Interrupt 10
.word	TIM8_BRK_IRQHandler
.word	TIM8_UP_IRQHandler
.word	TIM8_TRG_COM_IRQHandler
.word	TIM8_CC_IRQHandler
.word	ADC3_IRQHandler
.word	FMC_IRQHandler
.word	SDMMC1_IRQHandler
.word	TIM5_IRQHandler
.word	SPI3_IRQHandler
.word	UART4_IRQHandler					// Interrupt 20
.word	UART5_IRQHandler
.word	TIM6_DAC_IRQHandler
.word	TIM7_IRQHandler
.word	DMA2_CH1_IRQHandler					// Interrupt 24
.word	DMA2_CH2_IRQHandler
.word	DMA2_CH3_IRQHandler
.word	DMA2_CH4_IRQHandler
.word	DMA2_CH5_IRQHandler
.word	DFSDM1_FLT0_IRQHandler
.word	DFSDM1_FLT1_IRQHandler				// Interrupt 30
.word	DFSDM1_FLT2_IRQHandler
.word	COMP_IRQHandler						// Interrupt 0 of ISER2
.word	LPTIM1_IRQHandler
.word	LPTIM2_IRQHandler
.word	OTG_FS_IRQHandler
.word	DMA2_CH6_IRQHandler
.word	DMA2_CH7_IRQHandler
.word	LPUART1_IRQHandler
.word	QUADSPI_IRQHandler
.word	I2C3_EV_IRQHandler
.word	I2C3_ER_IRQHandler
.word	SAI1_IRQHandler						// Interrupt 10 of ISER2
.word	SAI2_IRQHandler
.word	SWPMI1_IRQHandler
.word	TSC_IRQHandler
.word	LCD_IRQHandler
.word   0
.word	RNG_IRQHandler
.word	FPU_IRQHandler




.weak	NMI_Handler
.thumb_set NMI_Handler,Default_Handler

.weak	HardFault_Handler
.thumb_set HardFault_Handler,Default_Handler

.weak	MemManage_Handler
.thumb_set MemManage_Handler,Default_Handler

.weak	BusFault_Handler
.thumb_set BusFault_Handler,Default_Handler

.weak	UsageFault_Handler
.thumb_set UsageFault_Handler,Default_Handler

.weak	SVC_Handler
.thumb_set SVC_Handler,Default_Handler

.weak	DebugMon_Handler
.thumb_set DebugMon_Handler,Default_Handler

.weak	PendSV_Handler
.thumb_set PendSV_Handler,Default_Handler

.weak	SysTick_Handler
.thumb_set SysTick_Handler,Default_Handler

.weak	WWDG_IRQHandler
.thumb_set WWDG_IRQHandler,Default_Handler

.weak	PVD_PVM_IRQHandler
.thumb_set PVD_PVM_IRQHandler,Default_Handler

.weak	RTC_TAMP_STAMP_CSS_LSE_IRQHandler
.thumb_set RTC_TAMP_STAMP_CSS_LSE_IRQHandler,Default_Handler

.weak	RTC_WKUP_IRQHandler
.thumb_set RTC_WKUP_IRQHandler,Default_Handler

.weak	FLASH_IRQHandler
.thumb_set FLASH_IRQHandler,Default_Handler

.weak	RCC_IRQHandler
.thumb_set RCC_IRQHandler,Default_Handler

.weak	EXTI0_IRQHandler
.thumb_set EXTI0_IRQHandler,Default_Handler

.weak	EXTI1_IRQHandler
.thumb_set EXTI1_IRQHandler,Default_Handler

.weak	EXTI2_IRQHandler
.thumb_set EXTI2_IRQHandler,Default_Handler

.weak	EXTI3_IRQHandler
.thumb_set EXTI3_IRQHandler,Default_Handler

.weak	EXTI4_IRQHandler
.thumb_set EXTI4_IRQHandler,Default_Handler

.weak	DMA1_CH1_IRQHandler
.thumb_set DMA1_CH1_IRQHandler,Default_Handler

.weak	DMA1_CH2_IRQHandler
.thumb_set DMA1_CH2_IRQHandler,Default_Handler

.weak	DMA1_CH3_IRQHandler
.thumb_set DMA1_CH3_IRQHandler,Default_Handler

.weak	DMA1_CH4_IRQHandler
.thumb_set DMA1_CH4_IRQHandler,Default_Handler

.weak	DMA1_CH5_IRQHandler
.thumb_set DMA1_CH5_IRQHandler,Default_Handler

.weak	DMA1_CH6_IRQHandler
.thumb_set DMA1_CH6_IRQHandler,Default_Handler

.weak	DMA1_CH7_IRQHandler
.thumb_set DMA1_CH7_IRQHandler,Default_Handler

.weak	ADC1_2_IRQHandler
.thumb_set ADC1_2_IRQHandler,Default_Handler

.weak	CAN1_TX_IRQHandler
.thumb_set CAN1_TX_IRQHandler,Default_Handler

.weak	CAN1_RX0_IRQHandler
.thumb_set CAN1_RX0_IRQHandler,Default_Handler

.weak	CAN1_RX1_IRQHandler
.thumb_set CAN1_RX1_IRQHandler,Default_Handler

.weak	CAN1_SCE_IRQHandler
.thumb_set CAN1_SCE_IRQHandler,Default_Handler

.weak	EXTI9_5_IRQHandler
.thumb_set EXTI9_5_IRQHandler,Default_Handler

.weak	TIM1_BRK_TIM15_IRQHandler
.thumb_set TIM1_BRK_TIM15_IRQHandler,Default_Handler

.weak	TIM1_UP_TIM16_IRQHandler
.thumb_set TIM1_UP_TIM16_IRQHandler,Default_Handler

.weak	TIM1_TRG_COM_TIM17_IRQHandler
.thumb_set TIM1_TRG_COM_TIM17_IRQHandler,Default_Handler

.weak	TIM1_CC_IRQHandler
.thumb_set TIM1_CC_IRQHandler,Default_Handler

.weak	TIM2_IRQHandler
.thumb_set TIM2_IRQHandler,Default_Handler

.weak	TIM3_IRQHandler
.thumb_set TIM3_IRQHandler,Default_Handler

.weak	TIM4_IRQHandler
.thumb_set TIM4_IRQHandler,Default_Handler

.weak	I2C1_EV_IRQHandler
.thumb_set I2C1_EV_IRQHandler,Default_Handler

.weak	I2C1_ER_IRQHandler
.thumb_set I2C1_ER_IRQHandler,Default_Handler

.weak	I2C2_EV_IRQHandler
.thumb_set I2C2_EV_IRQHandler,Default_Handler

.weak	I2C2_ER_IRQHandler
.thumb_set I2C2_ER_IRQHandler,Default_Handler

.weak	SPI1_IRQHandler
.thumb_set SPI1_IRQHandler,Default_Handler

.weak	SPI2_IRQHandler
.thumb_set SPI2_IRQHandler,Default_Handler

.weak	USART1_IRQHandler
.thumb_set USART1_IRQHandler,Default_Handler

.weak	USART2_IRQHandler
.thumb_set USART2_IRQHandler,Default_Handler

.weak	USART3_IRQHandler
.thumb_set USART3_IRQHandler,Default_Handler

.weak	EXTI15_10_IRQHandler
.thumb_set EXTI15_10_IRQHandler,Default_Handler

.weak	RTC_Alarm_IRQHandler
.thumb_set RTC_Alarm_IRQHandler,Default_Handler

.weak	DFSDM1_FLT3_IRQHandler
.thumb_set DFSDM1_FLT3_IRQHandler,Default_Handler

.weak	TIM8_BRK_IRQHandler
.thumb_set TIM8_BRK_IRQHandler,Default_Handler

.weak	TIM8_UP_IRQHandler
.thumb_set TIM8_UP_IRQHandler,Default_Handler

.weak	TIM8_TRG_COM_IRQHandler
.thumb_set TIM8_TRG_COM_IRQHandler,Default_Handler

.weak	TIM8_CC_IRQHandler
.thumb_set TIM8_CC_IRQHandler,Default_Handler

.weak	ADC3_IRQHandler
.thumb_set ADC3_IRQHandler,Default_Handler

.weak	FMC_IRQHandler
.thumb_set FMC_IRQHandler,Default_Handler

.weak	SDMMC1_IRQHandler
.thumb_set SDMMC1_IRQHandler,Default_Handler

.weak	TIM5_IRQHandler
.thumb_set TIM5_IRQHandler,Default_Handler

.weak	SPI3_IRQHandler
.thumb_set SPI3_IRQHandler,Default_Handler

.weak	UART4_IRQHandler
.thumb_set UART4_IRQHandler,Default_Handler

.weak	UART5_IRQHandler
.thumb_set UART5_IRQHandler,Default_Handler

.weak	TIM6_DAC_IRQHandler
.thumb_set TIM6_DAC_IRQHandler,Default_Handler

.weak	TIM7_IRQHandler
.thumb_set TIM7_IRQHandler,Default_Handler

.weak	DMA2_CH1_IRQHandler
.thumb_set DMA2_CH1_IRQHandler,Default_Handler

.weak	DMA2_CH2_IRQHandler
.thumb_set DMA2_CH2_IRQHandler,Default_Handler

.weak	DMA2_CH3_IRQHandler
.thumb_set DMA2_CH3_IRQHandler,Default_Handler

.weak	DMA2_CH4_IRQHandler
.thumb_set DMA2_CH4_IRQHandler,Default_Handler

.weak	DMA2_CH5_IRQHandler
.thumb_set DMA2_CH5_IRQHandler,Default_Handler

.weak	DFSDM1_FLT0_IRQHandler
.thumb_set DFSDM1_FLT0_IRQHandler,Default_Handler	

.weak	DFSDM1_FLT1_IRQHandler
.thumb_set DFSDM1_FLT1_IRQHandler,Default_Handler	

.weak	DFSDM1_FLT2_IRQHandler
.thumb_set DFSDM1_FLT2_IRQHandler,Default_Handler	

.weak	COMP_IRQHandler
.thumb_set COMP_IRQHandler,Default_Handler

.weak	LPTIM1_IRQHandler
.thumb_set LPTIM1_IRQHandler,Default_Handler

.weak	LPTIM2_IRQHandler
.thumb_set LPTIM2_IRQHandler,Default_Handler	

.weak	OTG_FS_IRQHandler
.thumb_set OTG_FS_IRQHandler,Default_Handler	

.weak	DMA2_CH6_IRQHandler
.thumb_set DMA2_CH6_IRQHandler,Default_Handler	

.weak	DMA2_CH7_IRQHandler
.thumb_set DMA2_CH7_IRQHandler,Default_Handler	

.weak	LPUART1_IRQHandler
.thumb_set LPUART1_IRQHandler,Default_Handler	

.weak	QUADSPI_IRQHandler
.thumb_set QUADSPI_IRQHandler,Default_Handler	

.weak	I2C3_EV_IRQHandler
.thumb_set I2C3_EV_IRQHandler,Default_Handler	

.weak	I2C3_ER_IRQHandler
.thumb_set I2C3_ER_IRQHandler,Default_Handler	

.weak	SAI1_IRQHandler
.thumb_set SAI1_IRQHandler,Default_Handler

.weak	SAI2_IRQHandler
.thumb_set SAI2_IRQHandler,Default_Handler

.weak	SWPMI1_IRQHandler
.thumb_set SWPMI1_IRQHandler,Default_Handler

.weak	TSC_IRQHandler
.thumb_set TSC_IRQHandler,Default_Handler

.weak	LCD_IRQHandler
.thumb_set LCD_IRQHandler,Default_Handler

.weak	RNG_IRQHandler
.thumb_set RNG_IRQHandler,Default_Handler

.weak	FPU_IRQHandler
.thumb_set FPU_IRQHandler,Default_Handler
    