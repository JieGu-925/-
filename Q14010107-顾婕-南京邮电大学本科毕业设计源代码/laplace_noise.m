%A是最小代价生成树，b是拉普拉斯分布的尺度参数

function x=laplace_noise(A,epsilon)
	global c;
	b=c/epsilon;
	[m n]=size(A);
	u = rand(m,n)-0.5;
	u(find(A==0))=0;
    x = b*sign(u).*log(1-2*abs(u));
end
