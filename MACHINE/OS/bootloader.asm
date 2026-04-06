; TRM için örnek TRM-OS bootloaderi
JMP 139 ; Bootloader başlangıç adresimiz
VAR KernelAddr 142

SANITY_CHECK:
    ; Flag zero kontrolü
    BIF 4 c1 zero
    ADI c1 r1 r0 r0
    BIF 6 c2 zero
    ADI c2 r1 r0 r0
    BIF 8 c3 zero
    ADI c3 r1 r0 r0
    BIF 10 c4 zero
    ADI c4 r1 r0 r0

    ; RAM kontrolü
    RMA 1
    RML c1 r1
    BIF 16 c1 zero
    ADI c1 r1 r0 r0 ; 1 resetlenmişse hepsi resetlenmiştir gibi düşünüyorum
    
    RET

VAR ProgramAddr
PROGRAM_LOAD:
    JMP ProgramAddr

VAR Message 3 ; Bootloaded mesajı
; 3 başarılı, 4 başarısız
BOOT_MESSAGE:
    LDI c1 r1 1 ; Bootloader hazır çıktısı gidecek
    RMA 4092
    RMS c1 r1 ; Number display seçildi
    RMA 4092
    PSR 1 ; number olduğunu porttan gönderiyoruz
    LDI c1 r2 Message
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

MAIN: 
    SET Message 4 ; en başta dört
    CLL SANITY_CHECK
    SET ProgramAddr KernelAddr ; kernel adresi
    SET Message 3
    CLL BOOT_MESSAGE
    CLL PROGRAM_LOAD
CLL MAIN