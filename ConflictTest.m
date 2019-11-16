function [ flag] = ConflictTest(A,row_i,col_j)
flag=0
%% col test
p=256;
for ii=1:p
    if ii~=row_i
        if A(ii,col_j)==A(row_i,col_j)
            return
        end
        
    end
end

%%row test
for jj=1:p
    if jj~=col_j
        if A(row_i,jj)==A(row_i,col_j)
            return
        end
        
    end
end
k=sqrt(p);
%%3x3 grid test
modRow=mod(row_i-1,k);
modCol=mod(col_j-1,k);
row_l=row_i-modRow;
col_l=col_j-modCol;
for ii=row_l:row_l+(p-1)
    for jj=col_l:col_l+(p-1)
        if (ii~=row_i)||(jj~=col_j)
            if A(ii,jj)==A(row_i,col_j)
             return
            end
        
       end
    end
end
flag=1;
end

