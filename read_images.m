%This code is used to collect image data for training. It takes an image,
%writes it as a jpg file and numbers it automatically
clear
close all
clc

folder_content=dir;
i=1;

while i<length(folder_content)
    
    if folder_content(i).name((length(folder_content(i).name-3):end))~='jpg'
        i=i+1;
    else
        break
    end

end

img=imread('http://ai-ball.com/?action=snapshot');
imwrite(img,strcat(num2str(i),'.jpg'));