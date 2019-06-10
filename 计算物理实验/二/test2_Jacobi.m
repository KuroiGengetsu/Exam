%% Jacobi法 与 Gauss_Seidel法
% 解线性方程组
% 10x1 - x2 = 9
% -x1 + 10x2 - 2x3 = 7
% -2x2 + 10x3 = 6
% 设 x(0) = 0, 精度自设
clear;clc; % 清屏

A = [10, -1, 0; -1, 10, -2; 0, -2, 10]; % 系数矩阵
b = [9; 7; 6];                          % 常数矩阵
x0 = [0; 0; 0];                           % 初值
eps = 1e-6;                             % 精度

% Jacobi法 雅克比法
x1 = Jacobi(A, b, x0, eps);
fprintf('Jacobi法:\n\tx1=%.4f\n\tx2=%.4f\n\tx3=%.4f\n', x1);
fprintf('A*x=%.4f\n\t%.4f\n\t%.4f\n', A*x1);

% Gauss_Seidel法 高斯－赛德尔
x2 = Gauss_Seidel(A, b, x0, eps);
fprintf('Jacobi法:\n\tx1=%.4f\n\tx2=%.4f\n\tx3=%.4f\n', x2);
fprintf('A*x=%.4f\n\t%.4f\n\t%.4f\n', A*x2);
