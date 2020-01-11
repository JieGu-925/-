
function Node_del(G,Adj,Degree,epsilon2)
	
	degree_mean=mean(Degree);
	Dell=find(Degree<degree_mean);
	num_del=length(Dell);
	dell=randperm(num_del,epsilon2);
	Del=Dell(dell);
	num_del=length(Del);

	for j=1:num_del
		for m=1:(Degree(Del(j))-1)
			for n=m+1:Degree(Del(j))
				[minD]=zuiduan(G,Adj(Del(j),m),Adj(Del(j),n));
				if minD==G(Adj(Del(j),m),Del(j))+G(Del(j),Adj(Del(j),n))
					G(Adj(Del(j),m),Adj(Del(j),n))=minD;
					G(Adj(Del(j),n),Adj(Del(j),m))=minD;
					G(Del(j),:)=inf;
					G(:,Del(j))=inf;
				end
			end
		end
	end	
end
