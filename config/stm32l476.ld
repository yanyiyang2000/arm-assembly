_Stack_Size = 0x400;

ENTRY(Reset_Handler)

MEMORY {
	FLASH :	ORIGIN = 0x8000000,	 LENGTH = 1024K
	SRAM1 :	ORIGIN = 0x20000000, LENGTH = 96K
}

SECTIONS {
	.vectors : {
		KEEP(*(.isr_vector))
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


	.bss : {
		. = ALIGN(4);
		_sbss = .;
		*(.bss)
		*(.bss.*)
		. = ALIGN(4);
		_ebss = .;
	} > SRAM1


	.data : AT (ADDR(.rodata) + SIZEOF(.rodata)) {
		_sdata = . + _Stack_Size;
		*(.data)
		*(.data.*)
		. = ALIGN(4);
		_edata = .;
	} > SRAM1
	

	/* .data (NOLOAD) : {
		. = . + _Stack_Size;
		_sdata = .;
		*(.data)
		*(.data.*)
	} > SRAM1 */
}