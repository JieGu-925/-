num_edge=512;
num_node=256;
a=0.45;
b=0.15;
c=0.15;
d=0.25;
%data_result=zeros(num_edge,3);
Pro=zeros(4,1);
Pro(1,1)=a;
Pro(2,1)=b;
Pro(3,1)=c;
Pro(4,1)=d;
Adjm=zeros(num_node,num_node);
%初始化选择块
RandA=rand(1);%随机数rand的范围为(0,1)
num_del=RandA;
Num_choose=1;
for i=1:1:4
    num_del=num_del-Pro(i,1);
    if num_del>0
        Num_choose=Num_choose+1;
    end
    if num_del<0
        break;
    end
end
%初始化选择范围
divide_choose=zeros(2,2);
divide_choose(1,1)=1;
divide_choose(1,2)=num_node;
divide_choose(2,1)=1;
divide_choose(2,2)=num_node;
Length_choose=num_node;
%循环添加关系块
num_add=0;%添加关系的数量
while num_add<num_edge
    %循环选择块
    while Length_choose~=1
        Length_choose=Length_choose/2;
        if Num_choose==1
            divide_choose(1,2)=divide_choose(1,2)-Length_choose;
            divide_choose(2,2)=divide_choose(2,2)-Length_choose;
        end
        if Num_choose==2
            divide_choose(1,1)=divide_choose(1,1)+Length_choose;
            divide_choose(2,2)=divide_choose(2,2)-Length_choose;
        end
        if Num_choose==3
            divide_choose(1,2)=divide_choose(1,2)-Length_choose;
            divide_choose(2,1)=divide_choose(2,1)+Length_choose;
        end
        if Num_choose==4
            divide_choose(1,1)=divide_choose(1,1)+Length_choose;
            divide_choose(2,1)=divide_choose(2,1)+Length_choose;
        end
        %初始化选择块
        RandA=rand(1);%随机数rand的范围为(0,1)
        num_del=RandA;
        Num_choose=1;
        for i=1:1:4
            num_del=num_del-Pro(i,1);
            if num_del>0
                Num_choose=Num_choose+1;
            end
            if num_del<0
                break;
            end
        end
    end
    %如果关系不在对角线并且不存在与邻接矩阵中则添加(无向图)
    if divide_choose(1,1)~=divide_choose(2,2)
        if Adjm(divide_choose(1,1),divide_choose(2,2))==0&&Adjm(divide_choose(2,2),divide_choose(1,1))==0
            Adjm(divide_choose(1,1),divide_choose(2,2))=1;
            num_add=num_add+1;
        end
    end
    %初始化选择范围
    divide_choose=zeros(2,2);
    divide_choose(1,1)=1;
    divide_choose(1,2)=num_node;
    divide_choose(2,1)=1;
    divide_choose(2,2)=num_node;
    Length_choose=num_node;
end

for i=1:1:num_node
    for j=i+1:1:num_node
        if Adjm(i,j)==1
            Adjm(i,j)=rand(1);
            Adjm(j,i)=Adjm(i,j);
        end
        if Adjm(j,i)==1
            Adjm(j,i)=rand(1);
            Adjm(i,j)=Adjm(j,i);
        end
    end
end

fid = fopen('C:\软件\eclipseMars\workspace\protect\src\main\resources\static\upload\upload.txt', 'w');
hh='AddEdge';
fprintf(fid,'%s\n',hh);
for row = 1:num_node-1
    for col=row+1:num_node
        if Adjm(row,col)~=0
            fprintf(fid,'%g\t%g\t%g\r\n', row,col,Adjm(row,col));
        end
    end
end
fclose(fid);