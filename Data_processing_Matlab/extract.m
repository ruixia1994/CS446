function [out1 out2] = extract(in)
in = [zeros(66,1),[zeros(1,64);in;zeros(1,64)],zeros(66,1)];
global mark graph posMatrix adjMatrix record            %initial____________remember to get rid of the single points
graph = in;
mark = bwmorph(in,'endpoints');
mark = mark+bwmorph(in,'branchpoints')*2;
posMatrix = [];
adjMatrix = [];
i = 2;
j = 2;
res = [];
record = [];
contin = true;
while(contin)               %Searching for end points
    if (~(mark(i,j)==1 || (mark(i,j)==2 & sum(sum(graph(i-1:i+1,j-1:j+1)))-graph(i,j)==1)))        %not an end point or branch point
        j=j+1;
        if(j==66)
            j=2;
            i=i+1;
        end
        if(i==66) i=2; end
    else                    %find an end point
        x = i;
        y = j;
        mark(x,y) = 0;
        record = [x,y];
        graph(x,y) = 0;
        [x,y] = next(x,y);
        while(mark(x,y)==0)         %walk along line until endpoints or branchpoints
            record = [record;[x,y]];
            graph(x,y)=0;
            [x,y] = next(x,y);
        end
        record = [record;[x,y]];
        if(sum(sum(graph(x-1:x+1,y-1:y+1)))-graph(x,y)==0)            %Clear it if each an end point
            graph(x,y) = 0;
            mark(x,y) = 0;
        end
        dots = Checkcurve(record,0.2);
        if(dots~=-1)
            resadd(dots);
        end
        imshow(graph)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if(sum(sum(graph))==0)
            contin = false;
        end
    end
end
    out1 = posMatrix-1;
    out2 = adjMatrix;
end