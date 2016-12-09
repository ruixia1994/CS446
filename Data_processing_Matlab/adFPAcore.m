function out = adFPAcore(in)
in = [zeros(1,66);[zeros(64,1),in,zeros(64,1)];zeros(1,66)];
out1 = zeros(66,66);
out2 = zeros(64,64);
for i=2:65
    for j=2:65
        out1(i,j) = adFPAruleA(in(i-1:i+1,j-1:j+1));
    end
end
for i=2:65
    for j=2:65
        out2(i-1,j-1) = adFPAruleB(out1(i-1:i+1,j-1:j+1));
    end
end
out = out2;
end