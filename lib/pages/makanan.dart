class Makanan {
  String nama;
  int harga;
  String gambar;
  String? deskripsi;

  Makanan(this.nama, this.harga, {required this.gambar, this.deskripsi});

  static List<Makanan> dummyData = [
    Makanan("Sate", 10000,
        deskripsi: "Rasanya enak bangett", gambar: 'sate.jpeg'),
    Makanan("Nasi Kebuli", 20000,
        gambar: "kebuli.jpeg", deskripsi: "Nasinya rasanya timur bangett"),
    Makanan("Nasi Padang", 10000,
        gambar: "padang.jpeg", deskripsi: "Nasi padang murah"),
    Makanan("Nasi Kuning", 8000,
        deskripsi: "Nasi kuning enak", gambar: 'makanan.jpeg'),
  ];
}
