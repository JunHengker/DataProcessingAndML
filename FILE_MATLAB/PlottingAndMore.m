%% Pendahuluan
% Setiap 20 detik, terdapat 400 sampel
% Setiap 400 sampel itu terjadi 1 buah "gerakan" (fall, sit, lfall, etc)
% Dari informasi di atas kami menguji coba, 400 sampel dalam rentang waktu
% 20 detik

%% Why y Axis?
file = 'acc_gyr.csv';
data = readtable(file);
df_fall = data(strcmp(data.label, 'fall'), :);
df_sit = data(strcmp(data.label, 'sit'), :);
sample_size = 400;
sampled_fall_yAcc = df_fall.yAcc(1:sample_size);
sampled_fall_xAcc = df_fall.xAcc(1:sample_size);
sampled_fall_zAcc = df_fall.zAcc(1:sample_size);
sampled_sit_yAcc = df_sit.yAcc(1:sample_size);
sampled_sit_xAcc = df_sit.xAcc(1:sample_size);
sampled_sit_zAcc = df_sit.zAcc(1:sample_size);

fs = 20;

t = 1 /fs;
duration = (0:sample_size-1) * t;

figure;
subplot(2, 1, 1);
plot(duration, sampled_sit_yAcc);
hold on
plot(duration, sampled_sit_xAcc);
hold on
plot(duration, sampled_sit_zAcc);
title('Sit - Accelerometer Data');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');
legend('yAcc', 'xAcc', 'zAcc');

subplot(2, 1, 2);
plot(duration, sampled_fall_yAcc);
hold on
plot(duration, sampled_fall_xAcc);
hold on
plot(duration, sampled_fall_zAcc);
title('Fall - Accelerometer Data');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');
legend('yAcc', 'xAcc', 'zAcc');

% terdapat perbedaan yang cukup signifikan di yAcc
% antara fall dan sit dataset

%% Slicing
% slicing disini bertujuan untuk memfokuskan ke lonjakan
% signifikan saja

file = 'acc_gyr.csv';
data = readtable(file);

df_fall = data(strcmp(data.label, 'fall'), :);
df_sit = data(strcmp(data.label, 'sit'), :);

sample_size = 300; % batas akhir kurang 100

opening = 21; % batas awal + 20
closing  = sample_size;

sampled_fall_yAcc = df_fall.yAcc(opening:closing);
sampled_fall_xAcc = df_fall.xAcc(opening:closing);
sampled_fall_zAcc = df_fall.zAcc(opening:closing);
sampled_sit_yAcc = df_sit.yAcc(opening:closing);
sampled_sit_xAcc = df_sit.xAcc(opening:closing);
sampled_sit_zAcc = df_sit.zAcc(opening:closing);

fs = 20;

t = 1 /fs;
% duration = (0:sample_size-1) * t;
duration = (0:(closing - opening)) * t;

figure;
subplot(2, 1, 1);
plot(duration, sampled_sit_yAcc);
hold on
plot(duration, sampled_sit_xAcc);
hold on
plot(duration, sampled_sit_zAcc);
title('Sit - Accelerometer Data');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');
legend('yAcc', 'xAcc', 'zAcc');

subplot(2, 1, 2);
plot(duration, sampled_fall_yAcc);
hold on
plot(duration, sampled_fall_xAcc);
hold on
plot(duration, sampled_fall_zAcc);
title('Fall - Accelerometer Data');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');
legend('yAcc', 'xAcc', 'zAcc');

% plotting untuk per data set

% Subplot for fall data
figure;
subplot(2,1,1);
plot(duration, sampled_fall_yAcc);
title('Fall - yAcc Accelerometer Data');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');
legend;

% Function to perform FFT and plot results
Fs=fft(sampled_fall_yAcc,512);
AFs=abs(Fs);
f=fs/512*(0:255);

subplot(2,1,2);
plot(f,AFs(1:256));
xlabel('frequency/Hz');
ylabel('amplitude');
title('Frequency-domain');

% Subplot for sit data
figure;
subplot(2,1,1);
plot(duration, sampled_sit_yAcc);
title('Sit - yAcc Accelerometer Data');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');
legend;

% Function to perform FFT and plot results
Fs=fft(sampled_sit_yAcc,512);
AFs=abs(Fs);
f=fs/512*(0:255);

subplot(2,1,2);
plot(f,AFs(1:256));
xlabel('frequency/Hz');
ylabel('amplitude');
title('Frequency-domain');

%% low pass Butter-worth filter

% fc=2; %the frequencies of sin signals that needs filtered
% N=48; %define the order of filter
% 
% b=fir1(N, (2*fc/fs)); % use the firl function to design a filter

% figure;
% [h,f]=freqz(b,1,512);
% plot(f*fs/(2*pi),20*log10(abs(h)))
% xlabel('frequency/Hz');
% ylabel('gain/dB');
% title('The gain response of lowpass butterworth filter');

fc = 5; % Cut-off frequency

% Design Butterworth low-pass filter of order 4
[b, a] = butter(4, fc/(fs/2));

% Compute the frequency response of the filter
[h, f] = freqz(b, a, 512, fs);

% Plot the gain response in dB
figure;
plot(f, 20*log10(abs(h)));
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');
title('The Gain Response of Low-pass Butterworth Filter');
grid on;


%% apply filter to current signal to dataset
filtered_fall_yAcc = filtfilt(b, a, sampled_fall_yAcc);
filtered_sit_yAcc = filtfilt(b, a, sampled_sit_yAcc);

% Duration calculation for time domain
t = (0:(closing - opening)) / fs;

% Plot sinyal sebelum dan sesudah (gabungan)
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

% Perform FFT untuk Freq domain 
% Fall dataset
FsFallBefore=fft(sampled_fall_yAcc,512);
AFsFallBefore=abs(FsFallBefore); % Untuk PLOT

FsFallAfter=fft(filtered_fall_yAcc,512);
AFsFallAfter=abs(FsFallAfter);

% Sit dataset
FsSitBefore=fft(sampled_sit_yAcc,512);
AFsSitBefore=abs(FsSitBefore);

FsSitAfter=fft(filtered_sit_yAcc,512);
AFsSitAfter=abs(FsSitAfter);

f=fs/512*(0:255);

figure;
subplot(2,1,1);
plot(f,AFsFallBefore(1:256));
hold on;
plot(f,AFsFallAfter(1:256));
xlabel('frequency/Hz');
ylabel('amplitude');
title('Fall Frequency-domain');
legend('Original', 'Filtered');


subplot(2,1,2);
plot(f,AFsSitBefore(1:256));
hold on;
plot(f,AFsSitAfter(1:256));
xlabel('frequency/Hz');
ylabel('amplitude');
title('Sit Frequency-domain');
legend('Original', 'Filtered');


%% Plot satuan yang misah

% Plot sinyal yang telah difilter saja
figure;
subplot(2, 2, 1)
plot(t, filtered_fall_yAcc);
title('Filtered Fall - yAcc Accelerometer Data');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');

subplot(2, 2, 3)
plot(t, filtered_sit_yAcc);
title('Filtered Sit - yAcc Accelerometer Data');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');

% Function to perform FFT and plot results
Fs=fft(filtered_fall_yAcc,512);
AFs=abs(Fs);
f=fs/512*(0:255);

figure;
subplot(2,1,2);
plot(f,AFs(1:256));
xlabel('frequency/Hz');
ylabel('amplitude');
title('Frequency-domain');

%% fitur statistik: std dev (ga peerlu)

means = mean(filtered_signalSit);

display(means);


%% apply filter to current signal fall dataset
filtered_signalFall=filter(b,1,sampled_fall_yAcc);%use filter function to filter

% Subplot for yAcc data
figure;
subplot(2,1,1);
% tugas lu bikin duration 0 - 25 detik
plot(duration, filtered_signalFall);
title('Fall - yAcc Accelerometer Data');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s^2)');
legend;


% Function to perform FFT and plot results
Fs=fft(filtered_signalFall,512);
AFs=abs(Fs);
f=fs/512*(0:255);

subplot(2,1,2);
plot(f,AFs(1:256));
xlabel('frequency/Hz');
ylabel('amplitude');
title('Frequency-domain');