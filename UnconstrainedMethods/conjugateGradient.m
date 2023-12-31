function [X,S,fX,i] = conjugateGradient(f, X0)
    %CONJUGATEGRADIENT Summary of this function goes here
    %   Detailed explanation goes here
    %   Pedro Padilla Quesada
    
    maxIter = 1e4; % maximum no. of iterations
    converged = [0 0 0]; % convergence flags (3 criteria)
    i = 1; % iteration counter

    % Iterations matrix - Preallocation
    X = NaN(maxIter, numel(X0));
    S = NaN(maxIter, numel(X0));
    fX = NaN(maxIter, 1);
    delta_f = NaN(maxIter, numel(X0));
    X(i,:) = X0;
    [fX(i), delta_f(i,:)] = f(X0);

    % First search direction
    %delta_f(i,:) = [gradient{1}(X(i,:)) gradient{2}(X(i,:))];
    S(i,:) = -1*delta_f(i,:);
    wrapper = @(lambda) wrapper1dim(f, lambda, X(i,:), S(i,:));
    [lambda_opt, fX(i+1), ~, ~, ~, ~, ~] = dichoSearch(wrapper,0, 100, 0.000001, 0.0000001);
    X(i+1,:) = X(i,:) + lambda_opt * S(i,:);
    [~, delta_f(i+1,:)] = f(X(i+1,:));
    i = i + 1;
    
    while ~any(converged) && i < maxIter
        fprintf('Iteration %d...\n',i)
        %delta_f(i,:) = [gradient{1}(X(i,:)) gradient{2}(X(i,:))];
        S(i,:) = -1*delta_f(i,:) + norm(delta_f(i,:))^2/norm(delta_f(i-1,:))^2 * S(i-1,:);
        wrapper = @(lambda) wrapper1dim(f, lambda, X(i,:), S(i,:));
        [lambda_opt, fX(i+1), ~, ~, ~, ~, ~] = dichoSearch(wrapper,0, 100, 0.000001, 0.0000001);
        X(i+1,:) = X(i,:) + lambda_opt * S(i,:);
        [~, delta_f(i+1,:)] = f(X(i+1,:));
        converged = convergenceCriteria(X(i+1,:), X(i,:), fX(i+1),fX(i),delta_f(i,:), 1e-6,1e-6,1e-6);
        i = i + 1;
    end
    
    if i > maxIter
        disp('The solution found has not reached convergence criteria in the given maximum number of iterations.')
    else
        idx = find(converged);
        for k = 1:numel(idx)
            fprintf('Convergence criteria %d is met, at iteration %d.\n', idx(k), i-1)
        end
    end

end

function converged = convergenceCriteria(X, X0, fX, fX0, delta_f, eps1, eps2, eps3)
    % Criterion 1
    c1 = abs((fX - fX0)/fX0) <= eps1;
    % Criterion 2
    c2 = all(abs(delta_f) <= eps2);
    % Criterion 3
    c3 = norm(X - X0) <= eps3;
    converged = [c1, c2, c3];
end