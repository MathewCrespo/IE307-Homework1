%% homework 1.2
clear;
clc;
image=imread ("002.jpg");
temp=im2double(image);
results=mydct(temp);
figure
imshow(image);
%% show dct 
figure
imwrite(results,"dct.jpg");
imshow(results);

%% show idct
figure
final=imydct(results);
imwrite(final,"idct.jpg");
imshow(im2double(final));
function [out] = mydct(f)
% my own dct transformation student ID 517021910310
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


