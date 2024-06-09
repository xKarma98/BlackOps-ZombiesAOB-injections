# infinite ammo array of byte injection
# method on how to find this load up cheat engine put the value of 8 and compare it to your last scan once you shoot a couple rounds you can then find that value and then edit to confirm the memory address of our value is 01c08f00
# next step is finding out what writes to the address and then we can see by shooting a few rounds what's writing to our instruction next show dissassembly for it
# right click on mov [eax+04],edx
# right click it press ctrl + A then template then AOB injection

# poc
# explaination when eax gets moved and returns and moves the value again our ammo goes down but if we mark out it returns and returns the funciton just basically doesn't subtract your ammo anymore cause it cannot move it's values in that register 
[ENABLE]

aobscanmodule(INJECT,BlackOps.exe,89 50 04 C3 8B 8C CE C0 03 00 00) // should be unique
alloc(newmem,$1000)

label(code)
label(return)

newmem:
 //mov [eax+04],edx
  ret
  //mov ecx,[esi+ecx*8+000003C0]
  jmp return

code:
  mov [eax+04],edx
  ret 
  mov ecx,[esi+ecx*8+000003C0]
  jmp return

INJECT:
  jmp newmem
  nop 6
return:
registersymbol(INJECT)

[DISABLE]

INJECT:
  db 89 50 04 C3 8B 8C CE C0 03 00 00

unregistersymbol(INJECT)
dealloc(newmem)
