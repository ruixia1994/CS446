function out = adFPA(in)
out1 = adFPAcore(in);
while(sum(sum(in~=out1))~=0)
    in = out1;
    out1 = adFPAcore(in);
end
out = out1;
end