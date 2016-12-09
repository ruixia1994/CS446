function thr = findThr(in,limit,level)
h = imhist(in);
n = length(h);
t = 0;
while(is2peak(h)~=1 & t<=limit)
    h1 = h;
    h1(1) = (h(1)+h(1)+h(2))/3;
    for i=2:n-1
        h1(i) = (h(i)+h(i-1)+h(i+1))/3;
    end
    h1(n) = (h(n-1)+h(n)+h(n))/3;
    h = h1;
    t = t+1;
end
peakfound = 0;
for i=1:n-2
    if h(i)<h(i+1) & h(i+1)>h(i+2) & h(i+1)>level
        peakfound = 1;
    end
    if peakfound==1 & h(i)>h(i+1) & h(i+1)<h(i+2)
        thr = i+1;
        return;
    end
end
thr = -1;
end