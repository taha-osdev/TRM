# TRM Architecture - TÜRKÇE

NOT: Bu mimari, cidden çok amatörce bir mimari, ancak bu bilgimle ancak bu kadar oldu.

**TRM Architecture**, deneysel bir 4 çekirdekli CPU mimarisi projesidir. Özel bir komut seti, işlem hattı, bellek yönetimi ve önyükleyici içeren eğitim amaçlı bir yazılım (TSBIOS) içerir.

Bu proje, düşük seviyeli CPU tasarımı, işletim sistemi entegrasyonu ve assembly programlama konularında öğrenme ve deney yapma amacıyla tasarlanmıştır.

Ayrıntılı mimari, işlem hattı aşamaları, komut seti ve bellek sistemi için **[TRM_ARCHITECTURE.txt](TRM_ARCHITECTURE.txt)** dosyasına bakın.

## Özellikler

- Kayıt dosyası, ALU, kaydırıcı birim ve bayrak/dallanma birimi içeren 4 çekirdekli işlemci
- Özel komut seti (TRM ISA)
- İşlem hattı aşamaları: IF, DF, EX, MEM, WB
- MMU ve TLB ile sanal bellek desteği
- Eğitim amaçlı yazılım: TSBIOS
- İşletim sistemi başlatma yükleyicisi
- Ekran ve çevre birimleri için giriş/çıkış port sistemi
