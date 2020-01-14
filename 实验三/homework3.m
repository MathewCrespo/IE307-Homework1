%homework 3  student id:517021910310
clear;
clc;
image1=imread("002.jpg");
image2=imread("003.jpg");
figure
imshow(image1);
figure
imshow(image2);

temp1=twodft(image1);
temp2=twodft(image2);

abs_temp1=abs(temp1);
angle_temp1=angle(temp1);
abs_temp2=abs(temp2);
angle_temp2=angle(temp2);

switch11=abs_temp1.*exp(1i*angle_temp2);
switch12=abs_temp2.*exp(1i*angle_temp1);

inverse_image1=itwodft(switch11);
inverse_image2=itwodft(switch12);
figure
imwrite(inverse_image1,"switch1.jpg");
imshow(inverse_image1);
figure
imwrite(inverse_image2,"switch2.jpg");
imshow(inverse_image2);

%delta1=im2double(image1)-inverse_image2;
%delta2=im2double(image2)-inverse_image1;



function [out] = twodft(image)
%2D DFT
%   此处显示详细说明
[a,b]=size(image);
c1=zeros(a,a);
c2=zeros(b,b);
for m=0:a-1
    for n=0:a-1
        c1(m+1,n+1)=exp(-1j*2*pi*m*n/a);
    end
end

for m=0:b-1
    for n=0:b-1
        c2(m+1,n+1)=exp(-1j*2*pi*m*n/b);
    end
end
temp=im2double(image);
out=(c1)*(temp)*(c2);
end

function [iout] = itwodft(iimage)
% inverse 2d dft
[a,b]=size(iimage);
c1=zeros(a,a);
c2=zeros(b,b);
for m=0:a-1
    for n=0:a-1
        c1(m+1,n+1)=exp(1j*2*pi*m*n/a);
    end
end

for m=0:b-1
    for n=0:b-1
        c2(m+1,n+1)=exp(1j*2*pi*m*n/b);
    end
end
temp=im2double(iimage);
iout=(c1)*(temp)*(c2)/(a*b);
end
