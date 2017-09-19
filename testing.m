function [out]=testing()

load net
load dishtestdata

im=(imread('http://ai-ball.com/?action=snapshot'));%read from camera
imwrite(im,'testimage.jpg');%write to a jpg file
t=double(reshape(rgb2gray(im),length(B(:,1)),1));%grayscale
B=[B t];
D=double(B);
NT=(mapminmax(D));%normalize
ytest=sim(net,NT);%NN outputs
out=ytest(end);