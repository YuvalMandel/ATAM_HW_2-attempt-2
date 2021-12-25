#include <asm/desc.h>

void my_store_idt(struct desc_ptr *idtr) {
// <STUDENT FILL> - HINT: USE INLINE ASSEMBLY
	asm volatile ("sidt %0" :: "m"(*idtr):); //input
// </STUDENT FILL>
}

void my_load_idt(struct desc_ptr *idtr) {
// <STUDENT FILL> - HINT: USE INLINE ASSEMBLY
	asm volatile ("lidt %0" :: "m"(*idtr):); //input
// <STUDENT FILL>
}

void my_set_gate_offset(gate_desc *gate, unsigned long addr) {
// <STUDENT FILL> - HINT: NO NEED FOR INLINE ASSEMBLY
	// Remove the 32 bit on the right.
	gate -> offset_high = (addr >> 32);
	// Remove the 16 bits on the right, then remove the 32 bits on the left, and then come back.
	gate -> offset_middle = (((addr >> 16) << 48) >> 48);
	// Remove the first 48 buts on the left, and then set it back.
	gate -> offset_low = ((addr << 48) >> 48);
// </STUDENT FILL>
}

unsigned long my_get_gate_offset(gate_desc *gate) {
// <STUDENT FILL> - HINT: NO NEED FOR INLINE ASSEMBLY
	unsigned long addr;
	unsigned long temp;
	temp = gate -> offset_high;
	addr = (temp << 32);
	temp = gate -> offset_middle;
	addr += (temp << 16);
	temp = gate -> offset_low;
	addr += temp;
	return addr;
// </STUDENT FILL>
}
