function R=matrix(A,B)

% A���������Bʵ��������ó��Ķ�ά���󣬺����Ӧ�����������������Ӧʵ�����

R=zeros(7,7);

for i=1:length(A)
    R(A(i),B(i))=R(A(i),B(i))+1;
end
