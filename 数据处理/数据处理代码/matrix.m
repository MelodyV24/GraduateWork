function R=matrix(A,B)

% A期望输出，B实际输出，得出的二维矩阵，横向对应期望输出输出，纵向对应实际输出

R=zeros(7,7);

for i=1:length(A)
    R(A(i),B(i))=R(A(i),B(i))+1;
end
