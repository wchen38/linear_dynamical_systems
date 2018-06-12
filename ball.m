clear all
clc
%ball data points start at 305 end at 440
start = 305;
N = 440;

diff = abs(N-start) + 1;


filename1 = './ballStillData/lidar_ball_still.csv'
position = csvread(filename1);


S = position(1,:);         %all the yc axis data from csv file
angle =[ -1.57079637051:0.00436332309619:1.56643295288];

%yc = [-10:2:16]';
%xc = [0.0434,0.0530,0.0045,0.0079,0.0033,0.0009,0.0006,0.026,0.0067,0.0530,0.0213,0.0317,0.0940,0.0180]';

 xc = S.*cos(angle);
 yc = S.*sin(angle);

plot(angle, S);
xlabel('angle'), ylabel('S'); 
title('Cylindrial Measurement Data')
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

res = xc - xc_est;

plot(yc, xc_est);



%--------------------works-----------------------------------
% plot(yc, xc, '*');  hold on
% A=[ones(length(yc),1) yc yc.^2];
% beta=A\xc;
% hold on
% plot(yc, beta(1)+beta(2)*yc+beta(3)*yc.^2)
% leg_est=sprintf('Estimated (y=%.4f+%.4fx+%.4fx^2',beta(1),beta(2),beta(3))
% legend('Data',leg_est)


