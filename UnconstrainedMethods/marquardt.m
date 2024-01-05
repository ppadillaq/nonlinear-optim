function [X_opt, f_opt] = marquardt(func, X0)
    %MARQUARDT Marquardt unconstrained optimization method.
    %   The Marquardt method attempts to take advantage of both the steepest
    %   descent and Newton methods. This method modifies the diagonal elements
    %   of the Hessian matrix, as
    %           [~Ji] = [Ji] + alpha[I]

    maxIter = 1e4; % maximum no. of iterations
    alpha1 = 1e5;
    c1 = 0.5;
    c2 = 5;
    eps = 1e-2;
    i = 1;

    % Iterations matrix - Preallocation
    X = NaN(maxIter, numel(X0));
    S = NaN(maxIter, numel(X0));
    fX = NaN(maxIter, 1);
    X(i,:) = X0;
    [fX(i), delta_f] = f(X0);

    while ~any(converged) && i < maxIter
        i = i + 1;
    end

end