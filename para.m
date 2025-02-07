function [para] = para(cut, t)
    disp(size(t))
    disp(size(cut))

    % Ensure t is a column vector
    t = t(:);
    disp(size(t))

    % Define a threshold for minimal change detection
    min_variation_threshold = 1e-5;  % Adjust if needed

    % Check if the sensor data changes minimally
    if range(cut) < min_variation_threshold
        m = 0;  % Assume no slope (constant line)
        b = mean(cut);  % Intercept is just the mean value
        alpha = b;  % For power-law, alpha is also mean(cut)
        beta = 0;  % No exponent effect
    else
        % Perform regular linear regression for y = m*x + b
        twint = [ones(length(t), 1), t]; 
        p2 = regress(cut, twint);
        m = p2(2); % slope
        b = p2(1); % intercept

        % Ensure positive values for log transformation
        if any(t <= 0) || any(cut <= 0)
            error('Log transformation is not defined for zero or negative values.');
        end

        % Perform power-law regression
        lt = log(t);
        ltwint = [ones(length(lt), 1), lt];
        lp2 = regress(log(cut), ltwint);

        % Extract power-law parameters
        beta = lp2(2);  % Exponent
        alpha = exp(lp2(1)); % Convert intercept back to alpha by exponentiation
    end

    % Store parameters in an array
    para = [m, b, alpha, beta];
end