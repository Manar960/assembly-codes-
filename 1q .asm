 org 100h
 
  .MODEL SMALL
 .DATA
 x db 9,5,11,4,7,13,6,-3,8,12
     
 y db 10 dup(0)
 .CODE 

 MOV AH,0
 MOV AX,@DATA
 MOV DS,AX
 LEA di,x
 LEA SI,y 
 mov cx,0 
      
 h1:
 mov ah ,0
 MOV Al,[di] 
 cmp bp,10
 je r  
 CMP Al,0 
 Jg pos
 jle np 


 pos:
 mov cx ,2
 start: 
 push cx
 mov al,[di]
 cmp al,1
 je np
 cmp al,2
 je p
 jne pk     
       
 pk:
 mov bx ,2
 cwd
 push ax 
 div bx
 cmp cx ,ax
 ja p 
 mov al,[di]
 cwd 
 div cx
 cmp dx,0
 je np 
 inc cx
 pop ax
 jmp pk
       
 np:  
 mov al,[si] 
 add al,48
 mov ah,2
 mov dl,al
 int 21h
 inc si
 inc di
 inc bp 
 jmp h1 

 p:
 mov al ,1
 mov [si] ,al
 mov al,[si]
 add al,48
 mov ah,2
 mov dl,al
 int 21h
 inc si
 inc di 
 inc bp
 jmp h1
             
 r:
 .EXIT      
       
 END           
 ret
       


