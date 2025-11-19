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
```

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
```

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
```dart
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
```

# 🚀 Tugas 9: Integrasi Web Service Django

## ❓ 1. Pentingnya Model Dart untuk Data JSON

Membuat model Dart saat berinteraksi dengan data JSON adalah praktik terbaik karena memberikan beberapa keuntungan signifikan dibandingkan langsung menggunakan `Map<String, dynamic>`.

### ✨ **Keuntungan Menggunakan Model Dart**

1.  **Type Safety (Keamanan Tipe)**
    - **Model**: Setiap atribut memiliki tipe data yang jelas (misalnya, `String`, `int`, `bool`). Jika kita salah mengakses tipe data, Dart akan memberikan *error* saat *compile-time*.
    - **Tanpa Model**: `Map` hanya tahu `dynamic`, sehingga kesalahan tipe data baru ketahuan saat *runtime*, yang bisa menyebabkan aplikasi *crash*.

2.  **Null Safety (Keamanan dari Null)**
    - **Model**: Kita bisa mendefinisikan atribut mana yang boleh `null` dan mana yang tidak. Ini memaksa kita untuk menangani kasus `null` dengan benar.
    - **Tanpa Model**: Semua nilai bisa `null` secara default. Jika kita lupa memeriksa, aplikasi akan mengalami *runtime error* (`Null check operator used on a null value`).

3.  **Maintainability (Kemudahan Perawatan)**
    - **Model**: Struktur data terdefinisi dengan jelas. Jika ada perubahan pada JSON dari *backend*, kita hanya perlu mengubah model di satu tempat.
    - **Tanpa Model**: *Key* `String` tersebar di banyak tempat. Mengubah satu *key* berarti harus mencari dan menggantinya di seluruh kode, yang sangat rentan terhadap kesalahan.

4.  **Autocomplete & Readability**
    - **Model**: IDE memberikan *autocomplete* untuk nama atribut (misalnya, `product.name`), membuat kode lebih cepat ditulis dan mudah dibaca.
    - **Tanpa Model**: Kita harus mengetik *key* secara manual (misalnya, `product['name']`), yang rawan salah ketik.

### ⚠️ **Konsekuensi Langsung Menggunakan `Map`**

- **Kode Rapuh**: Mudah terjadi *runtime error* karena salah tipe data atau salah ketik nama *key*.
- **Sulit Dikelola**: Perubahan pada struktur JSON dari API backend menjadi mimpi buruk karena harus diubah di banyak tempat.
- **Kurang Jelas**: Kode menjadi sulit dibaca karena struktur datanya tidak eksplisit.

---

## 📦 2. Peran `http` vs. `CookieRequest`

| Paket | Peran Utama | Kapan Digunakan? |
| :--- | :--- | :--- |
| `http` | Pustaka dasar untuk melakukan permintaan HTTP (GET, POST, dll.). **Tidak mengelola state** seperti *cookie* secara otomatis. | Ideal untuk permintaan publik yang tidak memerlukan autentikasi atau sesi (misalnya, mengambil daftar produk umum). |
| `CookieRequest` | **Wrapper** dari paket `http` yang dirancang khusus untuk **mengelola sesi dan *cookie* secara otomatis**. | Wajib digunakan untuk semua permintaan yang memerlukan autentikasi (login, logout, tambah produk, melihat data pribadi). |

**Perbedaan Kunci:** `CookieRequest` menyimpan *cookie* yang didapat dari server (misalnya, setelah login) dan **secara otomatis melampirkannya** pada setiap permintaan berikutnya. `http` biasa tidak melakukan ini; kita harus mengelolanya secara manual.

---

## 🌐 3. Pentingnya Membagikan Instance `CookieRequest`

Instance `CookieRequest` perlu dibagikan ke seluruh komponen aplikasi agar **state autentikasi (sesi login) tetap konsisten**.

### 🤔 **Mengapa Harus Dibagikan?**

- **State Terpusat**: Dengan `Provider`, hanya ada **satu sumber kebenaran** untuk status login. Semua widget akan mengakses objek `CookieRequest` yang sama.
- **Konsistensi Sesi**: Jika setiap widget membuat `CookieRequest` baru, *cookie* dari proses login tidak akan terbawa ke permintaan lain. Akibatnya, server akan menganggap pengguna belum login.
- **Pembaruan UI Otomatis**: `Provider` memungkinkan widget untuk "mendengarkan" perubahan pada `CookieRequest`. Jika status login berubah (misalnya, setelah logout), UI dapat diperbarui secara otomatis.

Cara membagikannya adalah dengan mendaftarkan `CookieRequest` sebagai `Provider` di `main.dart`, biasanya di atas `MaterialApp`.

```dart
void main() {
  runApp(
    Provider(
      create: (_) => CookieRequest(),
      child: const MyApp(),
    ),
  );
}
```

---

## ⚙️ 4. Konfigurasi Konektivitas Flutter & Django

Agar Flutter (terutama di emulator) dapat berkomunikasi dengan server Django lokal, beberapa konfigurasi penting diperlukan.

| Konfigurasi | Mengapa Diperlukan? | Akibat Jika Tidak Dilakukan |
| :--- | :--- | :--- |
| **`'10.0.2.2'` di `ALLOWED_HOSTS`** | `10.0.2.2` adalah alamat *loopback* khusus dari emulator Android untuk mengakses `localhost` di mesin *host* (laptop/PC). Django secara *default* menolak semua *host* yang tidak terdaftar. | Django akan menolak permintaan dari emulator, menghasilkan *error* **"DisallowedHost"**. |
| **CORS (Cross-Origin Resource Sharing)** | Browser dan Flutter memberlakukan kebijakan *Same-Origin Policy* yang memblokir permintaan dari domain yang berbeda (misalnya, Flutter di `localhost:1234` ke Django di `localhost:8000`). CORS memberitahu browser bahwa permintaan lintas domain ini diizinkan. | Browser/Flutter akan memblokir permintaan, menghasilkan **CORS error** di konsol. |
| **`SameSite=None` & `Secure` untuk Cookie** | Atribut `SameSite` mengontrol kapan *cookie* dikirim. `None` diperlukan untuk permintaan lintas domain. `Secure` memastikan *cookie* hanya dikirim melalui HTTPS (meski dilonggarkan saat *development*). | Browser akan menolak menyimpan atau mengirim *cookie* saat permintaan lintas domain, menyebabkan **proses login gagal** karena sesi tidak tersimpan. |
| **Izin Akses Internet (Android)** | Sistem operasi Android secara *default* membatasi aplikasi untuk mengakses internet demi keamanan. Izin ini secara eksplisit memberikan hak akses tersebut. | Aplikasi tidak akan bisa melakukan permintaan jaringan sama sekali. Semua *request* akan **gagal tanpa mencapai server**. |

---

## 🔄 5. Mekanisme Pengiriman Data Form ke Flutter

Mekanisme ini mengubah input pengguna menjadi data yang ditampilkan di halaman lain.

1.  **Input Pengguna**: Pengguna mengisi `TextFormField` pada halaman formulir (`product_form.dart`). Setiap input disimpan dalam variabel *state* (misalnya, `_name`, `_price`).
2.  **Validasi**: Saat tombol "Save" ditekan, `_formKey.currentState!.validate()` memeriksa apakah semua input valid sesuai aturan.
3.  **Pengiriman ke Server (POST Request)**:
    - Jika valid, data dari variabel *state* dibungkus dalam format JSON.
    - `CookieRequest.postJson()` mengirim data ini ke *endpoint* Django (misalnya, `/create-flutter/`).
4.  **Proses di Django**: *View* Django menerima data JSON, memvalidasinya, dan menyimpannya ke *database* sebagai objek `Product` baru.
5.  **Respons dari Server**: Django mengirim respons JSON kembali, biasanya berisi status `{ 'status': 'success' }`.
6.  **Navigasi & Umpan Balik**:
    - Flutter menerima respons sukses.
    - Sebuah `SnackBar` ditampilkan untuk memberitahu pengguna bahwa data berhasil disimpan.
    - `Navigator.pushReplacement` mengarahkan pengguna kembali ke halaman utama.
7.  **Menampilkan Data Baru**: Saat pengguna membuka halaman "All Products" atau "My Products", aplikasi melakukan `GET request` ke Django. Data yang baru saja ditambahkan kini ikut terambil dan ditampilkan dalam bentuk `ListView`.

---

## 🔐 6. Mekanisme Autentikasi (Login, Register, Logout)

Proses ini mengamankan data pengguna dengan mekanisme berbasis sesi (*session-based authentication*).

### **Register**
1.  **Input**: Pengguna memasukkan *username*, *password*, dll., di halaman registrasi Flutter.
2.  **POST Request**: Data dikirim ke *endpoint* Django (`/auth/register/`).
3.  **Proses Django**: Django membuat objek `User` baru dan menyimpannya di *database*.
4.  **Respons**: Django mengembalikan pesan sukses, dan Flutter mengarahkan pengguna ke halaman login.

### **Login**
1.  **Input**: Pengguna memasukkan *username* dan *password* di halaman login Flutter.
2.  **POST Request**: Kredensial dikirim ke *endpoint* Django (`/auth/login/`) menggunakan `CookieRequest.login()`.
3.  **Proses Django**:
    - Django memverifikasi kredensial dengan data di *database*.
    - Jika valid, Django membuat sesi baru dan mengirimkan **`sessionid`** dalam bentuk *cookie* sebagai respons.
4.  **Proses di Flutter**:
    - `CookieRequest` secara otomatis menyimpan *cookie* `sessionid`.
    - `Provider` memastikan *instance* `CookieRequest` ini dibagikan ke seluruh aplikasi.
    - Pengguna diarahkan ke halaman utama (`MyHomePage`).

### **Akses Halaman Terproteksi (Contoh: My Products)**
1.  **GET Request**: Pengguna menekan tombol "My Products". Flutter mengirim permintaan ke *endpoint* `/my-products/`.
2.  **Pengiriman Cookie**: `CookieRequest` **secara otomatis melampirkan *cookie* `sessionid`** yang sudah tersimpan.
3.  **Verifikasi di Django**: Django menerima permintaan, memeriksa `sessionid`, dan mengidentifikasi pengguna yang sedang login. *View* kemudian memfilter data produk hanya untuk pengguna tersebut.
4.  **Respons**: Django mengirim data JSON berisi produk milik pengguna.

### **Logout**
1.  **POST Request**: Pengguna menekan tombol "Logout". Flutter mengirim permintaan ke *endpoint* Django (`/auth/logout/`) menggunakan `CookieRequest.logout()`.
2.  **Proses Django**: Django menghapus sesi pengguna dari *database* dan membatalkan validitas `sessionid`.
3.  **Proses di Flutter**:
    - `CookieRequest` menghapus *cookie* yang tersimpan di *instance*-nya.
    - Pengguna diarahkan kembali ke halaman login.

---

## 🛠️ 7. Implementasi Step-by-Step

Berikut adalah langkah-langkah kunci yang saya lakukan dalam mengimplementasikan fungsionalitas ini, di luar dari mengikuti tutorial dasar.

1.  **Struktur Awal & Navigasi**:
    - Saya memulai dengan membuat struktur halaman dasar: `menu.dart`, `login.dart`, dan `product_form.dart`.
    - Saya langsung membuat `LeftDrawer` sebagai widget terpisah agar mudah digunakan kembali di semua halaman (`Scaffold(drawer: const LeftDrawer())`). Ini memastikan navigasi yang konsisten sejak awal.

2.  **Refaktor Halaman Daftar Produk**:
    - Awalnya, saya membuat halaman `product_entry_list.dart` hanya untuk satu tujuan. Saya sadar ini tidak efisien.
    - Saya melakukan **refaktor** pada `ProductEntryListPage` agar menerima `endpointUrl` dan `pageTitle`. Ini memungkinkan saya menggunakan satu file yang sama untuk menampilkan "All Products" (dari `/json/`) dan "My Products" (dari `/my-products/`), menghindari duplikasi kode.

3.  **Konektivitas & Debugging**:
    - Saat menghubungkan Flutter ke Django, saya menghadapi *error* **CORS** dan **FormatException (HTML bukan JSON)**.
    - Saya sadar ini karena URL *endpoint* di Django belum ada. Saya kemudian membuat *path* dan *view* yang diperlukan di Django.
    - Saya juga memastikan semua URL di Flutter menggunakan `http://127.0.0.1:8000/` secara konsisten untuk menghindari masalah *cookie* antar domain (`localhost` vs. `127.0.0.1`).

4.  **Model-View-Controller (MVVM) Approach**:
    - **Model**: Saya membuat `ProductEntry.dart` dengan *factory method* `fromJson` untuk mengubah JSON menjadi objek Dart. Ini membuat kode lebih aman dan mudah dibaca.
    - **View**: Saya membuat *widget* khusus seperti `ProductEntryCard` untuk menampilkan satu item produk. Ini memisahkan logika tampilan dari logika halaman.
    - **Logic**: Logika untuk mengambil data (`fetchProducts`) dan mengirim data (`onPressed` di form) saya letakkan di dalam *state* widget halaman terkait (`_ProductEntryListPageState`, `_ShopFormPageState`).

5.  **Manajemen State Autentikasi**:
    - Saya mendaftarkan `CookieRequest` menggunakan `Provider` di `main.dart`.
    - Di `LeftDrawer` dan halaman lain yang memerlukan status login, saya menggunakan `context.watch<CookieRequest>()` untuk mengakses sesi dan melakukan *logout* atau menampilkan data berdasarkan status `loggedIn`.
    - Untuk *logout*, saya menggunakan `Navigator.pushAndRemoveUntil` untuk membersihkan seluruh *stack* navigasi, memastikan pengguna tidak bisa kembali ke halaman sebelumnya setelah *logout*.
