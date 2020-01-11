function [minD,path] = BellmanFord(w,start,terminal)
%求单源最短路径的Bellman-Ford算法（图论）
%调用格式：[minD,path] = BellmanFord(w,start,terminal)
%输入：
%   w------------图的带权邻接矩阵（可以是有向图，权值可正可负，但不能有负环，
%                如果两点之间没有边直连，则边权为无穷大）
%   start--------源点标号
%   terminal-----目的点标号
%输出：
%   minD---------起点到终点的最短距离
%   path---------是一个向量，存储了从源点到目的点的路径。如果没有输入目的点，则
%                第i位存储的是源点到节点i的最短路径上i的前驱结点

G = sparse(w);  % 构造邻接矩阵w的稀疏矩阵
[u,v,c] = find(G);    % 记录边的始点和终点

V = size(w,1);  % 节点数量
E = length(u);  % 边的数量

f = zeros(1,V); % 存放源点到该点最短路径上该点的前驱结点

% 初始化
dist = inf(1,V);
dist(start) = 0;

% 主循环
for k = 1:(V-1)
    for e = 1:E
        i = u(e); j = v(e);
        if dist(j) > dist(i) + c(e)
			%%%%%%%%
            dist(j) = dist(i) + c(e);
            f(j) = i;
		else
			%%%%%%%%
        end
    end
end

% 负环检测
for e = 1:E
    i = u(e); j = v(e);
    if dist(j) > dist(i) + c(e)
        minD = [];
        path = 0;
        return;
    end
end

% 输出
if nargin == 2  % 如果只输入2个参数，则输出源点到所有节点的最短路径和最短路径树
    minD = dist;
    path = f;
else    % 否则（输入了终点），输出源点到终点的最短路径和经过的节点
    minD = dist(terminal);
    if minD ~= inf   % 如果可达再来寻找路径
        % 从f中回退
        path(1) = terminal;
        forward = 1;
        while path(forward) ~= start
            path(forward+1) = f(path(forward));
            forward = forward + 1;
        end
        %调整顺序
        L = length(path);
        path = path(L:-1:1);
    else
        path = 0;   % 表示不可达
    end
end