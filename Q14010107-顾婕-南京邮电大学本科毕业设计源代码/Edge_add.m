function Edge_add(G)
	[m,n]=find(G);
	mAdd=randperm(length(m),3);
	M=m(mAdd);N=n(mAdd);
	for i=1:3
		u=max(G(M(i),:));z=max(G(:,N(i)));
		w=max([u,z]);
		tmp=zuiduan(G,M(i),N(i));
		G(M(i),N(i))=min([w,tmp]);
		G(N(i),M(i))=min([w,tmp]);
	end
end