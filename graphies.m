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
    
    figure;
    hold on;
    x = [];
    disp(length(Paras))
    for i = 1:length(Paras)/8
        x = [x,1:8];
    end
    P = Paras';
    P = [x
        P];
    P = P';
    disp(P);
    for i = 1:length(Paras)/8
        for j = 1:8
            for x = 2:5
                if x == 2
                    %figure(3)
                    scatter(j,P(i*j,x),50,'r','filled');
                elseif x == 3
                    %figure(3)
                    scatter(j,P(i*j,x),50,'g','filled');
                elseif x == 4 
                    %figure(4)
                    scatter(j,P(i*j,x),50,'b','filled');
                elseif x == 5
                    %figure(4)
                    scatter(j,P(i*j,x),50,'k','filled');
                end
            end
        end
    end
    title('Parameter comparisons');
    ylabel('Parameters');
    xlabel('Sensors');
    legend('slope','intercept','alpha','beta');
    hold off;
end
