%% Jacobi�� �� Gauss_Seidel��
% �����Է�����
% 10x1 - x2 = 9
% -x1 + 10x2 - 2x3 = 7
% -2x2 + 10x3 = 6
% �� x(0) = 0, ��������
clear;clc; % ����

A = [10, -1, 0; -1, 10, -2; 0, -2, 10]; % ϵ������
b = [9; 7; 6];                          % ��������
x0 = [0; 0; 0];                           % ��ֵ
eps = 1e-6;                             % ����

% Jacobi�� �ſ˱ȷ�
x1 = Jacobi(A, b, x0, eps);
fprintf('Jacobi��:\n\tx1=%.4f\n\tx2=%.4f\n\tx3=%.4f\n', x1);
fprintf('A*x=%.4f\n\t%.4f\n\t%.4f\n', A*x1);

% Gauss_Seidel�� ��˹�����¶�
x2 = Gauss_Seidel(A, b, x0, eps);
fprintf('Jacobi��:\n\tx1=%.4f\n\tx2=%.4f\n\tx3=%.4f\n', x2);
fprintf('A*x=%.4f\n\t%.4f\n\t%.4f\n', A*x2);
