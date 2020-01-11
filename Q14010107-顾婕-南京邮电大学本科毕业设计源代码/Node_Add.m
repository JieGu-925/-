%Add中存放的是要增加的基�?��点的序号
function Node_Add(G,Adj,Degree,epsilon2)
	degree_mean=mean(Degree);
	Addd=find(Degree<degree_mean);
	addd=randperm(length(Addd),epsilon2);
	Add=Addd(addd);
	epsilon3=importdata('C:\����\eclipseMars\workspace\protect\src\main\resources\static\result\epsilon3.txt');
	for j=1:length(Add)
		GAdd=[];
		Addj=G(Add(j),:);
		count=1;
		for i=1:length(Addj)
			if Addj(i)~=inf
				GAdd(count)=Addj(i);
				count=count+1;
			end
		end
		add_mean=mean(GAdd);
		node_temp=G(Add(j),:)+laplace_noise(G(Add(j),:),epsilon3);
		node_temp(Add(j))=add_mean;
		G=[G,(node_temp)'];
		node_temp=[node_temp,0];
		G=[G;node_temp];
    end
    G=abs(G);
end