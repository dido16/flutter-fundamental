class Barang {
  final int id;
  final String namaBarang;
  final String foto;
  final int stok;
  final double rating;
  final int harga;
  final String deskripsi;
  final String kategori;

  const Barang({
    required this.id,
    required this.namaBarang,
    required this.foto,
    required this.stok,
    required this.rating,
    required this.harga,
    required this.deskripsi,
    this.kategori = 'Makanan',
  });

  /// Getter untuk menjaga kompatibilitas dengan kode sebelumnya
  // ignore: non_constant_identifier_names
  String get nama_barang => namaBarang;

  /// Format harga dalam Rupiah (e.g. Rp 25.000)
  String get formattedHarga {
    final str = harga.toString();
    final regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    final formatted = str.replaceAllMapped(regex, (match) => '${match[1]}.');
    return 'Rp $formatted';
  }
}