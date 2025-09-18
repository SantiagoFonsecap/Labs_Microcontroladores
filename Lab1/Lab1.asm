 ;Primera sección
    include P18F4550.inc
 ;Segunda sección (Configuración del microcontrolador) #NO se necesita en el lab1
 
 
 ;Para conectar un oscilador externo
 ;Se elige un CONFIG FOSC de acuerdo a que señal de reloj se ha de usar
 ;CONFIG FOSC = INTOSC_EC
 ;CONFIG FOSC = EC_EC
 ;CONFIG FOSC = XT_XT	    ;F<4MHz se usa  XT_XT   F>=4MHz se usa HS
 ;CONFIG WDT = OFF    ;Apaga el perro guardían  
 
 ;Tercera sección
 aux1 equ 0h ;enteras de 8 bits sin signo
 aux2 equ 1h
 aux3 equ 2h
 aux4 equ 3h
 
 
 ;Cuarta sección
Inicio
 
;Punto1
 ;Sumar 3 a la variable aux1 cargada previamente con el valor de 7.
    movlw .7
    movwf aux1 ;aux1 <- 7  
    
    movlw .3  
    addwf aux1
  
;Punto2
 ;Sumar las variables aux1 y aux2 previamente cargadas con los valores de 8 y 10 respectivamente.
    movlw .8 
    movwf aux1
    movlw .10 
    movwf aux2
    
    movf aux1, W
    addwf aux2  
    
;Punto3
 ;Restar a la constante 9 la variable aux1 cargada previamente con el valor de 5.
    movlw .5 ;aux1 <- 5
    movwf aux1
    
    movf aux1, w
    sublw .9 ;
    
    
;Punto4  
 ;Restar la variable aux1 a la variable aux2 previamente cargadas con los valores de 6 y 4 respectivamente.
    movlw .6
    movwf aux1	;aux1 <- 6  
    movlw .4
    movwf aux2	;aux2 <- 4  
    
    movf aux1, W
    subwf aux2, W;aux2 <- aux2 - aux1
    
    movwf aux2
    
;Punto5
 ;Multiplicar a la constante 4 la variable aux1 cargada previamente con el valor de 5.
    movlw .5
    movwf aux1
    
    movlw .4
    mulwf aux1
    
    movf PRODL, W
    movwf aux1
    
;Punto6
 ;Multiplicar la variable aux1 a la variable aux2 previamente cargadas con los valores de 12 y 15 respectivamente.
    movlw .12
    movwf aux1
    movlw .15
    movwf aux2
    
    movf aux1, W
    mulwf aux2
    
    movf PRODL, W
    movwf aux2
    
;Punto7
 ;Realizar el complemento a 1 de la variable aux1 cargada previamente con el valor de 12.
    movlw .12
    movwf aux1
    
    comf aux1
    
;Punto8
 ;Realizar el complemento a 2 de la variable aux1 cargada previamente con el valor de 12.
    movlw .12
    movwf aux1
    
    negf aux1

;Punto9
 ;Realizar la O lógica ?bitwise? entre el valor de 7 y la variable aux1 cargada previamente con el valor de 35.
    movlw .35
    movwf aux1
    
    movlw .7
    iorwf aux1, W
    movwf aux1

;Punto10
 ;Realizar la O lógica ?bitwise? entre las variables aux1 y aux2 cargadas previamente con los valores de 20 y 56 respectivamente.
    movlw .20
    movwf aux1
    movlw .56
    movwf aux2
    
    movf aux1, W
    iorwf aux2
    movwf aux4

;Punto11
 ;Realizar la Y lógica ?bitwise? entre el valor de 15 y la variable aux1 cargada previamente con el valor de 62.
    movlw .62
    movwf aux1
    movlw .15	
    
    andwf aux1
	

;Punto12
 ;Realizar la Y lógica ?bitwise? entre las variables aux1 y aux2 cargadas previamente con los valores de 100 y 45 respectivamente.
    movlw .100
    movwf aux1
    movlw .45
    movwf aux2
    
    movf aux1, W
    andwf aux2      
    
;Punto13
 ;Realizar la O lógica exclusiva ?bitwise? entre el valor de 1 y la variable aux1 cargada previamente con el valor de 120.
    movlw .120
    movwf aux1
    
    xorlw .1

;Punto14
 ;Realizar la O lógica exclusiva ?bitwise? entre las variables aux1 y aux2 cargadas previamente con los valores de 17 y 90 respectivamente.
    movlw .90
    movwf aux1
    movlw .17
    movwf aux2
    
    movf aux2, W
    xorwf aux1
    
;Punto15
 ;Seguido se debe realizar la siguiente operación, con aux1, aux2 y aux3 previamente cargadas con 25, 40 y 103 respectivamente:
	    ;aux4 ? (aux1 OR aux2) AND (aux3 XOR 0xD0)
    movlw .25
    movwf aux1
    movlw .40
    movwf aux2
    movlw .103
    movwf aux3
    
    movlw 0xD0
    xorwf aux3, 1
    movf aux1, W
    iorwf aux2, 0
    andwf aux3,0
    movwf aux4
    

;Punto16
 ;Finalmente se debe realizar la siguiente operación, con aux1, aux2 y aux3 previamente cargadas con 18, 60 y 16 respectivamente:
	    ;aux4 ? (aux1 + aux2) ? 3 ? (aux3 ? 0b11010)
    movlw .18
    movwf aux1
    movlw .60
    movwf aux2
    movlw .16
    movwf aux3
    
    movf aux1, W
    addwf aux2, W
    movwf aux4
    movf aux3, W 
    sublw .26
    mullw .3
    movf PRODL, W
    ; Suma final
    addwf aux4, W
    movwf aux4
    
    goto Inicio
	    
end

    
    ;Para la presentación subir solo pseudocódigo y las variables
    
    ;Cap 26 sale el set de instrucciones, si sale algo tipo '... f, d, a' se ignora la 'a'  