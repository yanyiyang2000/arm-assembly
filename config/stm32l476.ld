_Stack_Size = 0x400;
_Heap_Size = 0x0;

ENTRY(Reset_Handler)

MEMORY {
	FLASH (xr)  : ORIGIN = 0x8000000,  LENGTH = 1024K
	SRAM1 (xrw) : ORIGIN = 0x20000000, LENGTH = 96K
}

SECTIONS {
	.vectors : {
		KEEP(*(.vectors))
	} > FLASH


	.text : {
		. = ALIGN(4);
		*(.text)
		*(.text.*)
	} > FLASH


	.rodata : {
		. = ALIGN(8);
		*(.rodata)
		*(.rodata.*)
	} > FLASH


	/* 
	 * The load address of .data is in FLASH after .rodata section.
	 * The relocation address of .data is in SRAM1 after .bss section.
	 */
	.data : AT (ADDR(.rodata) + SIZEOF(.rodata)) {
		. = ALIGN(4);
		_sdata = .;
		*(.data)
		*(.data.*)
		. = ALIGN(4);
		_edata = .;
	} > SRAM1

	/* Load address of .data */
	_sidata = LOADADDR(.data);


	.bss (NOLOAD) : {
		. = ALIGN(4);
		_sbss = .;
		*(.bss)
		*(.bss.*)
		. = ALIGN(4);
		_ebss = .;
	} > SRAM1


	/* 
	 * Cortex-M uses a full descending stack. This means the 
	 * initial stack pointer holds the highest address.
	 */
	.stack : {
		. = ALIGN(8);
    	_sstack = .;
    	. = . + _Stack_Size;
    	. = ALIGN(8);
    	_estack = .;
	}

	.heap : {
		. = ALIGN(8);
		_sheap = .;
		. = . + _Heap_Size;
		. = ALIGN(8);
    	_eheap = .;
	}
}