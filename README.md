# 📘 Penjelasan Dasar Flutter

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
