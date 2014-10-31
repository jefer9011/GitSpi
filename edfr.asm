            list        p=16f877a
            #include    <p16f877a.inc>

            __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _BOREN_ON & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

sil         EQU         28h
sil2        EQU         29h

            ORG         00H
            GOTO        PUERTOS
            ORG         05H

PUERTOS     BSF         STATUS,RP0
            BCF         STATUS,RP1  
            MOVLW       b'10010001'
            MOVWF       TRISC
            MOVLW       b'00000000'
            MOVWF       TRISB
            MOVLW       h'0F'
            MOVWF       ADCON0
            MOVLW       h'F0'
            MOVWF       sil
            MOVWF       sil2
            BCF         STATUS,RP0
            BCF         STATUS,RP1

INICIO
            MOVLW       b'11111111'
            MOVWF       PORTC
            MOVFW       sil
            ANDLW       b'11111111'
            CALL        DATO
            MOVWF       PORTB
            INCF        sil,f
            MOVFW       sil
            MOVLW       .15
            XORWF       sil,w
            BTFSC       STATUS,Z
            CLRF        sil
            GOTO        UNO
            GOTO        UNO
UNO
            MOVLW       b'11100010'
            MOVWF       PORTC
            MOVFW       sil2
            ANDLW       b'11001100'
            CALL        DATO
            MOVWF       PORTB
            INCF        sil2,f
            MOVFW       sil2
            MOVLW       .15
            XORWF       sil2,w
            BTFSC       STATUS,Z
            CLRF        sil2
            GOTO        INICIO
            GOTO        INICIO
DATO
            addwf       PCL,F
Tabla       retlw	b'00000001'
            retlw	b'00000011'
            retlw	b'00000111'
            retlw	b'00001111'
            retlw	b'00011111'
            retlw	b'00111111'
            retlw	b'01111111'
            retlw	b'11111111'
                retlw   b'00000000'
                retlw	b'11111111'
                retlw	b'00000000'
                retlw	b'00000000'
                retlw	b'00000000'
                retlw	b'00000000'
                retlw	b'00000000'
                retlw	b'10101010'

                END




