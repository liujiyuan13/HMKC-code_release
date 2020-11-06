function [ H_normalized, HPs, beta, gamma, lambda, obj ] = iterative_multiple_kernel_clustering( K, lambda, class_num, midclass_set)

base_kernel_num = size(K, 3);
sample_num = size(K, 1);
layer_num = length(midclass_set);

HPs = cell(layer_num, 1);
gamma = cell(layer_num, 1);
for t=1:layer_num
    tmp = zeros(sample_num, midclass_set(t), base_kernel_num);
    for p=1:base_kernel_num
        tmp(:,:,p) = my_kernel_kmeans(K(:,:,p),midclass_set(t));
    end
    HPs{t} = tmp;
    gamma{t}= ones(base_kernel_num,1)/base_kernel_num;
end
beta = ones(base_kernel_num,1)/base_kernel_num;


t = 0;
flag = 1;
while flag
    %% update H
    H = update_H(beta, HPs{layer_num}, class_num);
%     t = t+1;
%     obj(t) = cal_obj(H, HP, K, midclass_set, beta, gamma, lambda);
    %% update W 
%     HP = update_HP_nor(H, HP, K, beta, gamma, lambda, midclass_set);
%     HP = update_HP_rev(H, HP, K, beta, gamma, lambda, midclass_set);
    if rem(t, 2) == 0
        HPs = update_HP_nor(H, HPs, K, beta, gamma, lambda, midclass_set);
    else
        HPs = update_HP_rev(H, HPs, K, beta, gamma, lambda, midclass_set);
    end
%     t = t+1;
%     obj(t) = cal_obj(H, HP, K, midclass_set, beta, gamma, lambda);
    %% update beta
    beta = update_beta(H, HPs{layer_num});
%     t = t+1;
%     obj(t) = cal_obj(H, HP, K, midclass_set, beta, gamma, lambda);
    %% update gamma
    gamma = update_gamma(HPs, K, midclass_set);
    
    t = t+1;
    obj(t) = cal_obj(H, HPs, K, midclass_set, beta, gamma, lambda);
    if t>=2 && (abs((obj(t-1)-obj(t))/(obj(t)))<1e-5 || t>100)
        flag =0;
    end
end
H_normalized = H./ repmat(sqrt(sum(H.^2, 2)), 1,class_num);

end

