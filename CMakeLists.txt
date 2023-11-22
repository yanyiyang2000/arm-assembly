cmake_minimum_required(VERSION 3.22)

set(CMAKE_ASM_COMPILER "/usr/bin/arm-none-eabi-gcc")
set(CMAKE_C_COMPILER "/usr/bin/arm-none-eabi-gcc")

set(CMAKE_EXECUTABLE_SUFFIX_ASM .elf)
set(CMAKE_EXECUTABLE_SUFFIX_C .elf)

project(
    test
    LANGUAGES ASM
)

add_compile_options(
    -mcpu=cortex-m4
    -mfpu=fpv4-sp-d16
    -mthumb
    -mfloat-abi=hard
)

add_link_options(
    -nostdlib
    -T "${CMAKE_SOURCE_DIR}/config/stm32l476.ld"
)

add_subdirectory(src/gpio)
add_subdirectory(src/tim)

add_executable(${PROJECT_NAME} main.S startup.S)

# components needed by main.S and startup.S
target_link_libraries(
    ${PROJECT_NAME}
    PUBLIC
    gpio_init
    tim_init
)

# includes needed by main.S and startup.S
target_include_directories(
    ${PROJECT_NAME}
    PUBLIC
    "${PROJECT_SOURCE_DIR}/inc"
)
