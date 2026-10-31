import 'package:flutter/material.dart';

void main() {
  runApp(const WisataApp());
}

/* MaterialApp: initialRoute + routes (named routes)*/
class WisataApp extends StatelessWidget {
  const WisataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Indonesia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      // Halaman pertama yang dibuka saat aplikasi berjalan
      initialRoute: '/',
      // Daftar seluruh halaman beserta nama rutenya
      routes: {
        '/': (context) => const HomePage(),
        '/pantai': (context) => const PantaiPage(),
        '/gunung': (context) => const GunungPage(),
        '/budaya': (context) => const BudayaPage(),
        '/kuliner': (context) => const KulinerPage(),
        '/detail': (context) => const DetailWisataPage(),
      },
    );
  }
}

/* Model data*/
class Wisata {
  final String kategori; // Pantai / Gunung / Budaya / Kuliner
  final String nama;
  final String deskripsi; // deskripsi singkat (tampil di halaman kategori)
  final String penjelasan; // penjelasan lengkap (tampil di halaman detail)
  final Map<String, String> info; // informasi ringkas (label -> isi)
  final List<String> daya; // hal-hal menarik
  final List<String> tips; // tips berkunjung / menikmati

  const Wisata({
    required this.kategori,
    required this.nama,
    required this.deskripsi,
    required this.penjelasan,
    required this.info,
    required this.daya,
    required this.tips,
  });
}

class MenuItem {
  final String judul;
  final IconData ikon;
  final String rute;
  final MaterialColor warna;
  const MenuItem(this.judul, this.ikon, this.rute, this.warna);
}

const List<MenuItem> daftarMenu = [
  MenuItem('Pantai', Icons.beach_access, '/pantai', Colors.blue),
  MenuItem('Gunung', Icons.terrain, '/gunung', Colors.green),
  MenuItem('Budaya', Icons.theater_comedy, '/budaya', Colors.deepOrange),
  MenuItem('Kuliner', Icons.restaurant, '/kuliner', Colors.red),
];

/* Data wisata*/
const List<Wisata> dataPantai = [
  Wisata(
    kategori: 'Pantai',
    nama: 'Pantai Kuta, Bali',
    deskripsi:
        'Pantai terkenal dengan pasir putih, ombak untuk berselancar, dan sunset yang indah.',
    penjelasan:
        'Pantai Kuta adalah salah satu pantai paling terkenal di Indonesia dan menjadi pintu gerbang pariwisata Bali. Hamparan pasir putihnya yang panjang ramai dikunjungi wisatawan sepanjang tahun. Ombaknya yang konsisten membuat Kuta menjadi tempat belajar berselancar yang populer, sementara sore harinya menyuguhkan pemandangan matahari terbenam yang sangat dicari fotografer.',
    info: {
      'Lokasi': 'Kuta, Kabupaten Badung, Bali',
      'Waktu terbaik': 'April - Oktober, sore hari untuk sunset',
      'Aktivitas': 'Berselancar, berjemur, berjalan santai, belanja',
    },
    daya: [
      'Ombak yang cocok untuk pemula belajar selancar',
      'Pemandangan matahari terbenam yang terkenal',
      'Dekat dengan restoran, kafe, dan pusat belanja',
    ],
    tips: [
      'Gunakan tabir surya dan bawa topi',
      'Perhatikan bendera peringatan arus dan ombak',
      'Jaga barang bawaan di area yang ramai',
    ],
  ),
  Wisata(
    kategori: 'Pantai',
    nama: 'Pantai Pink, Lombok',
    deskripsi:
        'Pantai langka berpasir merah muda dengan air laut jernih, cocok untuk snorkeling.',
    penjelasan:
        'Pantai Pink atau Tangsi berada di ujung timur Pulau Lombok dan merupakan salah satu dari sedikit pantai berpasir merah muda di dunia. Warna unik tersebut berasal dari serpihan koral merah yang bercampur dengan pasir putih. Air lautnya jernih dan tenang sehingga nyaman untuk berenang maupun snorkeling, dengan perbukitan savana di sekelilingnya.',
    info: {
      'Lokasi': 'Desa Sekaroh, Jerowaru, Lombok Timur, NTB',
      'Waktu terbaik': 'April - November, pagi hari',
      'Aktivitas': 'Snorkeling, berfoto, bersantai',
    },
    daya: [
      'Pasir berwarna merah muda yang langka',
      'Air laut jernih dengan terumbu karang di dekat pantai',
      'Suasana yang masih tenang dan alami',
    ],
    tips: [
      'Bawa air minum dan makanan karena warung terbatas',
      'Gunakan kendaraan yang kuat untuk jalur menuju pantai',
      'Jangan mengambil pasir atau koral sebagai oleh-oleh',
    ],
  ),
  Wisata(
    kategori: 'Pantai',
    nama: 'Pantai Tanjung Tinggi, Belitung',
    deskripsi:
        'Pantai dengan batu granit raksasa dan air tenang, lokasi film Laskar Pelangi.',
    penjelasan:
        'Pantai Tanjung Tinggi terletak di Kabupaten Belitung dan dikenal lewat susunan batu granit raksasa yang menjulang di tepi pantai. Pantai ini menjadi terkenal setelah dijadikan lokasi syuting film Laskar Pelangi. Airnya jernih dan relatif tenang, dengan celah-celah di antara bebatuan yang menarik untuk dijelajahi.',
    info: {
      'Lokasi': 'Sijuk, Kabupaten Belitung, Kep. Bangka Belitung',
      'Waktu terbaik': 'Sore hari menjelang matahari terbenam',
      'Aktivitas': 'Menjelajah bebatuan, berenang, berfoto',
    },
    daya: [
      'Formasi batu granit besar yang khas',
      'Air laut jernih dan tenang',
      'Lokasi syuting film Laskar Pelangi',
    ],
    tips: [
      'Gunakan alas kaki karena batu bisa licin',
      'Hati-hati saat memanjat batu, terutama bersama anak-anak',
      'Datang sore hari agar tidak terlalu panas',
    ],
  ),
];

const List<Wisata> dataGunung = [
  Wisata(
    kategori: 'Gunung',
    nama: 'Gunung Bromo, Jawa Timur',
    deskripsi:
        'Gunung berapi aktif dengan lautan pasir dan pemandangan matahari terbit terkenal.',
    penjelasan:
        'Gunung Bromo berada di kawasan Taman Nasional Bromo Tengger Semeru dan dikelilingi lautan pasir yang luas. Wisatawan biasanya berangkat dini hari menuju Penanjakan untuk menyaksikan matahari terbit, lalu turun menuju kawah Bromo. Kawasan ini juga menjadi rumah bagi masyarakat Tengger yang menggelar upacara Yadnya Kasada setiap tahun.',
    info: {
      'Lokasi': 'Probolinggo, Pasuruan, Malang, Lumajang, Jawa Timur',
      'Ketinggian': 'Sekitar 2.329 mdpl',
      'Waktu terbaik': 'April - Oktober, berangkat dini hari',
    },
    daya: [
      'Matahari terbit dari Penanjakan',
      'Lautan pasir dan kawah yang masih aktif',
      'Budaya masyarakat Tengger dan Pura Luhur Poten',
    ],
    tips: [
      'Bawa jaket tebal karena udara sangat dingin',
      'Gunakan masker atau penutup wajah dari debu dan pasir',
      'Sewa jip atau ojek kuda untuk melintasi lautan pasir',
    ],
  ),
  Wisata(
    kategori: 'Gunung',
    nama: 'Gunung Rinjani, Lombok',
    deskripsi:
        'Gunung tertinggi kedua di Indonesia dengan danau kawah Segara Anak.',
    penjelasan:
        'Gunung Rinjani adalah gunung berapi di Pulau Lombok yang menjadi favorit para pendaki. Di dalam kalderanya terdapat Danau Segara Anak yang berwarna biru dan Gunung Barujari yang masih aktif. Pendakian umumnya memakan waktu dua sampai empat hari dengan pemandangan savana, hutan, dan lautan awan.',
    info: {
      'Lokasi': 'Taman Nasional Gunung Rinjani, Lombok, NTB',
      'Ketinggian': 'Sekitar 3.726 mdpl',
      'Waktu terbaik': 'April - November, jalur biasanya ditutup saat musim hujan',
    },
    daya: [
      'Danau Segara Anak di dalam kaldera',
      'Pemandangan matahari terbit dari puncak',
      'Pemandian air panas alami',
    ],
    tips: [
      'Daftar pendakian melalui pengelola taman nasional',
      'Pertimbangkan memakai pemandu dan porter',
      'Latihan fisik terlebih dahulu sebelum mendaki',
    ],
  ),
  Wisata(
    kategori: 'Gunung',
    nama: 'Gunung Merapi, Yogyakarta',
    deskripsi:
        'Salah satu gunung berapi paling aktif di dunia dan ikon wisata alam Yogyakarta.',
    penjelasan:
        'Gunung Merapi terletak di perbatasan Daerah Istimewa Yogyakarta dan Jawa Tengah. Gunung ini sangat aktif dan memiliki peran penting dalam kehidupan serta budaya masyarakat sekitar. Lereng selatannya menawarkan wisata Lava Tour dengan jip, melewati sisa-sisa letusan seperti batu besar, bunker, dan rumah yang pernah terdampak.',
    info: {
      'Lokasi': 'Sleman, DI Yogyakarta dan Jawa Tengah',
      'Ketinggian': 'Sekitar 2.930 mdpl',
      'Waktu terbaik': 'Pagi hari saat langit cerah',
    },
    daya: [
      'Wisata Lava Tour dengan jip',
      'Museum Mini Sisa Hartaku yang menyimpan sisa erupsi 2010',
      'Pemandangan lereng gunung yang hijau',
    ],
    tips: [
      'Periksa status aktivitas gunung sebelum berkunjung',
      'Patuhi batas zona aman dan arahan petugas',
      'Gunakan pemandu atau operator lokal terpercaya',
    ],
  ),
];

const List<Wisata> dataBudaya = [
  Wisata(
    kategori: 'Budaya',
    nama: 'Tari Kecak, Bali',
    deskripsi:
        'Tarian massal diiringi suara "cak" dari puluhan penari pria, mengisahkan Ramayana.',
    penjelasan:
        'Tari Kecak adalah seni pertunjukan khas Bali yang ditampilkan tanpa alat musik gamelan. Iringannya berasal dari suara "cak" yang dilantunkan puluhan penari pria yang duduk melingkar. Pertunjukan ini mengisahkan bagian dari epos Ramayana, seperti penculikan Dewi Sita oleh Rahwana dan perjuangan Rama bersama Hanoman untuk menyelamatkannya.',
    info: {
      'Asal': 'Bali',
      'Jenis': 'Tari kolosal / drama tari',
      'Tempat pertunjukan': 'Pura Uluwatu, Batubulan, Tanah Lot',
    },
    daya: [
      'Suara "cak" yang serempak sebagai pengganti musik',
      'Kisah Ramayana dengan tokoh Rama, Sita, Rahwana, dan Hanoman',
      'Pertunjukan saat matahari terbenam di Pura Uluwatu',
    ],
    tips: [
      'Datang sekitar 30 menit sebelum pertunjukan agar mendapat tempat duduk',
      'Berpakaian sopan karena pertunjukan sering diadakan di area pura',
      'Jaga barang dari monyet di kawasan Uluwatu',
    ],
  ),
  Wisata(
    kategori: 'Budaya',
    nama: 'Wayang Kulit, Jawa',
    deskripsi:
        'Seni pertunjukan boneka kulit yang dimainkan dalang, warisan budaya dunia UNESCO.',
    penjelasan:
        'Wayang kulit adalah seni pertunjukan tradisional Jawa yang menggunakan boneka dari kulit yang dimainkan di balik layar putih oleh seorang dalang. Dalang mengisahkan lakon dari Mahabharata atau Ramayana sambil diiringi gamelan dan sinden. UNESCO telah mengakui wayang sebagai karya agung warisan budaya lisan dan nonbendawi dunia sejak 2003.',
    info: {
      'Asal': 'Jawa (Jawa Tengah, Yogyakarta, Jawa Timur)',
      'Jenis': 'Seni pertunjukan dan sastra lisan',
      'Pengiring': 'Gamelan dan sinden',
    },
    daya: [
      'Keahlian dalang memainkan banyak suara tokoh sekaligus',
      'Nilai moral dan filosofi dalam setiap lakon',
      'Pertunjukan tradisional yang bisa berlangsung semalam suntuk',
    ],
    tips: [
      'Kunjungi museum wayang atau pertunjukan di keraton untuk pengalaman terbaik',
      'Pelajari ringkasan lakon agar lebih mudah mengikuti cerita',
      'Minta penjelasan tokoh kepada pemandu setempat',
    ],
  ),
  Wisata(
    kategori: 'Budaya',
    nama: 'Rumah Gadang, Sumatera Barat',
    deskripsi:
        'Rumah adat Minangkabau dengan atap melengkung menyerupai tanduk kerbau.',
    penjelasan:
        'Rumah Gadang adalah rumah adat suku Minangkabau yang mudah dikenali dari atapnya yang bergonjong, melengkung seperti tanduk kerbau. Rumah ini bukan sekadar tempat tinggal, tetapi pusat kehidupan keluarga besar yang menganut sistem garis keturunan ibu (matrilineal). Contoh yang megah dapat dilihat pada Istano Basa Pagaruyung di Tanah Datar.',
    info: {
      'Asal': 'Suku Minangkabau, Sumatera Barat',
      'Ciri khas': 'Atap gonjong dan ukiran warna-warni',
      'Contoh': 'Istano Basa Pagaruyung, Tanah Datar',
    },
    daya: [
      'Atap gonjong yang menjadi ikon Minangkabau',
      'Ukiran kayu dengan motif flora yang penuh makna',
      'Nilai adat matrilineal yang unik',
    ],
    tips: [
      'Lepas alas kaki sebelum memasuki rumah',
      'Berpakaian sopan dan minta izin sebelum memotret bagian dalam',
      'Kunjungi bersama pemandu untuk memahami makna ukirannya',
    ],
  ),
];

const List<Wisata> dataKuliner = [
  Wisata(
    kategori: 'Kuliner',
    nama: 'Rendang, Sumatera Barat',
    deskripsi:
        'Daging sapi yang dimasak lama dengan santan dan rempah hingga bumbunya meresap.',
    penjelasan:
        'Rendang adalah masakan khas Minangkabau yang dibuat dari daging sapi, dimasak berjam-jam dengan santan dan rempah-rempah hingga kuahnya mengering dan bumbunya meresap sempurna. Proses memasak yang panjang membuat rendang awet disimpan dan menjadi bekal para perantau. Rendang sering disebut sebagai salah satu makanan terlezat di dunia.',
    info: {
      'Asal': 'Minangkabau, Sumatera Barat',
      'Bahan utama': 'Daging sapi, santan, cabai, dan rempah',
      'Cita rasa': 'Gurih, pedas, dan kaya rempah',
    },
    daya: [
      'Dimasak berjam-jam hingga bumbu meresap',
      'Tahan lama sehingga cocok dijadikan oleh-oleh',
      'Biasanya disantap bersama nasi hangat dan sayur daun singkong',
    ],
    tips: [
      'Cicipi rendang di rumah makan Padang atau Pasar Atas Bukittinggi',
      'Pilih rendang kering jika ingin dibawa sebagai oleh-oleh',
      'Padukan dengan sambal hijau agar rasa lebih segar',
    ],
  ),
  Wisata(
    kategori: 'Kuliner',
    nama: 'Gudeg, Yogyakarta',
    deskripsi:
        'Masakan nangka muda bercita rasa manis, disajikan bersama ayam dan telur.',
    penjelasan:
        'Gudeg adalah makanan khas Yogyakarta yang dibuat dari nangka muda (gori) yang dimasak lama dengan santan dan gula jawa. Penggunaan daun jati membuat warnanya kecokelatan dan rasanya semakin khas. Gudeg biasanya disajikan dengan ayam kampung, telur pindang, krecek, dan sambal, dan tersedia dalam versi basah maupun kering.',
    info: {
      'Asal': 'Yogyakarta',
      'Bahan utama': 'Nangka muda, santan, gula jawa',
      'Cita rasa': 'Manis gurih',
    },
    daya: [
      'Warna cokelat alami dari daun jati',
      'Pelengkap lengkap: ayam, telur, krecek, dan sambal',
      'Gudeg kering tahan lebih lama untuk oleh-oleh',
    ],
    tips: [
      'Coba gudeg pagi hari di kawasan Wijilan atau warung malam',
      'Pilih gudeg kering jika ingin dibawa pulang',
      'Tambahkan sambal krecek untuk rasa pedas',
    ],
  ),
  Wisata(
    kategori: 'Kuliner',
    nama: 'Pempek, Palembang',
    deskripsi:
        'Makanan dari ikan dan sagu yang disajikan dengan kuah cuko asam, manis, dan pedas.',
    penjelasan:
        'Pempek adalah makanan khas Palembang yang terbuat dari ikan giling dan tepung sagu. Ada banyak jenisnya, seperti kapal selam yang berisi telur, lenjer, dan adaan. Pempek disajikan dengan cuko, yaitu kuah hitam kental dari gula merah, cuka, bawang putih, dan cabai yang memberi rasa asam, manis, dan pedas.',
    info: {
      'Asal': 'Palembang, Sumatera Selatan',
      'Bahan utama': 'Ikan tenggiri, tepung sagu',
      'Cita rasa': 'Gurih dengan kuah cuko asam manis pedas',
    },
    daya: [
      'Variasi jenis: kapal selam, lenjer, adaan, dan lainnya',
      'Kuah cuko yang menjadi ciri khas',
      'Disajikan dengan mentimun dan mi kuning',
    ],
    tips: [
      'Coba pempek yang digoreng langsung agar tekstur lebih renyah',
      'Pesan kapal selam jika ingin yang berisi telur',
      'Atur kadar pedas cuko sesuai selera',
    ],
  ),
];

final List<Wisata> semuaWisata = [
  ...dataPantai,
  ...dataGunung,
  ...dataBudaya,
  ...dataKuliner,
];

// Mencari data lengkap berdasarkan nama yang dikirim ke halaman detail
Wisata? cariWisata(String nama) {
  for (final w in semuaWisata) {
    if (w.nama == nama) return w;
  }
  return null;
}

/* Halaman Beranda*/
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Indonesia'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.teal.shade50,
            child: const Column(
              children: [
                Text(
                  'Jelajahi Keindahan Nusantara',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Pilih salah satu kategori wisata di bawah ini',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          Expanded(
            // GridView.count: grid dengan jumlah kolom tetap (2 kolom)
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: daftarMenu.map((menu) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: menu.warna.shade50,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    // Navigasi ke halaman sesuai nama rute
                    onTap: () => Navigator.pushNamed(context, menu.rute),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(menu.ikon, size: 64, color: menu.warna),
                        const SizedBox(height: 12),
                        Text(
                          menu.judul,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: menu.warna.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/* Template halaman kategori (dipakai ulang oleh 4 halaman menu)*/
class KategoriPage extends StatelessWidget {
  final String judul;
  final IconData ikon;
  final MaterialColor warna;
  final List<Wisata> daftar;

  const KategoriPage({
    super.key,
    required this.judul,
    required this.ikon,
    required this.warna,
    required this.daftar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata $judul'),
        backgroundColor: warna,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Header: ikon pendukung
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            color: warna.shade50,
            child: Column(
              children: [
                Icon(ikon, size: 80, color: warna),
                const SizedBox(height: 8),
                Text(
                  judul,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: warna.shade800,
                  ),
                ),
              ],
            ),
          ),
          // Daftar informasi
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: daftar.length,
              itemBuilder: (context, index) {
                final item = daftar[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.place, color: warna),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item.nama,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.deskripsi,
                          style: const TextStyle(fontSize: 15, height: 1.4),
                        ),
                        const SizedBox(height: 12),
                        // Tombol "Lihat Detail" ada di semua kategori
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: warna,
                              foregroundColor: Colors.white,
                            ),
                            icon: const Icon(Icons.info_outline),
                            label: const Text('Lihat Detail'),
                            // Mengirim nama tempat wisata lewat arguments
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/detail',
                                arguments: item.nama,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Tombol kembali
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.grey.shade800,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* Empat halaman menu */
class PantaiPage extends StatelessWidget {
  const PantaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KategoriPage(
      judul: 'Pantai',
      ikon: Icons.beach_access,
      warna: Colors.blue,
      daftar: dataPantai,
    );
  }
}

class GunungPage extends StatelessWidget {
  const GunungPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KategoriPage(
      judul: 'Gunung',
      ikon: Icons.terrain,
      warna: Colors.green,
      daftar: dataGunung,
    );
  }
}

class BudayaPage extends StatelessWidget {
  const BudayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KategoriPage(
      judul: 'Budaya',
      ikon: Icons.theater_comedy,
      warna: Colors.deepOrange,
      daftar: dataBudaya,
    );
  }
}

class KulinerPage extends StatelessWidget {
  const KulinerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KategoriPage(
      judul: 'Kuliner',
      ikon: Icons.restaurant,
      warna: Colors.red,
      daftar: dataKuliner,
    );
  }
}

/* ===================================================================
   Halaman Detail Wisata (menerima nama lewat arguments, lalu
   menampilkan informasi lengkap)
   =================================================================== */
class DetailWisataPage extends StatelessWidget {
  const DetailWisataPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menerima data yang dikirim melalui Navigator.pushNamed(arguments: ...)
    final String namaWisata =
        ModalRoute.of(context)!.settings.arguments as String;
    final Wisata? wisata = cariWisata(namaWisata);

    // Data tidak ditemukan
    if (wisata == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail Wisata')),
        body: Center(child: Text('Data "$namaWisata" tidak ditemukan')),
      );
    }

    final MenuItem menu =
        daftarMenu.firstWhere((m) => m.judul == wisata.kategori);
    final MaterialColor warna = menu.warna;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Wisata'),
        backgroundColor: warna,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header: ikon, nama, kategori
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 28, horizontal: 20),
                    color: warna.shade50,
                    child: Column(
                      children: [
                        Icon(menu.ikon, size: 80, color: warna),
                        const SizedBox(height: 12),
                        Text(
                          wisata.nama,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: warna.shade800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Chip(
                          label: Text('Wisata ${wisata.kategori}'),
                          backgroundColor: warna.shade100,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tentang
                        _judulBagian('Tentang', Icons.article, warna),
                        Text(
                          wisata.penjelasan,
                          style: const TextStyle(fontSize: 15, height: 1.5),
                        ),
                        const SizedBox(height: 20),

                        // Informasi ringkas
                        _judulBagian('Informasi', Icons.info, warna),
                        Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              children: wisata.info.entries.map((e) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 110,
                                        child: Text(
                                          e.key,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: warna.shade800,
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Text(e.value)),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Daya tarik
                        _judulBagian('Daya Tarik', Icons.star, warna),
                        ..._daftarPoin(wisata.daya, Icons.check_circle, warna),
                        const SizedBox(height: 20),

                        // Tips
                        _judulBagian('Tips', Icons.lightbulb, warna),
                        ..._daftarPoin(wisata.tips, Icons.tips_and_updates,
                            Colors.amber.shade800),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Tombol kembali
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.grey.shade800,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _judulBagian(String teks, IconData ikon, Color warna) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(ikon, color: warna),
          const SizedBox(width: 8),
          Text(
            teks,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  List<Widget> _daftarPoin(List<String> isi, IconData ikon, Color warna) {
    return isi.map((teks) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(ikon, size: 20, color: warna),
            const SizedBox(width: 10),
            Expanded(
              child: Text(teks, style: const TextStyle(fontSize: 15, height: 1.4)),
            ),
          ],
        ),
      );
    }).toList();
  }
}