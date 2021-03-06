function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = length(theta);
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
costSum = 0;
for i = 1:m
    h = sigmoid(X(i,:)*theta);
    costSum = costSum + (-y(i) .* log(h) - (1 - y(i)) * log(1 - h));
end

temp = theta;
temp(1) = 0;

thetaSum = 0;
for j = 1:n
    thetaSum = thetaSum + temp(j)^2;
end

J = (1 / m) * costSum + (lambda / (2 * m)) * thetaSum;


grad = (1 ./ m) * (sigmoid(X * theta) - y)' * X;
temp = theta;
temp(1) = 0;
grad = grad + (lambda / m .* temp)';


% =============================================================

end
