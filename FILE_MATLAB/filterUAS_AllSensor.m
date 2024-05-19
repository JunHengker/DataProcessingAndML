file = 'acc_gyr.csv';
data = readtable(file); % Read the CSV file using readtable

% Extracting 'fall' data
df_fall = data(strcmp(data.label, 'fall'), :);
disp('df_fall:');

% Extracting 'sit' data
df_sit = data(strcmp(data.label, 'sit'), :);
disp('df_sit:');

% Merging signals
merged_xAcc = [df_fall.xAcc; df_sit.xAcc];
merged_yAcc = [df_fall.yAcc; df_sit.yAcc];
merged_zAcc = [df_fall.zAcc; df_sit.zAcc];

merged_xGyro = [df_fall.xGyro; df_sit.xGyro];
merged_yGyro = [df_fall.yGyro; df_sit.yGyro];
merged_zGyro = [df_fall.zGyro; df_sit.zGyro];

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
filtered_xAcc = filter(b, a, merged_xAcc);
filtered_yAcc = filter(b, a, merged_yAcc);
filtered_zAcc = filter(b, a, merged_zAcc);

filtered_xGyro = filter(b, a, merged_xGyro);
filtered_yGyro = filter(b, a, merged_yGyro);
filtered_zGyro = filter(b, a, merged_zGyro);

% Plotting original and filtered signals
figure('Position', [100, 100, 1200, 800]);

subplot(3, 2, 1);
plot(merged_xAcc, 'DisplayName', 'Original xAcc');
hold on;
plot(filtered_xAcc, 'DisplayName', 'Filtered xAcc');
title('xAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend;

subplot(3, 2, 3);
plot(merged_yAcc, 'DisplayName', 'Original yAcc');
hold on;
plot(filtered_yAcc, 'DisplayName', 'Filtered yAcc');
title('yAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend;

subplot(3, 2, 5);
plot(merged_zAcc, 'DisplayName', 'Original zAcc');
hold on;
plot(filtered_zAcc, 'DisplayName', 'Filtered zAcc');
title('zAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend;

subplot(3, 2, 2);
plot(merged_xGyro, 'DisplayName', 'Original xGyro');
hold on;
plot(filtered_xGyro, 'DisplayName', 'Filtered xGyro');
title('xGyro Gyroscope Data');
xlabel('Sample');
ylabel('Gyroscope (deg/s)');
legend;

subplot(3, 2, 4);
plot(merged_yGyro, 'DisplayName', 'Original yGyro');
hold on;
plot(filtered_yGyro, 'DisplayName', 'Filtered yGyro');
title('yGyro Gyroscope Data');
xlabel('Sample');
ylabel('Gyroscope (deg/s)');
legend;

subplot(3, 2, 6);
plot(merged_zGyro, 'DisplayName', 'Original zGyro');
hold on;
plot(filtered_zGyro, 'DisplayName', 'Filtered zGyro');
title('zGyro Gyroscope Data');
xlabel('Sample');
ylabel('Gyroscope (deg/s)');
legend;
