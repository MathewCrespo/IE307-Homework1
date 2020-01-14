%% homework 1.1
clear;
clc;
image=imread ("002.jpg");
%%imshow(image)
figure
imshow(image);
%% get dft pic
out=twodft(image);
figure
imshow(out);
imwrite(out,"1-1dft.jpg");
%% get abs dft pic and shift
out1=abs(out);
out1=255*out/max(max(out));
out2=out1
[a,b]=size(out1);
out1=circshift(out1,a/2,1);
out1=circshift(out1,b/2,2);
imshow(out1);
imwrite(out1,"1-1dftabs.jpg");
%% get idft image
iout=itwodft(out);
figure
imshow(iout);
imwrite(iout,"1-1idftimage.jpg");
%% find out the error
delta=im2double(image)-iout;


function [out] = twodft(image)
%2D DFT  to do the 2D DFT in Matrixes student ID 517021910310
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

