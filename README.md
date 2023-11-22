## Table of Contents
- [Prerequisites](#prerequisites)
- [Setting Project Name](#setting-project-name)
- [Building](#building)
- [Flashing](#flashing)
- [Cleaning](#cleaning)

## Prerequisites
Install the following packages:
- `arm-none-eabi-gcc`
- `gdb-multiarch`
- `openocd`

## Setting Project Name
In the root directory, modify the following entry in `CMakeLists.txt`:
```cmake
project(
    <YOUR_PROJECT_NAME>
    LANGUAGES ASM
)
```

## Building
In the root directory, use the following commands one by one:
```bash
cd build
cmake ..
make
```

## Flashing
In the `build` directory, use the following command:
```bash
openocd -f interface/stlink.cfg -f target/stm32l4x.cfg -c "program <YOUR_PROJECT_NAME>.elf verify reset exit"
```

## Cleaning
In the `build` directory, use the following command:
```bash
rm -rf *
```