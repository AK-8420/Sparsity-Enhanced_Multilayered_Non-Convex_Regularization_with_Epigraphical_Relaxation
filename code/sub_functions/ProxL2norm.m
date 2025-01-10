% Author: Shunsuke Ono (ono@sp.ce.titech.ac.jp)
% 
% f(x) = (��/2)|| x - v ||_2^2 
% prox_{��f}(x) = argmin_y ��(��/2)|| y - v ||_2^2 + (1/2) || x - y ||_2^2
%              = argmin_y ��(��/2)|| y - v ||_2^2 + (1/2) || y - x ||_2^2

% (����) ��/��y ( || Ax - b ||_2^2 ) = A^T 2(Ax-b)

% ��/��y ( ��(��/2)|| y - v ||_2^2 + (1/2) || y - x ||_2^2 )
% = ����( y - v ) + ( y - x ) = ( 1 + ���� )y - ( ����v + x ) = 0
% ( 1 + ���� )y = ����v + x
% y = (����v + x)/( 1 + ���� )
%

function y = ProxL2norm(x, gamma, v, mu)

if ~exist('mu','var')
    mu = 1;
end

if ~exist('v','var')
    v = zeros(size(x));
end

y = (x + mu*gamma*v)/( 1 + mu*gamma );