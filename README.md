

<div align="center">

<img src="https://github.com/billyawan/prakmds/assets/142286540/eae03ac9-ae5e-41a2-a2a8-6e6a08d2a246" width="337" height="250">



# BRI Liga 1 Indonesia 

<p align="center">
    
# 🧦: Menu

</p>

[Tentang](#newspaper-tentang)
•
[Deskripsi Project](#open_book-Project)
•
[Dokumen](#books-Dokumen)
•
[Visualisasi Data Scraping](#bar_chart-visualisasi-data-scraping)
•
[PPT](#computer-PPT)
•
[Pengembang](#compass-Pengembang)


</div>

# :newspaper: Tentang

**Sekilas Tentang Liga1**

<p align="justify">
Liga 1 atau yang juga dikenal sebagai BRI Liga 1 karena alasan sponsor oleh Bank Rakyat Indonesia, adalah liga profesional tingkat pertama dalam sistem liga sepak bola Indonesia. Liga 1 diikuti oleh 18 klub dan menggunakan sistem promosi dan degradasi, dengan PT Liga Indonesia Baru sebagai operator resmi liga
</p>


## :open_book: Project 

    
<div align="center">

<img src="https://github.com/billyawan/prakmds/assets/142286540/4cfc9e10-fee1-4cc9-aa7a-0b8f51bcac95" width="337" height="150">

</p>

<p align="justify">
Project praktikum ini mencakup scraing pada website https://ligaindonesiabaru.com/table/index/BRI_LIGA_1_2022-2023. website tersebut merupakan website "Liga Indonesia" yang menyediakan informasi mengenari berita terkini seputar Liga Indoneisa, Jadwal, Klasemen, dan lain-lain.
</p>


</div>

<p align="justify">
Data yang akan discraping pada projek ini mencakup beberapa hal seperti yang terurai di Bawah ini;
 </p>

 <p align="justify">
      
+ **Menang**	: Frekuensi menang dari sebuah tim
+ **Seri**	: Frekuensi seri dari sebuah tim
+ **Kalah**	: Frekuensi kalah dari sebuah tim
+ **GF**	: Goals For, frekuensi gol yang berhasil dicetak tim
+ **GA**	: Goals Against. frekuensi frekuensi total kebobolan gol 	  oleh pihak lawan. 
+ **GD**	: Goals Difference, selisih antara GF dan GA

</p>


# :books: Dokumen
Berikut adalah salah satu contoh dokumen di MongoDB untuk Tim Liga1 :
```mongodb
{
  _id: ObjectId('6666e9c13940de3fe0072061'),
  team: 'PERSEBAYA',
  menang: 15,
  kalah: 12,
  seri: 7,
  GF: 52,
  GA: 45,
  GD: 7,
  poin: 52
}
```

## :bar_chart: Visualiasi-Data-Scraping
Berikut merupakan link data visualisasi dari hasil scraping : 
+ [IBL(Indonesian Basket League) Data Scraping and Visualization](https://rpubs.com/alifviansyah/iblscraping)


## :computer: PPT
Berikut adalah link powerpoint yang memuat projek ini :




## :compass: Pengembang
+ [Billy](https://github.com/billyawan) (G1501231034)
