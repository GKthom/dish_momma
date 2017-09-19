clear
close all
clc

%call testing every few hours
checked=0;
while 1>0

t=datetime('now');
datetoday=day(t);
if mod(datetoday,3)==0 && hour(t)==10 && minute(t)==00 && round(second(t))==0 %check every 3 days at 10am

disp('Taking picture')
[result]=testing()
% [status,c]=system('netsh wlan connect name=MR87405');   %wifi name    
% pause(10)%give time to connect to wifi
if result<0.5%<0.5 corresponds to dirty sink, >=0.5 is clean sink
    r=randi(5);
    if r==1
        gmail({'email1@gmail.com','email2@gmail.com','email3@gmail.com'},'Clean the dishes!!','Its getting out of hand, kids!!')
    elseif r==2
       gmail({'email1@gmail.com','email2@gmail.com','email3@gmail.com'},'Walao! So messy ah!','This CANNOT lah!')
    elseif r==3
       gmail({'email1@gmail.com','email2@gmail.com','email3@gmail.com'},'AAAARRRRRGGGHHH!!!','Big Momma is ANGRY!')
    elseif r==4
        gmail({'email1@gmail.com','email2@gmail.com','email3@gmail.com'},'Shame, shame!','I think I see the titanic buried in there! Clean up!')
    end
else
    gmail({'email1@gmail.com','email2@gmail.com','email3@gmail.com'},'Good Job!','You kids are so clean :)')
end

disp('Email Sent')
end

end