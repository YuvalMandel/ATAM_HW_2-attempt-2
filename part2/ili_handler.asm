.globl my_ili_handler

.extern what_to_do, old_ili_handler

.text
.align 4, 0x90
my_ili_handler:
  ####### Some smart student's code here #######
  # We use r14 for the user rip address, and r15 for the specific byte value
  pushq %r14
  pushq %r15
  xor %r15, %r15
  xor %r14, %r14
  movq 16(%rsp), %r14
  movb (%r14), %r15b
  
  # We compare the byte to 0x0F. 
  cmpb $0x0F, %r15b
  
  # If it's not 0x0F we jump to the good byte section.
  jne good_byte
  
  # If it is, we take the next byte by update to the address r14 and change the value of r15.
  inc %r14
  movb (%r14), %r15b
  
good_byte:

  # We keep all the regs aside.
  pushq %rax
  pushq %rdi
  pushq %rsi
  pushq %rdx
  pushq %rcx
  pushq %r8
  pushq %r9
  pushq %r10
  pushq %r11
  pushq %rbx
  pushq %rbp
  pushq %rsp
  pushq %r12
  pushq %r13
  
  # we need to insert the byte argument to rdi.
  movq %r15, %rdi
  
  # We call the external command what to do after setting up regs and input arg.
  call what_to_do
  
  # We move the result to r15
  movq %rax, %r15
  
  # return all the args before call.
  popq %r13
  popq %r12
  popq %rsp
  popq %rbp
  popq %rbx
  popq %r11
  popq %r10
  popq %r9
  popq %r8
  popq %rcx
  popq %rdx
  popq %rsi
  popq %rdi
  popq %rax
  
  # Check the return value of what to do
  cmpq $0, %r15
  
  # If it is zero, we jump to run old ili handler
  je zero

  # If not, we return the return value of the ehat_to_do call to rdi
  movq %r15, %rdi
  
  # We change the pointer of the next instruction to the next
  inc %r14
  
  # update OG rip to the next instruction
  movq %r14, 16(%rsp) 
  
  # pop the old values of the regs we used before end of our handler
  popq %r15
  popq %r14
  
  iretq
  
zero:
  
  # pop the old values of the regs we used before end of our handler
  popq %r15
  popq %r14
  
  # We jump to the old handler since the return val us 0
  jmp *old_ili_handler (%rip)
  
