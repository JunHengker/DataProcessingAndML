% Membaca data dari file CSV
file = 'acc_gyr.csv';
data = readtable(file);
% Memilih data untuk label 'fall' dan 'sit'
df_fall = data(strcmp(data.label, 'fall'), :);
df_sit = data(strcmp(data.label, 'sit'), :);
% Mengambil sampel data
x = 1;
batas_akhir = 400;
% cukup mainkan value 100 dan 20 nya
sample_size = batas_akhir - 100;  % default (- 100) ; (-200) untuk detik ke-10
opening = x + 20; % default (+ 20) ; (+160) untuk detik ke-8
closing  = sample_size;
sampled_fall_yAcc = df_fall.yAcc(opening:closing);
sampled_sit_yAcc = df_sit.yAcc(opening:closing);
fs = 20; % Frekuensi sampling
% Desain filter low-pass Butterworth
fc = 5; % Frekuensi cutoff
[b, a] = butter(4, fc/(fs/2)); % Filter orde 4
% Terapkan filter pada sinyal y-acceleration
filtered_fall_yAcc = filtfilt(b, a, sampled_fall_yAcc);
filtered_sit_yAcc = filtfilt(b, a, sampled_sit_yAcc);
% Plot sinyal sebelum dan sesudah filter
t = (0:(closing - opening)) / fs;
figure;
subplot(2, 1, 1);
plot(t, sampled_fall_yAcc, 'r');
hold on;
plot(t, filtered_fall_yAcc, 'b');
title('Fall - yAcc Accelerometer Data (Before and After Filtering)');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');
legend('Original', 'Filtered');
subplot(2, 1, 2);
plot(t, sampled_sit_yAcc, 'r');
hold on;
plot(t, filtered_sit_yAcc, 'b');
title('Sit - yAcc Accelerometer Data (Before and After Filtering)');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');
legend('Original', 'Filtered');
% Plot sinyal yang telah difilter
figure;
subplot(2, 1, 1)
plot(t, filtered_fall_yAcc);
title('Filtered Fall - yAcc Accelerometer Data');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');
subplot(2, 1, 2)
plot(t, filtered_sit_yAcc);
title('Filtered Sit - yAcc Accelerometer Data');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');
%% Fungsi untuk ekstraksi fitur dari sinyal yang sudah difilter
function features = extract_features(filtered_signal)
   % Mean (Rata-rata)
   mean_val = mean(filtered_signal);
   % Variance (Variansi)
   var_val = var(filtered_signal);
  
   % Standard Deviation (Simpangan Baku)
   std_val = std(filtered_signal);
  
   % Maximum (Nilai Maksimum)
   max_val = max(filtered_signal);
  
   % Minimum (Nilai Minimum)
   min_val = min(filtered_signal);
  
   % Range (Jangkauan)
   range_val = max_val - min_val;
  
   % Energy (Energi)
   energy_val = sum(filtered_signal .^ 2);
  
   % Root Mean Square (RMS)
   rms_val = rms(filtered_signal);
  
   % Zero Crossing Rate (ZCR)
   zero_crossings = sum(diff(sign(filtered_signal)) ~= 0);
  
   % Menyimpan fitur dalam satu array
   features = [mean_val, var_val, std_val, max_val, min_val, range_val, energy_val, rms_val, zero_crossings];
end
% Ekstraksi fitur untuk sinyal fall dan sit
fall_features = extract_features(filtered_fall_yAcc);
sit_features = extract_features(filtered_sit_yAcc);
% Menampilkan fitur yang diekstrak dengan label
feature_labels = {'Mean', 'Variance', 'Standard Deviation', 'Maximum', 'Minimum', 'Range', 'Energy', 'RMS', 'Zero Crossing Rate'};
disp('Fall Features:');
for i = 1:length(feature_labels)
   fprintf('%s: %.4f\n', feature_labels{i}, fall_features(i));
end
disp('Sit Features:');
for i = 1:length(feature_labels)
   fprintf('%s: %.4f\n', feature_labels{i}, sit_features(i));
end