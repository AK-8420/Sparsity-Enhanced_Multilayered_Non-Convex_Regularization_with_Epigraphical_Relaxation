function [ xp , zp ] = Proj_Epigraph_wx( x , z , w )
% { (x,y) | f(x) = x �� z } �ւ̃G�s�O���t�ˉe

a = [ w ; -1 ];

sizex = size(x);

xv = reshape( x , [ prod(sizex) ,1 ] );
zv = reshape( z , [ prod(sizex) ,1 ] );

xz = [ xv' ; zv' ];

% �G�s�O���t�O�̓_�𒊏o
ind = ( w*xv > zv );
xz_ = xz(:,ind);

% xzp_ = xz_ - a *([ 1/2 -1/2 ]a'*xz_);
xzp_ = xz_ - a*((a'*xz_)/(a'*a));
xzp_(2,:) = xzp_(1,:);

xzp = xz; 
xzp(:,ind) = xzp_;

xpv = xzp(1,:); xpv = xpv';
zpv = xzp(2,:); zpv = zpv';

xp = reshape( xpv , sizex );
zp = reshape( zpv , sizex );
