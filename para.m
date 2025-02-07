function [para] = para(cut,t)
p = polyfit(log(t'),cut,1);
m = p(1) % slope
b = p(2) % intercept

p2 = polyfit(log(t'), log(cut), 1); % Fit y' = B1 * x' + B0

% Extract power-law parameters
beta = p2(1);  % Exponent
alpha = exp(p2(2));  % Convert intercept back to a by exponentiation

para = [m,b,alpha,beta]