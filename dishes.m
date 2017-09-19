%This code trains the neural net 
clear
close all
clc
% generating training data, the desired outputs 
nsamples=100;
ntestsamples=20;
load dishtrainingdata
C=double(B);%%converting to double format
x1=(mapminmax(C));%normalizing
y1=[ones(nsamples/2,1) zeros(nsamples/2,1)];%'1' is clean, '0' is dirty
x=x1(:,1:nsamples);
y = (y1(:))';
%% specify the structure and learning algorithm for MLP
net=newff(minmax(x),[100,1],{'tansig','logsig'},'traincgf');
net.trainparam.show=2000;
net.trainparam.lr=0.01;
net.trainparam.epochs=10000;
net.trainparam.goal=1e-4;
%% Train the MLP
[net,tr]=train(net,x,y);
%% Test the MLP
load dishtestdata
D=double(B);
NT=(mapminmax(D));
ytest=sim(net,NT);
ytrain=sim(net,x);
plot(ytest)

%%%%test accuracy%%%
a=length(find(ytest(1:ntestsamples/2)>0.5));
b=length(find(ytest(ntestsamples/2:ntestsamples)<0.5));
testaccuracy=(a+b)*100/ntestsamples

%%%training accuracy%%%%%%
c=length(find(y(1:nsamples/2)>0.5));
d=length(find(y(nsamples/2:nsamples)<0.5));
trainaccuracy=(c+d)*100/nsamples

save net net