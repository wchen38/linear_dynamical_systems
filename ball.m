clear all
clc

S = [1.6679999828338623, 1.6679999828338623, 1.3170000314712524, 1.3170000314712524, 1.3170000314712524, 1.3919999599456787, 1.777999997138977, 1.805999994277954, 1.8140000104904175, 1.8140000104904175, 1.8140000104904175, 1.8109999895095825, 1.8109999895095825, 1.8109999895095825, 1.8279999494552612, 1.8329999446868896, 1.8350000381469727, 1.8350000381469727, 1.8350000381469727, 1.8350000381469727, 1.8350000381469727, 1.8350000381469727, 1.8350000381469727, 1.8309999704360962, 1.840000033378601, 1.8370000123977661, 1.8339999914169312, 1.8339999914169312, 1.8339999914169312, 1.8329999446868896, 1.8270000219345093, 1.8270000219345093, 1.8259999752044678, 1.8270000219345093, 1.8259999752044678, 1.8229999542236328, 1.8179999589920044, 1.8029999732971191, 1.7690000534057617, 1.5809999704360962, 0.9850000143051147, 0.9150000214576721, 0.9150000214576721, 0.9020000100135803, 0.9020000100135803, 0.9409999847412109, 1.7979999780654907, 1.8350000381469727, 1.8580000400543213, 1.8700000047683716, 1.878000020980835, 1.8880000114440918, 1.8880000114440918, 1.8930000066757202, 1.8930000066757202, 1.8930000066757202, 1.8940000534057617, 1.8940000534057617, 1.8940000534057617, 1.8949999809265137, 1.902999997138977, 1.909000039100647, 1.9119999408721924, 1.9149999618530273, 1.9149999618530273, 1.9129999876022339, 1.9129999876022339, 1.8899999856948853, 1.8839999437332153, 1.8819999694824219, 1.8769999742507935, 1.8769999742507935, 1.871000051498413, 1.871000051498413, 1.8669999837875366, 1.8650000095367432, 1.8630000352859497, 1.8630000352859497, 1.8630000352859497, 1.8630000352859497, 1.8619999885559082, 1.6890000104904175, 1.6890000104904175, 1.6890000104904175, 1.8630000352859497, 1.8849999904632568, 1.9010000228881836, 1.9259999990463257, 1.9299999475479126, 1.9359999895095825, 1.9359999895095825];
S = S(1,1:50);
S = S'
angle =[ -1.57079637051:0.00436332309619:1.56643295288];
angle = angle(1, 1:50);
angle = angle';
xc = S.*cos(angle);
yc = S.*sin(angle);
lastCol = ones(50,1);
%A = [(S.*S), S, lastCol];
A = [ S.*S, S, lastCol];
x_hat = inv(A'*A)*A'*yc;

est_y = A*x_hat;

plot(yc, xc); hold on
plot(est_y, xc);

