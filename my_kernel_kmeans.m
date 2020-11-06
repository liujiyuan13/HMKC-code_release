function H_normalized = my_kernel_kmeans( K,cluster_count )
opt.disp = 0;
% K0 = zeros(num);
% for i =1:num
%     Ki = zeros(num);
%     Ki(A(:,i),A(:,i)) = K(A(:,i),A(:,i));
%     K0 = K0 + Ki;
% end
K= (K+K')/2;
[H,~] = eigs(K,cluster_count,'LA',opt);
% H_normalized = H ./ repmat(sqrt(sum(H.^2, 2)), 1,cluster_count);
H_normalized = H;

end

