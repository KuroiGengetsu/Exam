% 题目3 双缝干涉实验模拟。光波长500nm，光缝距离d=2.0mm，光栅到屏幕距离z=1.0m
% 原理见光学书 P112
clear;clc;
lam = 500e-9;                % 波长 lambda λ
d = 2e-3;                    % 光缝距离 d=2.0mm
z = 1;		            	 % 光栅到屏幕距离 z = 1.0m, 原理中用符号 D 表示

ym = 5*lam*z / d;            % 五级明纹位置, 可以随意更改
xs = ym;
n = 101;
ys = linspace(-ym, ym, n);   % 在 -ym 到 +ym 之间等距离生成 101 个点

I = zeros(101, 1);           % 提前为 B 分配 101x1 的空间

for i=1:n
	r1 = sqrt((ys(i) - d/2).^2 + z^2);  % S1 到 P 点距离 r1 勾股定理
	r2 = sqrt((ys(i) + d/2).^2 + z^2);  % S2 到 P 点距离 r2
	phi = 2*pi*(r2 - r1)./lam;          % 相位差 δ = 2π△r/λ = xd/D
	I(i) = sum(4*cos(phi/2).^2);        % 光强 I = 4A?cos?(πd/(λD)·x)
end

N = 255;                     % RGB颜色码范围 0~255
Ir = (I/4.0) * N;            % 将光强的值变到 0~255内, 为了画图
subplot(2, 1, 1);
K = ys*4e3;
image(K, xs, Ir');           % 有了坐标和对应位置的光强就可以画图(彩色)
colormap(gray(N));           % 将上边的图片变成灰度图, 即能看到明纹与暗纹
xlabel('K 级条纹');
title('双缝干涉条纹');
subplot(2, 1, 2);
plot(ys, I);                 % 光强随接收屏位置的变化曲线
title('光强随接收屏位置的变化曲线');
xlabel('到接收屏中央的位置/m');
ylabel('光强 I');
