clear all
clc


filename1 = './ballStillData/lidar_ball_still.csv'
position = csvread(filename1);


S = position(1,:);         %all the yc axis data from csv file
angle =[ -1.57079637051:0.00436332309619:1.56643295288];

%ball data points start at 305 end at 440
start = 305;
N = 440;
res = 0;
xc_est = zeros(3,1);
resSum = 0;
count = 0;
aveSumRec = [];
countRec = [];
xc = S.*cos(angle);
yc = S.*sin(angle);

plot(yc, xc); hold on
xlabel('x'), ylabel('y');
title('Cylindrial Measurement Data before Trimming')

S = S';
angle = angle';

step = 110;%abs(start-N);

for index=1:step:length(S)
    resSum = 0;
    if(index+step >= length(S))
        break;
    end 
    Strim = S(index:index+step, 1);
    angleTrim = angle(index:index+step, 1);
    
    %calculate the least squares
    [xcT,xcT_est] = myFunc(Strim, angleTrim);
    
    %find the average sum of residual
    res =(xcT - xcT_est).^2;
    for k=1:length(res)
        resSum = resSum + res(k);
    end
    aveSum = resSum/length(res);
    aveSumRec = [aveSumRec aveSum];
    count = count + 1;
    countRec = [countRec count];
    
    
end

%match each residual to a counter
keySet = aveSumRec;
valueSet = countRec;
key = min(aveSumRec);
M = containers.Map(keySet, valueSet);


pause(1);
%---------------find the ball -------------------------%
loc_start = step*M(key) - step;
loc_end = step*M(key);

figure 
plot(yc, xc); hold on

Strim = S(loc_start:loc_end, 1);
angleTrim = angle(loc_start:loc_end, 1);
[xcT,xcT_est] = myFunc(Strim, angleTrim)


%--------------------works-----------------------------------
% plot(yc, xc, '*');  hold on
% A=[ones(length(yc),1) yc yc.^2];
% beta=A\xc;
% hold on
% plot(yc, beta(1)+beta(2)*yc+beta(3)*yc.^2)
% leg_est=sprintf('Estimated (y=%.4f+%.4fx+%.4fx^2',beta(1),beta(2),beta(3))
% legend('Data',leg_est)

function [xcT,xcT_est] = myFunc(Strim, angleTrim)
    
    xcT = Strim.*cos(angleTrim);
    ycT = Strim.*sin(angleTrim);
    lastCol = ones(length(ycT),1);
    
    A = [lastCol ycT ycT.^2];
    xhat = A\xcT;
    xcT_est = A*xhat;
    pause(0.5);
    plot(ycT, xcT_est, '--o');
    leg_est=sprintf('Estimated (y=%.4f+%.4fx+%.4fx^2',xcT_est(1),xcT_est(2),xcT_est(3))
    legend('Data',leg_est)
end
