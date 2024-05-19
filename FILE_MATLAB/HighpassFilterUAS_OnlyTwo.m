file = 'acc_gyr.csv';
data = readtable(file); % Read the CSV file using readtable

% Extracting 'fall' data
df_fall = data(strcmp(data.label, 'fall'), :);
disp('df_fall:');

% Extracting 'sit' data
df_sit = data(strcmp(data.label, 'sit'), :);
disp('df_sit:');

% Merging signals
merged_yAcc = [df_fall.yAcc; df_sit.yAcc];

% Sampling frequency and filter specifications
fs = 20;  % Sampling frequency (Hz)
fc = 4; % Cutoff frequency (Hz)
order = 12; % Filter order

% Design Butterworth high-pass filter
[b, a] = butter(order, fc/(fs/2), 'high');

% Visualize frequency response
fvtool(b, a);
title('High-Pass Filter Frequency Response');

% Applying the high-pass filter to merged signals
filtered_yAcc = filter(b, a, merged_yAcc);

% Plotting original and filtered signals
figure('Position', [100, 100, 1200, 800]);

subplot(3, 1, 1)
plot(merged_yAcc, 'DisplayName', 'Original yAcc');
hold on;
plot(filtered_yAcc, 'DisplayName', 'Filtered yAcc');
title('yAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend('Merged Signal');

subplot(3, 1, 2)
plot(merged_yAcc, 'DisplayName', 'Original yAcc');
title('Original yAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend('Original');

subplot(3, 1, 3)
plot(filtered_yAcc, 'DisplayName', 'Filtered yAcc');
title('Filtered yAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend('Filtered');