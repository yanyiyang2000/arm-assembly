_Stack_Size = 0x400;

MEMORY {
	FLASH :	ORIGIN = 0x8000000,	 LENGTH = 128K
	RAM  :	ORIGIN = 0x20000000, LENGTH = 20K
}

SECTIONS {
	.isr_vector : {
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
	} > RAM


	.data : AT (ADDR(.rodata) + SIZEOF(.rodata)) {
		_sdata = . + _Stack_Size;
		*(.data)
		*(.data.*)
		. = ALIGN(4);
		_edata = .;
	} > RAM
	

	/* .data (NOLOAD) : {
		. = . + _Stack_Size;
		_sdata = .;
		*(.data)
		*(.data.*)
	} > RAM */
}