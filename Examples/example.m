%% EXAMPLE
% Implementation from Example 6.8 (Rao (2019), p.339).
    %   ------------------------------------------------------------------
    %   Rao, S. S. (2019). Engineering optimization: theory and practice. 
    %   John Wiley & Sons.
    %   ------------------------------------------------------------------
clear
clc
% Unconstrained minimization problem
% Cost function (and gradient)
f = @quadratic;

%% Plot mesh
x = linspace(-2,1,100);
y = linspace(-1,3,100);
[m_x, m_y] = meshgrid(x,y);
z = f([m_x(:) m_y(:)]);
mesh(x,y,reshape(z,[numel(x) numel(y)]))
figure, contour(x,y,reshape(z,[numel(x) numel(y)]), 50)
hold on

%% Optimization
% Starting point
X0 = [0 0];
[X_sD,S_sD,fX_sD,i_sD] = steepestDescent(f, X0);
scatter3(X_sD(:,1),X_sD(:,2),f(X_sD),'filled', 'MarkerFaceColor', 'red')
quiver(X_sD(:,1),X_sD(:,2),S_sD(:,1),S_sD(:,2),'r')

[X_cG,S_cG,fX_cG,i_cG] = conjugateGradient(f, X0);
scatter3(X_cG(:,1),X_cG(:,2),f(X_cG),'filled', 'MarkerFaceColor', 'green')
quiver(X_cG(:,1),X_cG(:,2),S_cG(:,1),S_cG(:,2),'g')

