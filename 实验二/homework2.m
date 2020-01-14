%homework 2
clear;
clc;
image=imread("005.jpg");
image=rgb2gray(image);
image=im2double(image);
imshow(image);
[m,n]=size(image);
fun1=@(block_struct) mydct(block_struct.data);
results= blockproc (image, [8,8],fun1);
mask1=[1 1 1 1 1 1 0 0;
      1 1 1 1 1 0 0 0;
      1 1 1 1 0 0 0 0;
      1 1 1 0 0 0 0 0;
      1 1 0 0 0 0 0 0;
      1 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0;];
temp1=blkproc(results,[8,8],'P1.*x' ,mask1);
fun2=@(block_struct) imydct(block_struct.data);
inverse1=blockproc (temp1, [8,8],fun2);
figure
imwrite(inverse1,"dct6.jpg")
imshow(inverse1);

mask2=[1 1 1 1 0 0 0 0;
       1 1 1 0 0 0 0 0;
       1 1 0 0 0 0 0 0;
       1 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0;];
temp2=blkproc(results,[8,8],'P1.*x' ,mask2);
inverse2=blockproc (temp2, [8,8],fun2);
figure
imwrite(inverse2,"dct4.jpg");
imshow(inverse2);




function [out] = mydct(f)
% my own dct transformation
[m,n]=size(f);
F1=zeros(m,m);
F2=zeros(n,n);
for u=0:m-1
    for v=0:m-1
        F1(u+1,v+1)=cos((v+0.5)*pi*u/m);
    end
end

for u=0:n-1
    for v=0:n-1
        F2(u+1,v+1)=cos((u+0.5)*pi*v/n);  
    end
end
F1(1,:)=F1(1,:)./sqrt(2);
F2(:,1)=F2(:,1)./sqrt(2);
out=2*F1*f*F2/sqrt(m*n);
end

function [out] = imydct(f)
% my own inverse dct transformation
[m,n]=size(f);

F1=zeros(m,m);
F2=zeros(n,n);
for u=0:m-1
    for v=0:m-1
        F1(u+1,v+1)=cos((v+0.5)*pi*u/m);
    end
end

for u=0:n-1
    for v=0:n-1
        F2(u+1,v+1)=cos((u+0.5)*pi*v/n);
        
    end
end
F1(1,:)=F1(1,:)./sqrt(2);
F2(:,1)=F2(:,1)./sqrt(2);
out=2*F1'*f*F2'/sqrt(m*n);
end