# w3_homework

Merhaba,

Odev bi dosyadan olusmali. O dosya icinde bir RubyGem ve o RubyGem'ini kullanan bir Ruby projesi olmali. Ruby projesinin icinde ise istediginiz kadar dosya olabilir o sizin odevi nasil tasarladiginiza bagli ama ben kodu bilgisayarima indirdigim zaman sadece bir Ruby dosyasi calistirmak istiyorum. Yani demek istedigim `$ ruby homework.rb` calistiracagim ve projede neler istedimse yapmasini istiyorum.

## Odev

### Araba Kayit Sistemi

### Ekleme

```
$ ruby auto_record_system.rb
#=> Plaka:
# 34 AA 1010
#=> Model:
# OPEL
#=> Ad/Soyad:
# Kemalettin Tugcu
#=> 34 AA 1010 vehicle was added.

```

Burada alacaginiz bilgileri bir `yml` dosyasina yazmanizi istiyorum. Dosyanin icinde yazilacaklar su sekilde olmali

```
Tom Hardy - Istanbul - OPEL - 34 AA 1010
Daniel Radcliffe - Konya - MERCEDES - 42 AA 0101
JENIFER LOPEZ - ORDU - RENOAULT - 52 AB 4444
```

Dosyada olmasi gerekenler bunlar ama format bu sekilde olmasi gerekmiyor. Kisacasi dosyada isim soyisim, Il, Aracin modeli, Aracin plakasi olmali.

Plakayi alip, il bulmaniz icin bir RubyGem yazmaniz gerekiyor. Bu gem plakadaki il kodunu alacak ve il adini donecek. Siz de bunu Ruby projenizde kullacaksaniz. Plakalari ve illeri okumak icin `plates.json` dosyasini kullanabilirsiniz.

Bu projede bir takim validation'lar var. Onlar da su sekilde;

```
1. validation
  99KK001
    Plaka formati uygun degil. (01-81 arasinda giriniz) [Ekrana bu yazacak]
2. validation:
  Model:
    KAMIL
      Bulunmayan arac modeli. [Ekrana bu yazacak]
3. validation:
  Plaka:
    34 AA 1010
      Bu plakali arac var. [Ekrana bu yazacak]

```

Birinci validation'da plakanin ilk sayi girilen yeri 1 ile 81 arasinda olmali. Bunlarin disinda olursa validation mesaji gorulecek ve program kapanacak.
Ikinci validation'da projede olan `models.json` dosyasi icindeki modeller haric model girilirse validation mesaji donecek ve program kapanacak.
Ucuncu validation'da ise yazdigin `yml` dosyasindaki aracla ayni plakaya sahip arac girilemez olacak. Girilirse bu validation mesaji ekrana basacak ve program kapanacak.

### Arama

Bir araci plakasi ile arabilmeliyiz. Eger arac listemizde yoksa uyari ekrani cikmali.

```
$ ruby auto_record.rb -s '34 AA 1010'
#=> 34 AA 1010 plakali arac sistemde yok.

$ ruby auto_record.rb -s '34 AA 1010'
#=> Tom Hardy - Istanbul - OPEL - 34 AA 1010

```

