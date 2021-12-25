.globl my_ili_handler

.extern what_to_do, old_ili_handler

.text
.align 4, 0x90
# NOTE: this handler runs on kernel mode. at that point, kernel stack looks like:
# begining of kernel stack: ..., (user)ss, (user)rsp, (user)rflags, (user)cs, (user)rip
#                                                                                    ^(kernel)rsp
my_ili_handler:
  ####### Some smart student's code here #######
  # keep rdi, and zero rdi to use
  pushq %r14
  pushq %r15
  xor %r15, %r15
  xor %r14, %r14
  movq 16(%rsp), %r14
  movb (%r14), %r15b
  cmpb $0x0F, %r15b
  jne good_byte
  # No jump, we take the next byte.
  inc %r14
  movb (%r14), %r15b
  
good_byte:
   # restor all caller save
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
  #pushq %r14
  movzx %r15b, %rdi
  call what_to_do
  
  movq %rax, %r15
  
  #popq %r14
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
  je zero

  movq %r15, %rdi
  popq %r15
  popq %r14
  add $1, (%rsp) # update OG rip to the next instruction
  iretq
  
zero:
# make sure the stack is the same.
  popq %r15
  popq %r14
  jmp *old_ili_handler (%rip)
  
