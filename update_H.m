function H = update_H( beta, HP, class_num )

base_kernel_num = size(HP,3);
sample_num = size(HP, 1);

temp = zeros(sample_num, sample_num);
for p=1:base_kernel_num
    temp = temp + beta(p)*HP(:,:,p)*HP(:,:,p)';
end

temp= (temp+temp')/2;
opt.disp = 0;
[H,~] = eigs(temp,class_num,'LA',opt);
% H = H ./ repmat(sqrt(sum(H.^2, 2)), 1,cluster_count);

end

