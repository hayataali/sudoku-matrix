clear all
clc
p=256;
A=zeros(p,p);
%% Handle any sort of invalid cells

for ii=1:p
    for jj=1:p
      if (A(ii,jj)>p || A(ii,jj)<0 || isnan(A(ii,jj)))
        disp('error')
        return
      end

    end
end
%% handle any type of conflicts
for ii=1:p
    for jj=1:p
        if (A(ii,jj)~=0)
            if (ConflictTest(A,ii,jj)==0)
             disp('ConflictTest')
             return
            end
        end
    end
end

%% solve my sudoku
 A_sol=SudokuBacktracker(A)

