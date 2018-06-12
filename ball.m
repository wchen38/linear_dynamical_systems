clear all
clc


filename1 = './ballStillData/lidar_ball_still.csv'
position = csvread(filename1);


S = position(1,:);         %all the yc axis data from csv file
angle =[ -1.57079637051:0.00436332309619:1.56643295288];

%ball data points start at 305 end at 440
start = 305;
N = 440;

resSum = 0;

xc = S.*cos(angle);
yc = S.*sin(angle);

plot(angle, S, '*');
xlabel('angle'), ylabel('S'); 
title('Cylindrial Measurement Data before Trimming')
figure 

S = S(1,start:N);
S = S';
angle = angle(1, start:N);
angle = angle';


xc = S.*cos(angle);
yc = S.*sin(angle);
lastCol = ones(length(yc),1);


plot(angle, S, '*');
xlabel('angle'), ylabel('distance');
title('Cylindrial Measurement Data After trimming')
figure

plot(yc, xc, '*');  hold on
A = [lastCol yc yc.^2];
xhat = A\xc;
xc_est = A*xhat;
plot(yc, xc_est);
leg_est=sprintf('Estimated (y=%.4f+%.4fx+%.4fx^2',xc_est(1),xc_est(2),xc_est(3))
legend('Data',leg_est)


res =(xc - xc_est).^2;
for k=1:length(res)
    resSum = resSum + res(k);
end

aveSum = resSum/length(res);

keySet = {0.000900001 0.000900002};
valueSet = {1 2};

key = 0.000900001;

M = containers.Map(keySet, valueSet);

M(key)



%--------------------works-----------------------------------
% plot(yc, xc, '*');  hold on
% A=[ones(length(yc),1) yc yc.^2];
% beta=A\xc;
% hold on
% plot(yc, beta(1)+beta(2)*yc+beta(3)*yc.^2)
% leg_est=sprintf('Estimated (y=%.4f+%.4fx+%.4fx^2',beta(1),beta(2),beta(3))
% legend('Data',leg_est)


