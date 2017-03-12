clear
clc


%%----uigetfile===>Open standard dialog box for retrieving files
%%----[FileName,PathName] = uigetfile(FilterSpec)-----------
 [imname,impath]=uigetfile({'*.jpg;'});
 J=imread([impath,'/',imname]);

%Convert the image into Grayscale----
I = rgb2gray(J);

%%--- Declaring all images in the folder--------------
imname1='20.jpg';
imname2='50.jpg';
imname3='100.jpg';
imname4='500.jpg';
imname5='1000.jpg';
imname6='5000.jpg';

%%-----strcmp===>Compare strings with case sensitivity-----
%---- divide image to get dots in the note-----------

if  strcmp(imname,imname1)==1
   I1= I(94:118,31:68,:); 

elseif  strcmp(imname,imname2)==1
   I1= I(114:170,53:88,:); 

elseif strcmp(imname,imname3)==1
   I1= I(55:140,15:35,:); 

elseif strcmp(imname,imname4)==1

elseif strcmp(imname,imname5)==1
   I1= I(55:140,15:35,:); 

elseif strcmp(imname,imname6)==1
   I1= I(100:270,43:73,:); 

end

%Convert the image that has cropped from the grayscale image into Black & White image using 0.42 threshold--------------
I2=im2bw(I1,0.42);
%------------------------------------------Get the complement of the image----------------------------------------------
I4 = imcomplement(I2);
%-----------------------------------------Remove the dust and fill holes-----------------------------------------------
I3=medfilt2(I4);
%-----------------------------------------Count number of dots in the image -------------------------------------------
[L,N1]=bwlabel(I3,4);
%-----------------------------------------Get the number of dots as N -----------------------------------------
N=N1;
%-----------------------------------------Using the number of dots recognize the currency note value-------------------


if N==1  %(There are 1 dot in the 20 note)
    name='TWENTY RUPEES';
    value=20;
    result= fprintf('Recognized currency is : %s  %d \n', name, value);
elseif N==2  %(There are 2dots in the 50 note)
    name='FIFTY RUPEES';
    value=50;
    result= fprintf('Recognized currency is : %s  %d \n', name, value);   
elseif N==3  %(There are 3 dots in the 100 note)
    name='ONE HUNDRED RUPEES';
    value=100;
    result= fprintf('Recognized currency is :%s  %d \n', name, value);
elseif N==4  %(There are 4 dots in the 500 note)
    name='FIVE HUNDRED RUPEES';
    value=500;
    result= fprintf('Recognized currency is : %s  %d \n', name, value);
elseif N==5 %(There are 5 dots in the 1000 note)
    name='ONE THOUSAND RUPEES';
    value=1000;
    result= fprintf('Recognized currency is : %s  %d \n', name, value);
elseif N==6  %(There are 6 dots in the 5000 note)
    name='FIVE THOUSAND RUPEES';
    value=5000;
    result= fprintf('Recognized currency is : %s  %d \n', name, value); 

else 
    fprintf('No recognized currency ');
end

