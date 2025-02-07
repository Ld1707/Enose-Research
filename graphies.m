function [] = graphies(Paras)
    time = 1:120;  % Time range for prediction
    numSensors = size(Paras, 1);  % Number of sensors (rows in Paras)

    % Figure for linear model
    figure;
    hold on;
    for i = 1:numSensors
        y = Paras(i, 1) .* log(time) + Paras(i, 2);  % Linear model (element-wise multiplication)
        plot(time, y, 'DisplayName', ['Sensor ', num2str(i)]);  
    end
    title('Linear Model Predictions: y = m log(x) + b');
    ylabel('Predicted Voltage');
    xlabel('Time');
    legend show;
    hold off;

    % Figure for power-law model
    figure;
    hold on;
    for i = 1:numSensors
        y = Paras(i, 3) .* (time .^ Paras(i, 4));  % Power-law model (element-wise exponentiation)
        plot(time, y, 'DisplayName', ['Sensor ', num2str(i)]);
    end
    title('Power-Law Model Predictions: y = \alpha x^\beta');
    ylabel('Predicted Voltage');
    xlabel('Time');
    legend show;
    hold off;
end
