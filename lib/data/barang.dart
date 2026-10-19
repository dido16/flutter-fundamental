import 'package:pml/domain/barang.dart';

final List<Barang> listBarang = [
  const Barang(
    id: 1,
    namaBarang: "Ayam Goreng Krispi",
    foto:
        "https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=600&q=80",
    stok: 15,
    rating: 4.8,
    harga: 25000,
    deskripsi:
        "Ayam goreng krispi dengan bumbu rempah khas Nusantara yang meresap hingga ke dalam tulang, disajikan dengan sambal korek pedas dan lalapan segar.",
    kategori: "Makanan",
  ),
  const Barang(
    id: 2,
    namaBarang: "Bebek Goreng Madura",
    foto:
        "https://images.unsplash.com/photo-1518492104633-130d0cc84637?auto=format&fit=crop&w=600&q=80",
    stok: 8,
    rating: 4.9,
    harga: 38000,
    deskripsi:
        "Bebek goreng empuk dengan bumbu hitam rempah khas Madura yang gurih dan wangi, disajikan bersama nasi hangat dan serundeng gurih.",
    kategori: "Makanan",
  ),
  const Barang(
    id: 3,
    namaBarang: "Gedang Goreng Keju",
    foto:
        "https://images.unsplash.com/photo-1587314168485-3236d6710814?auto=format&fit=crop&w=600&q=80",
    stok: 20,
    rating: 4.7,
    harga: 18000,
    deskripsi:
        "Pisang olahan manis khas yang digoreng krispi dengan tepung vanila renyah, ditaburi keju cheddar melimpah dan susu kental manis cokelat.",
    kategori: "Camilan",
  ),
  const Barang(
    id: 4,
    namaBarang: "Sate Ayam Madura",
    foto:
        "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?auto=format&fit=crop&w=600&q=80",
    stok: 12,
    rating: 4.9,
    harga: 30000,
    deskripsi:
        "10 tusuk sate ayam daging tebal yang dipanggang dengan arang kelapa, disiram bumbu kacang lembut gurih, kecap manis, dan irisan bawang merah.",
    kategori: "Makanan",
  ),
  const Barang(
    id: 5,
    namaBarang: "Nasi Goreng Spesial",
    foto:
        "https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=600&q=80",
    stok: 10,
    rating: 4.8,
    harga: 22000,
    deskripsi:
        "Nasi goreng bumbu tradisional dengan suwiran ayam, bakso, sosis, dan topping telur mata sapi setengah matang serta kerupuk udang renyah.",
    kategori: "Makanan",
  ),
  const Barang(
    id: 6,
    namaBarang: "Mie Goreng Seafood",
    foto:
        "https://images.unsplash.com/photo-1585032226651-759b368d7246?auto=format&fit=crop&w=600&q=80",
    stok: 6,
    rating: 4.6,
    harga: 28000,
    deskripsi:
        "Mie kenyal ditumis dengan udang segar, cumi, sayuran segar, dan saus tiram spesial yang memberikan cita rasa oriental lezat.",
    kategori: "Makanan",
  ),
  const Barang(
    id: 7,
    namaBarang: "Es Teh Manis Segar",
    foto:
        "https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&w=600&q=80",
    stok: 50,
    rating: 4.9,
    harga: 6000,
    deskripsi:
        "Seduhan teh melati wangi dengan gula tebu asli dan es batu melimpah. Pelepas dahaga yang sempurna setelah menyantap makanan lezat.",
    kategori: "Minuman",
  ),
  const Barang(
    id: 8,
    namaBarang: "Jus Alpukat Kocok",
    foto:
        "https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=600&q=80",
    stok: 14,
    rating: 4.8,
    harga: 16000,
    deskripsi:
        "Daging alpukat mentega segar yang kental dan legit, dipadukan dengan es serut dan lelehan cokelat kental manis.",
    kategori: "Minuman",
  ),
];

/// Alias untuk kompatibilitas kode lama
// ignore: non_constant_identifier_names
final list_barang = listBarang;