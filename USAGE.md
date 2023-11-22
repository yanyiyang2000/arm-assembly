# Table of Contents
- [Layout](#layout)
- [Components](#components)
    - [GPIO](#gpio)
        - [Mode 1](#gpio)
    - [TIM](#tim)
        - [Mode 1](#tim)

# Layout
This project is intended for learning ARM. Currenly no CMSIS or HAL library is used.

Every hardware component (e.g., GPIO and TIM) is a standalone "library" and each library may contain multiple hardware initialization code.

By using different initialization code, different operation modes (e.g., interrupt or DMA) can be achieved.

# Components
## GPIO
### Mode 1
GPIO port A pin 5 is configured as follows:
- I/O alternate function output 
    - AF1 (TIM2_CH1) [refer to datasheet]
- Output type set to `push pull`
- Output speed set to `high speed`

## TIM
### Mode 1
TIM2 is configured as follows:
- Prescale clock to 1kHz
- Auto reload value set to `1000`
- Capture/Compare 1 value set to `500`
- Capture/Compare 1 channel set to `output`
- Capture/Compare 1 mode set to `toggle`

## Test
### Test 1
Using GPIO mode 1 and TIM mode 1 to practice:
- GPIO alternate function input mode
- TIM output compare mode

Signal from `TIM2_CH1` is propogated by `GPIOA_P5` to the LED.