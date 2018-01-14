function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
features = size(X, 2);
temp_vec = zeros(features, 1);
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta.
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
    J  = computeCost(X, y, theta);
    %predictions = X*theta;
    %err = predictions -  y;
    %for feature = 1:features
    %  temp_vec(feature) = theta(feature) - ( (alpha/m) * sum(err .* X(:,feature)));
    %end

    %theta = temp_vec;
    h = X * theta;
   errors = h - y;
   cost = (X' * errors) / m;
   theta = theta - (alpha * cost);
    % ============================================================

    % Save the cost J in every iteration
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
