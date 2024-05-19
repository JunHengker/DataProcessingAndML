% Read data
file = 'acc_gyr.csv';
data = readtable(file);

% Extracting 'fall' data
df_fall = data(strcmp(data.label, 'fall'), :);

% Extracting 'sit' data
df_sit = data(strcmp(data.label, 'sit'), :);

% Define sample size
sample_size = 500;

% Taking 200 samples from each axis for both accelerometer and gyroscope data
sampled_fall_xAcc = df_fall.xAcc(1:sample_size);
sampled_fall_yAcc = df_fall.yAcc(1:sample_size);
sampled_fall_zAcc = df_fall.zAcc(1:sample_size);

sampled_fall_xGyro = df_fall.xGyro(1:sample_size);
sampled_fall_yGyro = df_fall.yGyro(1:sample_size);
sampled_fall_zGyro = df_fall.zGyro(1:sample_size);

sampled_sit_xAcc = df_sit.xAcc(1:sample_size);
sampled_sit_yAcc = df_sit.yAcc(1:sample_size);
sampled_sit_zAcc = df_sit.zAcc(1:sample_size);

sampled_sit_xGyro = df_sit.xGyro(1:sample_size);
sampled_sit_yGyro = df_sit.yGyro(1:sample_size);
sampled_sit_zGyro = df_sit.zGyro(1:sample_size);

% Sampling frequency
fs = 20;

% Function to perform FFT and plot results
function plot_fft(time_domain_signal, sample_size, fs, signal_name)
    % Perform FFT
    Y = fft(time_domain_signal);
    P2 = abs(Y/sample_size);
    P1 = P2(1:sample_size/2+1);
    P1(2:end-1) = 2*P1(2:end-1);

    % Define frequency domain
    f = fs*(0:(sample_size/2))/sample_size;

    % Plotting the frequency spectrum
    figure('Position', [100, 100, 1200, 400]);
    subplot(1, 2, 1);
    plot(f, P1);
    title(['Single-Sided Amplitude Spectrum of ', signal_name]);
    xlabel('f (Hz)');
    ylabel('|P1(f)|');

    % Plotting the time-domain signal
    subplot(1, 2, 2);
    plot(time_domain_signal);
    title(['Time-Domain Signal of ', signal_name]);
    xlabel('Sample');
    ylabel('Amplitude');
end

% Plot FFT and time-domain signals for fall data
% plot_fft(sampled_fall_xAcc, sample_size, fs, 'Fall xAcc');
% plot_fft(sampled_fall_yAcc, sample_size, fs, 'Fall yAcc');
plot_fft(sampled_fall_zAcc, sample_size, fs, 'Fall zAcc');
% plot_fft(sampled_fall_xGyro, sample_size, fs, 'Fall xGyro');
% plot_fft(sampled_fall_yGyro, sample_size, fs, 'Fall yGyro');
% plot_fft(sampled_fall_zGyro, sample_size, fs, 'Fall zGyro');

% Plot FFT and time-domain signals for sit data
% plot_fft(sampled_sit_xAcc, sample_size, fs, 'Sit xAcc');
% plot_fft(sampled_sit_yAcc, sample_size, fs, 'Sit yAcc');
plot_fft(sampled_sit_zAcc, sample_size, fs, 'Sit zAcc');
% plot_fft(sampled_sit_xGyro, sample_size, fs, 'Sit xGyro');
% plot_fft(sampled_sit_yGyro, sample_size, fs, 'Sit yGyro');
% plot_fft(sampled_sit_zGyro, sample_size, fs, 'Sit zGyro');

