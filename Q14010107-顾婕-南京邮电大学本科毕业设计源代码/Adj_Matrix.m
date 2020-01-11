function [AdjM] = Adj_Matrix(data)
%{
node矩阵第一列为节点号，第二列为用户姓名
data矩阵第一列为当前节点号，第二列为连接的节点号，第三列为权�?
%}

%[num_node,~]=size(node);

%AdjM = 1./zeros(num_node);
AdjM=[];
[num_edge,~]=size(data);
for i=1:num_edge
	index_x=data(i,1);
	index_y=data(i,2);
	AdjM(index_x,index_y)=data(i,3);
    AdjM(index_y,index_x)=data(i,3);
end
