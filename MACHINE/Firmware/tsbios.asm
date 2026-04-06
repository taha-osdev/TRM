; Firmware
; TSBIOS
JMP 97 ; 1. adres PC başladı, maine atlıyor

RESET_REGS:
    ; Core 1 Sıfırlama
    MOV c1 r0 r1
    MOV c1 r0 r2
    MOV c1 r0 r3
    MOV c1 r0 r4
    MOV c1 r0 r5
    MOV c1 r0 r6
    MOV c1 r0 r7
    MOV c1 r0 r8
    MOV c1 r0 r9
    MOV c1 r0 r10
    MOV c1 r0 r11
    MOV c1 r0 r12
    MOV c1 r0 r13
    MOV c1 r0 r14
    MOV c1 r0 r15

    ; Core 2 Sıfırlama
    MOV c2 r0 r1
    MOV c2 r0 r2
    MOV c2 r0 r3
    MOV c2 r0 r4
    MOV c2 r0 r5
    MOV c2 r0 r6
    MOV c2 r0 r7
    MOV c2 r0 r8
    MOV c2 r0 r9
    MOV c2 r0 r10
    MOV c2 r0 r11
    MOV c2 r0 r12
    MOV c2 r0 r13
    MOV c2 r0 r14
    MOV c2 r0 r15

    ; Core 3 Sıfırlama
    MOV c3 r0 r1
    MOV c3 r0 r2
    MOV c3 r0 r3
    MOV c3 r0 r4
    MOV c3 r0 r5
    MOV c3 r0 r6
    MOV c3 r0 r7
    MOV c3 r0 r8
    MOV c3 r0 r9
    MOV c3 r0 r10
    MOV c3 r0 r11
    MOV c3 r0 r12
    MOV c3 r0 r13
    MOV c3 r0 r14
    MOV c3 r0 r15

    ; Core 4 sıfırlama
    MOV c4 r0 r1
    MOV c4 r0 r2
    MOV c4 r0 r3
    MOV c4 r0 r4
    MOV c4 r0 r5
    MOV c4 r0 r6
    MOV c4 r0 r7
    MOV c4 r0 r8
    MOV c4 r0 r9
    MOV c4 r0 r10
    MOV c4 r0 r11
    MOV c4 r0 r12
    MOV c4 r0 r13
    MOV c4 r0 r14
    MOV c4 r0 r15
    RET

VAR rmVR 1
RESET_RAM:
    BIF 81 c1 carry
    RMA rmVR
    RMS c1 r0
    ADI c1 r1 1
    SET rmVR c1 r1 
    JMP 75
    MOV c1 r0 r1
    RET

RESET_FLAGS:
    ; Flagları sıfırlamak için her corede 0+0 işlemi döndürülecek
    ADD c1 r3 r1 r2 ; Registerler resetlendiği için zaten sıfır
    ADD c2 r3 r1 r2
    ADD c3 r3 r1 r2
    ADD c4 r3 r1 r2
    RET

VAR readyText 2 ; BIOS hazır numarası
IO_START:
    ; Zaten önceden RAM'i sıfırlamıştık
    LDI c1 r1 1 ; BIOS hazır çıktısı gidecek
    RMA 4092
    RMS c1 r1 ; Number display seçildi
    RMA 4092
    PSR 1 ; number olduğunu porttan gönderiyoruz
    LDI c1 r2 readyText
    RMA 4093
    RMS c1 r2
    RMA 4093
    PSR 2 ; Numberde gönderildi ekranda gözükecek

    MOV c1 r0 r1 ; Çıktıyı temizle
    MOV c1 r0 r2
    RMA 4092
    RMS c1 r0
    RMA 4093
    RMS c1 r0
    RET

VAR bootloaderAddr 98 ; değeri sonra atıcaz
MAIN:
    CLL RESET_REGS
    CLL RESET_RAM
    CLL RESET_FLAGS
    CLL IO_START
    JMP bootloaderAddr ; Bootloader başlangıcı, program sonu.
CLL MAIN