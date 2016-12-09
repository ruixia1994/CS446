function out = Checkcurve(in,maxdis)
[l,c] = size(in);
if(l<=2)                %if length<=2 then ignore this line
    out = -1;
    return;
elseif(l<=4)           %if 2<length<=4 then consider this line as straight
    out = [in(1,:),in(l,:)];
    return;
else                   %if length>5
    A = in(1,:)';
    B = in(l,:)';
    max_dis = 0;
    max_l = 0;
    for i=3:l-2
        C = in(i,:)';
        dis = abs(det([B-A,C-A]))/norm(B-A);            %Measure the maximum distance bias from the straight line
        if (dis>max_dis)
            max_dis = dis;
            max_l = i;
        end
    end
    if (max_dis>maxdis*norm(A-B))
        out = [Checkcurve(in(1:max_l,:),maxdis);Checkcurve(in(max_l:l,:),maxdis)];                 %Separate into 2 lines
    else
        out = [in(1,:),in(l,:)];                    %It is a straight line
    end
end
end