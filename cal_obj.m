function obj = cal_obj(H, HPs, K, midclass_set, beta, gamma, lambda)

base_kernel_num = size(K,3);
layer_num = length(midclass_set);

obj = 0;

for t=1:layer_num
    if t==1
        tmp = 0;
        tmpHPt = HPs{t};
        tmpgammat = gamma{t};
        for p=1:base_kernel_num
            tmp = tmp + tmpgammat(p)*trace(K(:,:,p)*tmpHPt(:,:,p)*tmpHPt(:,:,p)');
        end
        obj = obj + tmp;
    else
        tmp = 0;
        tmpHPt = HPs{t};
        tmpHPt0 = HPs{t-1};
        tmpgammat = gamma{t};
        for p=1:base_kernel_num
            tmp = tmp + tmpgammat(p)*trace(tmpHPt0(:,:,p)*tmpHPt0(:,:,p)'*tmpHPt(:,:,p)*tmpHPt(:,:,p)');
        end
        obj = obj + tmp;
    end
end

tmp = 0;
tmpHPt = HPs{layer_num};
for p = 1:base_kernel_num
    tmp = tmp + beta(p)*trace(H*H'*tmpHPt(:,:,p)*tmpHPt(:,:,p)');
end

obj = obj + lambda * tmp;

end

