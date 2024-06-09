# health 
# we can find our player health by looking putting in 100 and locating the exact value we also click compare to last scan and look for values that have changed once you find a value change it back to 100 then find out what writes to that address
# additonally click the box to freeze it
# once we found what wrote to our address which was mov [eax+000001C4],edx
# click it show dissasessmbly and then ctrl + A on that function -> template -> AOB injection 
# we took the values in our aob injection and commented out the function that is taking our health
# poc
alloc(newmem,$1000)

label(code)
label(return)

newmem:
  //mov [eax+000001C4],edx
  jmp return

code:
  mov [eax+000001C4],edx
  jmp return

INJECT:
  jmp newmem
  nop
return:
registersymbol(INJECT)

[DISABLE]

INJECT:
  db 89 90 C4 01 00 00

unregistersymbol(INJECT)
dealloc(newmem)
