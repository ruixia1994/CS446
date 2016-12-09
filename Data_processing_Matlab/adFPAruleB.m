function res = adFPAruleB(in)
if in(2,2)==0 res = 0;
else
    p0 = in(2,2);
    p = [in(1,2),in(1,3),in(2,3),in(3,3),in(3,2),in(3,1),in(2,1),in(1,1)];
    Bp = sum(sum(p));
    p = [p,p(1)];
    Ap = 0;
    for i=1:8
        if (p(i)==0 & p(i+1)==1) Ap = Ap+1;
        end
    end
    if (((2<=Bp)&(Bp<=6)&(Ap==1)&(p(1)*p(3)*p(7)==0)&(p(1)*p(5)*p(7)==0)&(p(1)+p(3)+p(5)+p(7)>1)) || ((Ap==2)&(p(3)*p(5)==1)&(p(1)+p(4)+p(7)==0)) || ((Ap==2)&(p(5)*p(7)==1)&(p(1)+p(3)+p(6)==0)) || ((p(2)+p(4)+p(6)+p(8)==0)&(p(1)+p(3)+p(5)+p(7)==3)))
        res = 0;        %add &(p(1)+p(3)+p(5)+p(7)>1)
    else
        res = 1;
    end
end
end