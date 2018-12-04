%% 求点到直线的距离
function d=distance(P)
Q1=[-4,-4];Q2=[4,4];
d = abs(det([Q2-Q1;P-Q1]))/norm(Q2-Q1);