function s = showcr(n)
file = fopen('hh001.hcl','r');
fread(file,512*n,'int8');
m = [];
for i=1:64
    ss = [];
    for j=1:8
        ss = [ss,fliplr(fread(file,8,'ubit1')')];
    end
    m=[m;ss];
end
s = m;
end