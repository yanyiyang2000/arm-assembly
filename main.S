.syntax unified
.thumb


.text

.global System_Init
.thumb_func
System_Init:
    bl      GPIOA_PIN5_INIT1
    bl      TIM2_INIT1
    b       .
