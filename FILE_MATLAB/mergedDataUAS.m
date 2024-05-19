file = 'acc_gyr.csv';
data = readtable(file); % Read the CSV file using readtable

fs = 20;

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

% Display merged data (optional)
disp('Merged xAcc:');
disp(merged_xAcc);
disp('Merged yAcc:');
disp(merged_yAcc);
disp('Merged zAcc:');
disp(merged_zAcc);
disp('Merged xGyro:');
disp(merged_xGyro);
disp('Merged yGyro:');
disp(merged_yGyro);
disp('Merged zGyro:');
disp(merged_zGyro);

% Plotting merged signals for visualization
figure('Position', [100, 100, 1200, 800]);

% Subplot for xAcc data
subplot(3, 2, 1);
plot(merged_xAcc, 'DisplayName', 'xAcc');
title('Merged - xAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend;

% Subplot for yAcc data
subplot(3, 2, 3);
plot(merged_yAcc, 'DisplayName', 'yAcc');
title('Merged - yAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend;

% Subplot for zAcc data
subplot(3, 2, 5);
plot(merged_zAcc, 'DisplayName', 'zAcc');
title('Merged - zAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend;

% Subplot for xGyro data
subplot(3, 2, 2);
plot(merged_xGyro, 'DisplayName', 'xGyro');
title('Merged - xGyro Gyroscope Data');
xlabel('Sample');
ylabel('Gyroscope (deg/s)');
legend;

% Subplot for yGyro data
subplot(3, 2, 4);
plot(merged_yGyro, 'DisplayName', 'yGyro');
title('Merged - yGyro Gyroscope Data');
xlabel('Sample');
ylabel('Gyroscope (deg/s)');
legend;

% Subplot for zGyro data
subplot(3, 2, 6);
plot(merged_zGyro, 'DisplayName', 'zGyro');
title('Merged - zGyro Gyroscope Data');
xlabel('Sample');
ylabel('Gyroscope (deg/s)');
legend;
