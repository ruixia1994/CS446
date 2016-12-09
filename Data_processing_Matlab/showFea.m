function showFea(P,A)
[n,c] = size(P);
plot(P(:,2),P(:,1),'.','Color','Red','MarkerSize',15);
for i=2:n
    for j=1:i-1
        if(A(i,j)==1)
            line([P(i,2),P(j,2)],[P(i,1),P(j,1)]);
        end
    end
end
grid on;
axis equal;
axis([0 64 0 64]);
set(gca,'YDir','reverse');
set(gca,'XAxisLocation','top');
end