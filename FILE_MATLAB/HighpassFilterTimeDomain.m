% Read data
file = 'acc_gyr.csv';
data = readtable(file);

% Extracting 'fall' data
df_fall = data(strcmp(data.label, 'fall'), :);

% Extracting 'sit' data
df_sit = data(strcmp(data.label, 'sit'), :);

% Define sample size
sample_size = 500;

% Taking samples from each axis for both accelerometer and gyroscope data
sampled_fall_zAcc = df_fall.zAcc(1:sample_size);
sampled_sit_zAcc = df_sit.zAcc(1:sample_size);

% Sampling frequency
fs = 20;

% Function to perform FFT and plot results
function [f, P1, Y] = plot_fft(time_domain_signal, sample_size, fs, signal_name)
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
[f_fall, P1_fall, Y_fall] = plot_fft(sampled_fall_zAcc, sample_size, fs, 'Fall zAcc');

% Plot FFT and time-domain signals for sit data
[f_sit, P1_sit, Y_sit] = plot_fft(sampled_sit_zAcc, sample_size, fs, 'Sit zAcc');

% Design the high-pass filter in frequency domain
fc_high = 0.5; % High-pass cutoff frequency (Hz)
hp_filterFall= f_fall >= fc_high;
hp_filterSit = f_sit >= fc_high;

% Apply the high-pass filter to the FFT of the sit data
Y_fall_hp = Y_fall;
Y_fall_hp(~hp_filterFall) = 0;
Y_sit_hp = Y_sit;
Y_sit_hp(~hp_filterSit) = 0;

% Inverse FFT to convert back to time domain
filtered_fall_zAcc_hp = ifft(Y_sit_hp, 'symmetric');
filtered_sit_zAcc_hp = ifft(Y_sit_hp, 'symmetric');

% Plot the original and high-pass filtered signals for sit data
figure('Position', [100, 100, 1200, 800]);

subplot(2, 2, 1);
plot(sampled_fall_zAcc);
title('Original Fall zAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');

subplot(2, 2, 2);
plot(filtered_fall_zAcc_hp);
title('High-Pass Filtered Fall zAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');

subplot(2, 2, 3);
plot(sampled_sit_zAcc);
title('Original Sit zAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');

subplot(2, 2, 4);
plot(filtered_sit_zAcc_hp);
title('High-Pass Filtered Sit zAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
