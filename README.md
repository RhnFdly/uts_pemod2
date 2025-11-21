Cara Menjalankan Proyek

1.  **Clone Repository:**
    ```bash
    git clone [https://www.fda.gov/drugs/types-applications/abbreviated-new-drug-application-anda](https://www.fda.gov/drugs/types-applications/abbreviated-new-drug-application-anda)
    cd [Nama Folder Proyek Anda]
    ```

2.  **Install Dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run Aplikasi:**
    ```bash
    flutter run
    ```
    (Pastikan Anda telah menjalankan emulator atau menghubungkan perangkat fisik.)

---

## 📚 Jawaban Teori (Bagian A)

Berikut adalah jawaban untuk pertanyaan teori yang diminta dalam ujian.

### 1. Perbedaan antara Cubit dan BLoC dalam arsitektur Flutter.

| Aspek | Cubit | BLoC (Bloc Library) |
| :--- | :--- | :--- |
| **Definisi** | Sub-kelas dari Bloc. Hanya memiliki satu *stream* (aliran data). | Kelas inti. Memiliki dua *stream* (Events dan States). |
| **Mekanisme** | **Fungsi (Methods)** memanggil `emit(newState)` secara langsung untuk mengubah State. | **Events** dikirim, diproses oleh **MapEventToState**, lalu menghasilkan State baru. |
| **Kompleksitas** | **Sederhana** dan ringkas. Ideal untuk logika yang hanya membutuhkan *input* data (fungsi). | **Lebih kompleks**. Ideal untuk logika yang kompleks, membutuhkan *middleware* (seperti `transform`), dan perlu pelacakan *Events* (misalnya: *logging*). |
| **Contoh Kasus** | Mengelola status *loading*, *toggle* tema, **Cart App sederhana**. | *Authentication*, *Form Validation* kompleks, atau alur data multi-langkah. |

<hr/>

### 2. Mengapa penting untuk memisahkan antara *model data*, *logika bisnis*, dan *UI* dalam pengembangan aplikasi Flutter?

Konsep ini dikenal sebagai **Separation of Concerns (SoC)**, dan dalam Flutter diwujudkan melalui arsitektur seperti **BLoC/Cubit (Business Logic Component)**.

* **Skalabilitas (Scalability):** Memungkinkan aplikasi tumbuh tanpa *bug* yang tidak terduga. Perubahan di UI tidak merusak Logika Bisnis, dan sebaliknya.
* **Maintenance (Pemeliharaan):** Jika terjadi *bug* (kesalahan), pengembang tahu persis di mana harus mencari (misalnya: *bug* harga ada di `CartCubit`, bukan di `ProductCard`).
* **Testabilitas (Testability):** **Logika Bisnis** (`CartCubit`) dapat diuji secara terpisah (*unit testing*) tanpa perlu me-*render* UI. Ini membuat pengujian menjadi cepat dan andal.
* **Reusabilitas (Reusability):** **Model Data** (`ProductModel`) dan **Logika Bisnis** (`CartCubit`) dapat digunakan kembali di berbagai bagian UI tanpa perlu ditulis ulang.

<hr/>

### 3. Sebutkan dan jelaskan minimal tiga *state* yang mungkin digunakan dalam `CartCubit` beserta fungsinya.

Dalam konteks `CartCubit` ini, *state* utamanya adalah **`CartState`** yang mengelola Map item. Tiga *state* minimal yang mungkin digunakan (meskipun CartState bisa melayani semuanya) adalah:

| State | Fungsi | Keterangan |
| :--- | :--- | :--- |
| **`CartLoaded`** | **State utama** saat keranjang memiliki item atau kosong. | Menampilkan daftar produk, total harga, dan tombol *Checkout*. (State inilah yang diimplementasikan sebagai `CartState` kita). |
| **`CartLoading`** | **State sementara** saat operasi asinkron sedang berjalan. | Dapat digunakan saat data keranjang diambil dari *database* lokal/API (walaupun tidak diimplementasikan di UTS ini). |
| **`CartCheckoutSuccess`** | **State terminal** setelah tombol *Checkout* berhasil. | Menampilkan pesan sukses kepada pengguna sebelum mengarahkan mereka kembali ke halaman utama. |
