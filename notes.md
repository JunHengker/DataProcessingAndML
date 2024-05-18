kalau mau ke ml harus setelah di filter, kita langsung machine learning patokan nya dari tabel label yang kita punya. pakai banyak filter kta tes satu satu man yang paling akurasi dari output ml nya.

bandingin beberapa filter untuk mengidentifikasi freq yang menentukan posisis dia fall atau normal.

bole cari fitur, ekstrak fitur infromasi penting bsia jadi karakteristik dari sinyal. cari mean nya, variance, skewness.

kita pisahin data dengan label a b c d, kita cari fiturnya masing masing, untuk walk fall itu mena nya ap aaja.

okei beres

UPDATE

INDIKATOR PAKEM untuk menentukan jatuh atau tidaknya seseorang.
beberapa

time series bisa dicari dari rapid naik turunya dari sensor giroskop misalnya
bisa analisis pakai power density untuk cari kurtosis, karena ntr keliatan disana peaknya

cuma kalau begitu gw cari kurtoisnya di swk (time domain)

bu nab bisa difilter frekuensi kencenngya dmna high pass mngkin atau band pass. low pass buat nentuin jatuh atau ga nya dia.

plotting time domain

untuk freq domain hanya untuk filter kurtosisnya pakai FIR, asumsi data belum clean jadi filter dl pke low pass.

sampling dlu cok di awal, periode 1/20 krna 20Hz

saran fathan ambil 2 saja untuk perbandingan, jatoh aprah sm diem saja untuk mennjadi perbandingan. filter goyang" kecil yang ga diperlukan
