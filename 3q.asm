  
  .MODEL SMALL
 
divs macro X1,X2,y
 .data  
  mov di,y
 
  mov ah,0 
 .code

start:
 mov cx,2 
l1: 
mov ax,X1 
mov bx,X2   ;save the value in regs
mov dx,0
cmp cx,ax   ; cmp if i=x1,i=x2 
cmp cx,bx
ja l2  
div cx 
cmp dx,0     ;x1\i if rem ==0 check if also x2\i rem==0
jne l4     ; if not just inc i(l4) and go back
mov ax,bx 
div cx 
cmp dx,0
jne l4
add DI,cx  ; add i to sum 
 
inc cx   ; i++

jmp l1

 l4:
 inc cx
 jmp l1

l2:    

  
  mov ax,DI   ; the final sum in ax
  mov bl,al
  mov ah,0
  shr al,4
  or al,30h
  mov ah,2
  mov dl,al
  int 21h
  mov al,bl
  and al,0fh
  or al,30h
  mov dl,al
  int 21h
  

ENDM
DIVS 2,10,0
         
ret
       
