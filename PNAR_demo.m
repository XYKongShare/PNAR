clc;
clear;
close all;
gamma=2.2;
RGB=1;

img = im2double(imread('3.png'));

if size(img,3)==1
    f = img;
    gray = img;
else
    hsv = rgb2hsv(img);
    f = hsv(:,:,3);
    gray = rgb2gray(img);
end
I_ref = max(img,[],3); 

R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);
[RI, RR, Rw, Rstopterr] = newPR(R,I_ref);
[GI, GR, Gw, Gstopterr] = newPR(G,I_ref);
[BI, BR, Bw, Bstopterr] = newPR(B,I_ref);

RI_gamma = RI.^(1/gamma);
RS_gamma = RR .* RI_gamma;
GI_gamma = GI.^(1/gamma);
GS_gamma = GR .* GI_gamma;
BI_gamma = BI.^(1/gamma);
BS_gamma = BR .* BI_gamma;

enhance (:,:,1)= RS_gamma;
enhance (:,:,2)= GS_gamma;
enhance (:,:,3)= BS_gamma;

figure,imshow(enhance)





