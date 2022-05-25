; Tugas Tambahan Modul 3 dan 4 Praktikum Sistem Benam
; Irfan Arif Maulana (1906379270)
; Teknik Elektro Universitas Indonesia 2021
; 2 Oktober 2021

; Song:
; "Yubikiri-Genman" - Mili

.model small 
.stack 0E000h           
.data

  C0  dw 9121
  D0  dw 8126
  E0  dw 7239
  F0  dw 6833
  G0  dw 6087
  A0  dw 5423
  Bb0 dw 5119
  
  C1  dw 4560 ; middle C
  D1  dw 4063
  E1  dw 3619 
  F1  dw 3416
  G1  dw 3043
  A1  dw 2711
  Bb1 dw 2559

  C2  dw 2280
  D2  dw 2031
  E2  dw 1809
  F2  dw 1715
  G2  dw 1521
  A2  dw 1355
  Bb2 dw 1292

  C3  dw 1140

  clock equ es:6Ch  ; clock pada es 
  tone dw ?         ; deklarasi variabel tone yang kosong
    
.code
  
  delay proc                  ; untuk memberikan delay pada lagu
    push ax               
    mov ax,40h               
    mov es,ax                 
    mov ax,[clock]
    
    Ketukawal:
      cmp ax, [clock]
      mov cx, 2               
      je Ketukawal
    
    Loopdelay:
      mov ax, [clock]
      ketuk:
        cmp ax,[clock]
        je ketuk
        loop Loopdelay
        pop ax
      ret
  delay endp   

  ; untuk membunyikan suara oleh sound card  
  sounder proc
    push ax
    in al, 61h
    or al, 00000011b          ; mengakses soundcard
    out 61h, al 	            ; mengirim control word untuk ganti frekuensi
    mov al, 0B6h
    out 43h, al
    mov ax, [tone]            ; tone merupakan acuan untuk mengambil nada dari acuan
    out 42h, al               ; mengirim lower byte
    mov al, ah
    out 42h, al               ; mengirim upper  byte
    pop ax
    ret
  sounder endp

  ;agar suaranya mati
  matisuara proc             
      in al,61h
      and al, 11111100b       ; menutup soundcard (invers dari akses soundcard)
      out 61h, al
      ret
  matisuara endp 

  pencet macro p1
      push bx
      mov bx,[p1]             ; memasukkan parameter berupa not yang ditekan ke bx
      mov [tone],bx           ; memasukkan bx ke tone agar bisa dibunyikan
      pop bx
      call sounder            ; memanggil sounder agar hasil insertion ke bx dapat dibunyikan
  endm 

  intro1 macro
    pencet C2
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet G1
    eighth
    call matisuara

    pencet E2
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet F2
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet C2
    eighth
    call matisuara
  endm

  intro2 macro
    pencet C2
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet G1
    eighth
    call matisuara

    pencet E2
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet F2
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet G2
    eighth
    call matisuara
  endm

  verse1 macro
    ; 4 bars
    pencet F1
    half
    quarter
    call matisuara

    pencet C1
    eighth
    call matisuara

    pencet G1
    eighth
    half
    eighth
    call matisuara

    pencet G1
    eighth
    call matisuara

    pencet A1
    eighth
    call matisuara

    pencet F1
    eighth
    half
    quarter
    call matisuara

    pencet C2
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet E1
    quarter
    eighth
    call matisuara

    pencet F1
    eighth
    quarter
    call matisuara

    pencet G1
    quarter
    call matisuara

    ; 4 bars
    pencet F1
    quarter
    eighth
    call matisuara

    pencet C2
    eighth
    quarter
    call matisuara

    pencet F1
    quarter
    call matisuara

    pencet E1
    quarter
    eighth
    call matisuara

    pencet F1
    eighth
    quarter
    call matisuara

    pencet G1
    quarter
    call matisuara

    pencet F1
    quarter
    eighth
    call matisuara

    pencet C2
    eighth
    quarter
    call matisuara

    pencet F1
    quarter
    call matisuara

    pencet G1
    half
    call matisuara

    pencet A1
    quarter
    call matisuara

    pencet E1
    quarter
    call matisuara
  endm

  verse2 macro
    ; 4 bars
    pencet F1
    half
    quarter
    call matisuara

    pencet C1
    eighth
    call matisuara

    pencet G1
    eighth
    half
    eighth
    call matisuara

    pencet G1
    eighth
    call matisuara

    pencet A1
    eighth
    call matisuara

    pencet F1
    eighth
    half
    quarter
    call matisuara

    pencet C2
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet E1
    quarter
    eighth
    call matisuara

    pencet F1
    eighth
    quarter
    call matisuara

    pencet G1
    quarter
    call matisuara

    ; 4 bars
    pencet F1
    quarter
    eighth
    call matisuara

    pencet C2
    eighth
    quarter
    call matisuara

    pencet F1
    quarter
    call matisuara

    pencet E1
    quarter
    eighth
    call matisuara

    pencet F1
    eighth
    quarter
    call matisuara

    pencet G1
    quarter
    call matisuara

    pencet F1
    quarter
    eighth
    call matisuara

    pencet C2
    eighth
    quarter
    call matisuara

    pencet F1
    quarter
    call matisuara

    pencet G1
    half
    call matisuara

    pencet A1
    quarter
    eighth
    call matisuara

    pencet E1
    eighth
    call matisuara
  endm

  prechorus1 macro
    ; 4 bars
    pencet F1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet E1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet D1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet C1
    quarter
    eighth
    call matisuara

    pencet F0
    eighth
    call matisuara

    pencet E0
    quarter
    call matisuara

    pencet F0
    quarter
    call matisuara

    pencet G0
    quarter
    call matisuara

    pencet C1
    quarter
    call matisuara

    pencet A0
    half
    quarter
    call matisuara

    pencet A0
    quarter
    call matisuara

    ; 4 bars
    pencet F1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet E1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet D1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet C1
    quarter
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet F0
    eighth
    call matisuara

    pencet E0
    half
    call matisuara

    pencet F0
    half
    call matisuara

    pencet G0
    half
    call matisuara

    pencet C1
    half
    call matisuara
  endm

  prechorus2 macro
    ; 4 bars
    pencet F1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet E1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet D1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet C1
    quarter
    eighth
    call matisuara

    pencet F0
    eighth
    call matisuara

    pencet E0
    quarter
    call matisuara

    pencet F0
    quarter
    call matisuara

    pencet G0
    quarter
    call matisuara

    pencet C1
    quarter
    call matisuara

    pencet A0
    half
    quarter
    call matisuara

    pencet A0
    quarter
    call matisuara

    ; 4 bars
    pencet F1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet E1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet G1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet F1
    quarter
    eighth
    call matisuara

    pencet A0
    eighth
    call matisuara

    pencet E1
    half
    call matisuara

    pencet F1
    half
    call matisuara

    pencet G1
    half
    call matisuara

    pencet C2
    quarter
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara
  endm

  chorus macro
    ; 4 bars
    pencet C2
    quarter
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet F1
    quarter
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet G1
    quarter
    eighth
    call matisuara

    pencet Bb1
    eighth
    call matisuara

    pencet A1
    quarter
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet C2
    quarter
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet C2
    quarter
    call matisuara

    pencet C2
    eighth
    call matisuara

    pencet C2
    quarter
    eighth
    call matisuara

    pencet D2
    eighth
    call matisuara

    pencet C2
    quarter
    eighth
    call matisuara

    pencet F1
    eighth

    ; 4 bars
    pencet E1
    quarter
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet F1
    quarter
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet G1
    quarter
    eighth
    call matisuara

    pencet A1
    eighth
    call matisuara

    pencet A1
    quarter
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet E1
    eighth
    call matisuara

    pencet F1
    quarter
    call matisuara

    pencet G1
    eighth
    quarter
    call matisuara

    pencet C1
    eighth
    call matisuara

    pencet A1
    eighth
    half
    call matisuara

    pencet G1
    half
    call matisuara
  endm

  preverse macro
    pencet E1
    quarter
    eighth
    call matisuara

    pencet C1
    eighth
    call matisuara

    pencet G1
    quarter
    call matisuara

    pencet C1
    quarter
    call matisuara

    pencet F1
    quarter
    call matisuara

    pencet C1
    quarter
    call matisuara

    pencet G1
    quarter
    call matisuara

    pencet A1
    quarter
    call matisuara

    pencet F1
    half
    half
    call matisuara

    pencet E1
    half
    quarter
    eighth
    call matisuara

    pencet C1
    eighth
    call matisuara
  endm

  outro macro
    pencet C2
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet G1
    eighth
    call matisuara

    pencet E2
    eighth
    call matisuara

    pencet F1
    eighth
    call matisuara

    pencet F2
    eighth
    call matisuara

    pencet G2
    eighth
    call matisuara

    pencet C3
    eighth
    call matisuara

    pencet F2
    half
    half
    half
    half
    call matisuara
  endm

  eighth macro
    call delay
  endm

  quarter macro
    call delay
    call delay
  endm

  half macro
    call delay
    call delay
    call delay
    call delay
  endm

.startup 

  ; bar 1 - 8
  intro1
  intro1
  intro1
  intro2

  intro1
  intro1
  intro1
  intro2

  ; bar 9 - 24
  verse1
  verse2

  ; bar 25 - 40
  prechorus1
  prechorus2

  ; bar 41 - 48
  chorus
  preverse

  ; outro
  intro1
  intro1
  intro1
  intro2

  intro1
  intro1
  intro1
  intro2

  intro1
  intro1
  intro1
  intro2

  intro1
  intro1
  intro1
  outro

.exit

end