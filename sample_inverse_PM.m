[Q,R]= qr(randn(6));

D = diag([2.75, -1, -3, 0.5, 8, 2]);

A = Q*D*Q';

B = A - 0.25*eye(6);

C = inv(B);

q = ones(6,1); s = 1;

for j=1:18
       q_old = q;
       q_new = C*q_old;  
       [m, ind] = max(abs(q_new));
       s = q_new(ind(1));
       q = q_new/s;
end
