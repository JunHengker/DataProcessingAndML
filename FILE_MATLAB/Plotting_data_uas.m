file = 'acc_gyr.csv';
data = readtable(file); % Read the CSV file using readtable

fs = 20;

% Extracting 'fall' data
df_fall = data(strcmp(data.label, 'fall'), :);
disp('df_fall:');

% Extracting 'sit' data
df_sit = data(strcmp(data.label, 'sit'), :);
disp('df_sit:');



% Plotting fall data
figure('Position', [100, 100, 1200, 800]);

% Subplot for xAcc data
subplot(3, 2, 1);
plot(df_fall.xAcc, 'DisplayName', 'xAcc');
title('fall - xAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend;

% Subplot for yAcc data
subplot(3, 2, 3);
plot(df_fall.yAcc, 'DisplayName', 'yAcc');
title('fall - yAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend;

% Subplot for zAcc data
subplot(3, 2, 5);
plot(df_fall.zAcc, 'DisplayName', 'zAcc');
title('fall - zAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend;

% Subplot for xGyro data
subplot(3, 2, 2);
plot(df_fall.xGyro, 'DisplayName', 'xGyro');
title('fall - xGyro Gyroscope Data');
xlabel('Sample');
ylabel('Gyroscope (deg/s)');
legend;

% Subplot for yGyro data
subplot(3, 2, 4);
plot(df_fall.yGyro, 'DisplayName', 'yGyro');
title('fall - yGyro Gyroscope Data');
xlabel('Sample');
ylabel('Gyroscope (deg/s)');
legend;

% Subplot for zGyro data
subplot(3, 2, 6);
plot(df_fall.zGyro, 'DisplayName', 'zGyro');
title('fall - zGyro Gyroscope Data');
xlabel('Sample');
ylabel('Gyroscope (deg/s)');
legend;




% Plotting sit data
figure('Position', [100, 100, 1200, 800]);

% Subplot for xAcc data
subplot(3, 2, 1);
plot(df_sit.xAcc, 'DisplayName', 'xAcc');
title('sit - xAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend;

% Subplot for yAcc data
subplot(3, 2, 3);
plot(df_sit.yAcc, 'DisplayName', 'yAcc');
title('sit - yAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend;

% Subplot for zAcc data
subplot(3, 2, 5);
plot(df_sit.zAcc, 'DisplayName', 'zAcc');
title('sit - zAcc Accelerometer Data');
xlabel('Sample');
ylabel('Acceleration (m/s^2)');
legend;

% Subplot for xGyro data
subplot(3, 2, 2);
plot(df_sit.xGyro, 'DisplayName', 'xGyro');
title('sit - xGyro Gyroscope Data');
xlabel('Sample');
ylabel('Gyroscope (deg/s)');
legend;

% Subplot for yGyro data
subplot(3, 2, 4);
plot(df_sit.yGyro, 'DisplayName', 'yGyro');
title('sit - yGyro Gyroscope Data');
xlabel('Sample');
ylabel('Gyroscope (deg/s)');
legend;

% Subplot for zGyro data
subplot(3, 2, 6);
plot(df_sit.zGyro, 'DisplayName', 'zGyro');
title('sit - zGyro Gyroscope Data');
xlabel('Sample');
ylabel('Gyroscope (deg/s)');
legend;