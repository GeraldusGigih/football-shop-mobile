# 📘 Penjelasan Dasar Flutter -- Tugas 7

## 1. Widget Tree dan Hubungan Parent-Child

### 🌳 Widget Tree
**Widget Tree** (Pohon Widget) adalah cara Flutter menyusun tampilan (UI) aplikasi.  
Bayangkan seperti pohon keluarga:

- Ada satu widget paling atas yang disebut **root (akar)**.
- Widget root memiliki **anak (children)**.
- Setiap anak bisa punya anak lagi, dan seterusnya.

Seluruh tampilan yang kamu lihat di layar adalah hasil dari susunan pohon widget ini.

### 👨‍👩‍👧 Hubungan Parent-Child
Hubungan ini menjelaskan bagaimana widget saling terhubung di dalam tree.

- **Parent (Induk)**: Widget yang menampung atau membungkus widget lain.  
  Contoh: `Column`, `Row`, `Container`, `Center`.

- **Child (Anak)**: Widget yang berada di dalam widget parent.

**Cara kerja:**  
Parent memberi tahu child di mana harus tampil dan seberapa besar ukurannya.  
Child hanya memberi tahu parent seperti apa tampilannya (misalnya teks, ikon, gambar, dll).

**Contoh:**  
Widget `Center` (parent) memberi tahu widget `Text` (child) untuk tampil di tengah layar.

---

## 2. Widget yang Digunakan dalam Proyek Ini

> *Catatan: Ubah sesuai widget yang benar-benar kamu gunakan di proyekmu.*

| Widget | Fungsi |
|--------|--------|
| **MaterialApp** | Widget utama yang membungkus seluruh aplikasi dan menyediakan fungsionalitas Material Design. |
| **Scaffold** | Menyediakan kerangka dasar halaman (layout) seperti `AppBar` dan `body`. |
| **AppBar** | Bilah judul yang muncul di bagian atas aplikasi. |
| **Column** | Menyusun anak-anaknya secara **vertikal** (atas ke bawah). |
| **Row** | Menyusun anak-anaknya secara **horizontal** (kiri ke kanan). |
| **Container** | Kotak serbaguna untuk memberi warna latar, padding, margin, atau dekorasi. |
| **Text** | Menampilkan tulisan atau teks. |
| **Padding** | Memberi jarak/ruang kosong di sekitar child-nya. |
| **Image** | Menampilkan gambar dari `Asset` atau `Network`. |
| **ElevatedButton** | Tombol Material Design dengan latar berwarna. |

---

## 3. Fungsi Widget `MaterialApp`

`MaterialApp` adalah widget pembungkus utama yang menyediakan fitur dasar aplikasi modern.

### ✳️ Fungsinya:
- Menyediakan **Theme** global (warna, font, gaya tombol).
- Mengatur **Navigasi (Routes)** antar halaman.
- Menentukan **home** atau halaman utama yang dibuka pertama kali.

### 💡 Mengapa jadi root?
Karena `MaterialApp` memberi **konteks dan layanan penting** (seperti tema & navigasi) ke semua widget di bawahnya.  
Tanpa `MaterialApp`, widget seperti `Scaffold` atau `Navigator` tidak akan berfungsi dengan benar.

---

## 4. Perbedaan StatelessWidget dan StatefulWidget

| Aspek | StatelessWidget | StatefulWidget |
|--------|------------------|----------------|
| **Sifat** | Statis (tidak punya data internal) | Dinamis (punya data yang bisa berubah) |
| **Perubahan tampilan** | Tidak bisa berubah setelah dibuat | Bisa berubah saat aplikasi berjalan |
| **Contoh** | `Text`, `Icon`, `Container` | `Checkbox`, `TextField`, tombol "Like" |
| **Kapan dipakai** | Jika tampilan tidak butuh interaksi atau perubahan | Jika butuh merespons input atau data baru |
| **Cara kerja** | Digambar satu kali berdasarkan data awal | Punya objek `State` dan menggunakan `setState()` untuk memperbarui tampilan |

---

## 5. Apa itu BuildContext?

**BuildContext** adalah “alamat” atau lokasi suatu widget di dalam Widget Tree.

### 🔍 Fungsi BuildContext:
- Mengetahui posisi widget dan siapa parent-nya.
- Digunakan untuk **mengakses layanan** dari widget di atasnya (ancestor).

### ⚙️ Contoh Penggunaan:
```dart
Theme.of(context); // Mengambil tema saat ini
Navigator.of(context).push(...); // Navigasi antar halaman
ScaffoldMessenger.of(context).showSnackBar(...); // Menampilkan snackbar

# 📘 Flutter Navigation, Layouts, Forms, and Input Elements -- Tugas 8

## 🧭 1. Perbedaan `Navigator.push()` dan `Navigator.pushReplacement()`

### 📘 Penjelasan Perbedaan

| Metode | Fungsi | Efek pada Stack Navigasi |
|--------|---------|--------------------------|
| `Navigator.push()` | Menambahkan halaman baru di atas halaman sebelumnya. | Halaman sebelumnya tetap ada di stack, pengguna bisa kembali dengan tombol **Back**. |
| `Navigator.pushReplacement()` | Mengganti halaman saat ini dengan halaman baru. | Halaman sebelumnya dihapus dari stack, pengguna tidak bisa kembali. |

### 💡 Penerapan pada Aplikasi Football Shop
- **`Navigator.push()`** digunakan saat berpindah dari **halaman Home ke halaman Detail Produk**, karena pengguna masih mungkin ingin **kembali ke halaman utama** setelah melihat detail produk.  
- **`Navigator.pushReplacement()`** digunakan setelah **login berhasil** atau **checkout selesai**, karena pengguna **tidak perlu kembali** ke halaman login atau keranjang belanja lagi.

---

## 🧩 2. Hierarchy Widget: Scaffold, AppBar, dan Drawer

### 🏗️ Penggunaan Hierarki Widget
Dalam aplikasi *Football Shop*, struktur halaman disusun dengan memanfaatkan widget `Scaffold`, `AppBar`, dan `Drawer` agar konsisten di setiap halaman.

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Football Shop'),
  ),
  drawer: Drawer(
    child: ListView(
      children: const [
        DrawerHeader(
          child: Text('Menu'),
        ),
        ListTile(
          title: Text('Home'),
        ),
        ListTile(
          title: Text('Cart'),
        ),
      ],
    ),
  ),
  body: const HomePageContent(),
);

🧩 Kelebihan Menggunakan Layout Widget: Padding, SingleChildScrollView, dan ListView

Dalam desain antarmuka Flutter, layout widget seperti Padding, SingleChildScrollView, dan ListView punya peran penting untuk membuat tampilan tetap nyaman, responsif, dan enak dipakai di berbagai ukuran layar.

🪶 1. Padding

Padding digunakan untuk memberi jarak antar elemen agar tampilan tidak terlalu rapat dan lebih mudah dibaca.
Tanpa padding, elemen UI akan terlihat berdesakan dan membuat pengguna tidak nyaman.

💡 Kelebihan:

Meningkatkan keterbacaan dan estetika UI.

Memberikan ruang bernapas antar widget.

Membantu tata letak agar tidak menempel pada tepi layar.

🧱 Contoh penggunaan di Football Shop:

Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0),
  child: TextField(
    decoration: InputDecoration(
      labelText: 'Nama Produk',
      border: OutlineInputBorder(),
    ),
  ),
);

📜 2. SingleChildScrollView

SingleChildScrollView digunakan untuk membuat halaman yang bisa digulir ketika kontennya melebihi tinggi layar.
Cocok untuk halaman form yang panjang atau detail produk dengan banyak input.

💡 Kelebihan:

Mencegah overflow error ketika layar kecil.

Semua elemen tetap bisa diakses dengan menggulir layar.

Ideal untuk tampilan form yang dinamis.

🧱 Contoh di aplikasi Football Shop:

SingleChildScrollView(
  padding: EdgeInsets.all(16),
  child: Column(
    children: [
      TextField(decoration: InputDecoration(labelText: 'Nama Produk')),
      SizedBox(height: 10),
      TextField(decoration: InputDecoration(labelText: 'Harga')),
      SizedBox(height: 10),
      TextField(decoration: InputDecoration(labelText: 'Deskripsi')),
      SizedBox(height: 20),
      ElevatedButton(onPressed: saveProduct, child: Text('Simpan')),
    ],
  ),
);

🧾 3. ListView

ListView digunakan untuk menampilkan daftar elemen secara vertikal dan bisa di-scroll otomatis.
Widget ini efisien karena hanya me-render elemen yang terlihat di layar.

💡 Kelebihan:

Efisien untuk daftar panjang seperti list produk.

Mendukung scroll otomatis tanpa tambahan widget.

Mudah dikustomisasi tampilannya.

🧱 Contoh di aplikasi Football Shop:

ListView.builder(
  itemCount: productList.length,
  itemBuilder: (context, index) {
    final product = productList[index];
    return ListTile(
      leading: Image.asset(product.image),
      title: Text(product.name),
      subtitle: Text('Rp${product.price}'),
    );
  },
);


Dengan kombinasi ketiga widget ini, halaman form atau daftar produk di Football Shop menjadi rapi, responsif, dan mudah digunakan oleh pengguna.

🎨 Penyesuaian Warna Tema agar Konsisten dengan Brand Football Shop

Agar aplikasi Football Shop memiliki identitas visual yang kuat dan konsisten, tema warna disesuaikan menggunakan ThemeData pada MaterialApp.
Warna utama yang digunakan adalah hijau (melambangkan lapangan sepak bola dan semangat sportivitas) serta putih (kesan bersih dan profesional).

🎯 Tujuan Penyesuaian Tema
Tujuan	Penjelasan
Konsistensi Visual	Warna hijau dan putih digunakan di seluruh elemen seperti AppBar, tombol, dan background.
Brand Identity	Hijau mencerminkan energi dan semangat olahraga, sesuai dengan tema toko perlengkapan sepak bola.
User Experience	Warna yang seragam memudahkan pengguna mengenali aplikasi dan menciptakan kesan profesional.
🧱 Contoh Implementasi di main.dart
MaterialApp(
  title: 'Football Shop',
  theme: ThemeData(
    primaryColor: Colors.green[700],
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green[700],
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ),
  home: HomePage(),
);
