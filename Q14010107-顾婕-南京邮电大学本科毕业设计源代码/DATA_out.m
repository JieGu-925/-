function DATA_out(G)
[max_row, max_col] = size(G);
fid = fopen('C:\Èí¼þ\eclipseMars\workspace\protect\src\main\resources\static\upload\data_out.txt', 'w');
for row = 1:max_row
    for col=row+1:max_col
        if (G(row,col)~=0)&&(G(row,col)~=inf)
            fprintf(fid,'%g\t%g\t%g\r\n', row,col,G(row,col));
        end
    end
end
fclose(fid);