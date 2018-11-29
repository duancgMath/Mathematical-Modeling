
clear, clc

%% Image compress based on SVD
A = imread('lena.bmp');
A = rgb2gray(A);
A = im2double(A);
[u, s, v] = svd(A);

figure
imshow(A)
title('Image')

ss = zeros(size(s));
for alpha = 0.05:0.05:0.30
  k = floor(size(s,1)*alpha);
  ss(1:k,1:k) = s(1:k,1:k);
  ratio = sum(diag(ss))/sum(diag(s));
  A = u*ss*v';
  figure
  imshow(A)
  title(['alpha=',num2str(alpha),' ratio=',num2str(ratio)])
end


figure
comet3(X(1,:),X(2,:),X(3,:)) 
plot3(X(1,:),X(2,:),X(3,:),'-o')
grid on
xlabel('I')
ylabel('II')
zlabel('III')
