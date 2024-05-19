kalau mau ke ml harus setelah di filter, kita langsung machine learning patokan nya dari tabel label yang kita punya. pakai banyak filter kta tes satu satu man yang paling akurasi dari output ml nya.

bandingin beberapa filter untuk mengidentifikasi freq yang menentukan posisis dia fall atau normal.

bole cari fitur, ekstrak fitur infromasi penting bsia jadi karakteristik dari sinyal. cari mean nya, variance, skewness.

kita pisahin data dengan label a b c d, kita cari fiturnya masing masing, untuk walk fall itu mena nya ap aaja.

okei beres

UPDATE

INDIKATOR PAKEM untuk menentukan jatuh atau tidaknya seseorang.
beberapa

time series bisa dicari dari rapid naik turunya dari sensor giroskop misalnya
bisa analisis pakai power density untuk cari kurtosis, karena

cuma kalau begitu gw cari kurtoisnya di swk (time domain)

bu nab bisa difilter frekuensi kencenngya dmna high pass mngkin atau band pass. low pass buat nentuin jatuh atau ga nya dia.

plotting time domain

untuk freq domain hanya untuk filter kurtosisnya pakai FIR, asumsi data belum clean jadi filter dl pke low pass.

sampling dlu cok di awal, periode 1/20 krna 20Hz

saran fathan ambil 2 saja untuk perbandingan, jatoh aprah sm diem saja untuk mennjadi perbandingan. filter goyang" kecil yang ga diperlukan

Light dataset ada movemennt tambhan jadi ga langsung jatuh makannya data dia punya deviasi yang tinggi banget dibanding yang lain. simpelnya sensornya ngambil range yang lebi gede karena movement tambahan. istilah kata jatuh nya kesereet. (teori liar, basedny dari kaggle itu sendiri).

FFT-in ke frequensi domain, SIGNAL PROCESSING SLIDE FILTER ADA FFT SEMUA

bisa asumsikan kalo data jatoh, analisis dari z axis cukup keliatan accelerometer. cukup tinggi. kalau falling freq nya lebi tinggi karena peaknya lebih tinggi. engga jtoh ya diem

compare dari domain freq. Buat cek lagi.

analisis bisa pakai power density buat cek tinggi peak nya, ambil dari freq dia. kedua bisa ambil dari deviasi buat analisis.

power density -> pakai yang uda di fft in. data gaboleh di merge ntr dicompare side to side.

Deviasi time domain dan juga deviasi freq domain.

filter order fatan 96

gua pakai butterworth = IIR

sudah di IIR, kita time domain lagi cari std deviasi.

ADVANCED TOPIK ML
kita ekstrak fitur dulu dataset kita, nah dari fitur itu kita jadikan patokan buat di training. initnya jadi ada indikator penentu dia jatuh atau ga biar mesin nanti predict.

training itu kita bikin "inverse engine". machine learning paling gampang pakai KNN. kita ajarin tu pakai indikator kalo segini jatoh kalo sgini ga jatoh. kita kasih data baru terus dia identifikasi ini itu jatoh atau ini itu ga jatoh.

MINUSNYA, ML ITU RIBET DAN TAKUTNYA GA KEBURU.
