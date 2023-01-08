

odd macro x   
mov ax,x 
mov cx,0
mov di ,0 
MOV SI,0
w1:

mov bx,10 ;to dive be 10 for digits
cwd
div bx 
push ax 
mov ax ,dx 
mov bx,2 ;to check if num is odd 
cwd 
div bx 
cmp dx,1
pop ax  
je w3
cmp dx,0    ;to check if num is even 
je h1

jne w5
w3:
inc cx 
cmp ax ,0  ; if ax=0 then its done 
je w5
jmp w1 
h1:
inc si
cmp ax ,0  ; if ax=0 then its done 
je w5
 
jmp w1

w5: 

MOV AH,2
MOV DL,'0'
INT 21H
MOV DL,'.'
INT 21H
add si,cx
MOV BX,10 ; cx*10 \si
mov ax,cx 
MUL BX
cwd
div si
MOV BL,AL
ADD AL,48
mov ah ,2 
MOV DL,AL
INT 21H         
ENDM

odd 26223








