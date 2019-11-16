function [ A ] = SudokuBacktracker( A )

[C,s,e] = candidates(A);
p=256;
k=sqrt(p);
while ~isempty(s) && isempty(e)
   A(s) = C{s};
   [C,s,e] = candidates(A);
   
end
if ~isempty(e)
    return
end
%% backtracking

if any(A(:) == 0)
   B = A;
   z = find(A(:) == 0,1);
   for x = [C{z}]
      A = B;
      A(z) = x;
      A = SudokuBacktracker(A);
      if all(A(:) > 0)
          return
      end
   end
    
end

%% 


function [C,s,e] = candidates(A)
% C: vector of candidates for each cell
% s: first cell with one candidate
% e: first cell with no candidates
p=256;
k=sqrt(p);

C = cell(p,p);
for ii = 1:p
    for jj = 1:p
        if (A(ii,jj) == 0)
            row_mod = k*ceil(ii/k-1) + (1:k);
            col_mod = k*ceil(jj/k-1) + (1:k);
            z = 1:p;
            z(nonzeros(A(ii,:))) = 0;
            z(nonzeros(A(:,jj))) = 0;
            z(nonzeros(A(row_mod,col_mod))) = 0;
            C{ii,jj} = nonzeros(z)';
        end
    end
end
L = cellfun(@length,C);
s = find(A == 0 & L == 1,1);
e = find(A == 0 & L == 0,1);
end

end