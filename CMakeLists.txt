cmake_minimum_required(VERSION 3.22)

# uncomment to make cmake output verbose
#set(CMAKE_VERBOSE_MAKEFILE ON)

# skip compiler test for cross compilation
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")

# set compiler path and executable extension
set(CMAKE_ASM_COMPILER "/usr/bin/arm-none-eabi-gcc")
set(CMAKE_C_COMPILER   "/usr/bin/arm-none-eabi-gcc")
set(CMAKE_EXECUTABLE_SUFFIX_ASM .elf)
set(CMAKE_EXECUTABLE_SUFFIX_C   .elf)

project(
    test
    LANGUAGES C ASM
)

add_compile_options(
    -mcpu=cortex-m4
    -mfpu=fpv4-sp-d16
    -mthumb
    -mfloat-abi=hard
    -O0
    -g3
    -Wall
    -Wno-implicit-function-declaration
    -ffunction-sections
    -fdata-sections
)

add_link_options(
    -nostdlib
    -Wl,--gc-sections
    -T "${CMAKE_SOURCE_DIR}/config/stm32l476.ld"
)

add_subdirectory(src/SYST)
add_subdirectory(src/GPIO)
add_subdirectory(src/TIM)

add_executable(${PROJECT_NAME} main.c startup.S)

# components needed by main.c and startup.S
target_link_libraries(
    ${PROJECT_NAME}
    PUBLIC
    SYST
    GPIO
    TIM
)

# includes needed by main.c and startup.S
target_include_directories(
    ${PROJECT_NAME}
    PUBLIC
    "${PROJECT_SOURCE_DIR}/inc"
)
