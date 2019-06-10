function  x=Gauss_Seidel(A, b, x0, eps)
% A 系数矩阵
% b 常数矩阵
% x0 解的初值
% eps 精度


D = diag(diag(A)); % 求A的对角矩阵
U = D - triu(A);     % 求 A 的上三角矩阵
                 % 也可以 U = -triu(A, 1);
L = D - (triu(A))';  % 求 A 的下三角矩阵
                 % 也可以 L = -tril(A, -1);

while 1
    x = (D-L)\U * x0 + (D-L)\b;
    t = x - x0;
	% norm 计算矩阵范数
    if norm(t, inf) < eps &&... % 无穷-范数
		norm(t, 1) < eps &&...  % 1-范数
		norm(t, 2) < eps        % 2-范数
			break
    end
    x0 = x;
end

end