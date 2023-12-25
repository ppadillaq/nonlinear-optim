%% EXAMPLE
% Implementation from Example 6.8 (Rao (2019), p.339).
    %   ------------------------------------------------------------------
    %   Rao, S. S. (2019). Engineering optimization: theory and practice. 
    %   John Wiley & Sons.
    %   ------------------------------------------------------------------
clear
clc
% Unconstrained minimization problem
% Cost function
f=@(x) x(:,1) - x(:,2) + 2*x(:,1).^2 + 2*x(:,1).*x(:,2) +x(:,2).^2;
% Gradient
grad ={@(x) 1 + 4*x(1) + 2*x(2) , ...
       @(x) -1 + 2*x(1) + 2*x(2)};

%% Plot mesh
x = linspace(-2,3,100);
[m_x, m_y] = meshgrid(x,x);
z = f([m_x(:) m_y(:)]);
mesh(x,x,reshape(z,[numel(x) numel(x)]))
figure, contour(x,x,reshape(z,[numel(x) numel(x)]), 30)
hold on

%% Optimization
% Starting point
X0 = [0 0];
[X,S,fX,i] = steepestDescent(f,grad, X0);
scatter3(X(:,1),X(:,2),f(X),'filled', 'MarkerFaceColor', 'red')

