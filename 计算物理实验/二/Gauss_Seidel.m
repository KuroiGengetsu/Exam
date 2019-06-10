function  x=Gauss_Seidel(A, b, x0, eps)
% A ϵ������
% b ��������
% x0 ��ĳ�ֵ
% eps ����


D = diag(diag(A)); % ��A�ĶԽǾ���
U = D - triu(A);     % �� A �������Ǿ���
                 % Ҳ���� U = -triu(A, 1);
L = D - (triu(A))';  % �� A �������Ǿ���
                 % Ҳ���� L = -tril(A, -1);

while 1
    x = (D-L)\U * x0 + (D-L)\b;
    t = x - x0;
	% norm ���������
    if norm(t, inf) < eps &&... % ����-����
		norm(t, 1) < eps &&...  % 1-����
		norm(t, 2) < eps        % 2-����
			break
    end
    x0 = x;
end

end