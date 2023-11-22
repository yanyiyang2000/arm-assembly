_Stack_Size = 0x400;

MEMORY {
	FLASH :	ORIGIN = 0x8000000,	 LENGTH = 128K
	SRAM  :	ORIGIN = 0x20000000, LENGTH = 20K
}

SECTIONS {
	.isr_vector : {
		*(.isr_vector)
	} >FLASH

	.text : {
		*(.text)
	} >FLASH
	
	.data (NOLOAD) : {
		. = . + _Stack_Size;
		_Stack_End = .;
		*(.data)
	} >SRAM
}