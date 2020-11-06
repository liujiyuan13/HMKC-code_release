function HPs = update_HP_rev( H, HPs, K, beta, gamma, lambda, midclass_set )

base_kernel_num = size(K,3);
sample_num = size(H, 1);
layer_num = length(midclass_set);

if layer_num==1
    
    tmpHP = zeros(sample_num, midclass_set(1), base_kernel_num);
    tmpgamma = gamma{1};
    for p=1:base_kernel_num
        tmp = tmpgamma(p)*K(:,:,p) + lambda*beta(p)*H*H';
        tmp= (tmp+tmp')/2;
        opt.disp = 0;
        [Hptmp,~] = eigs(tmp,midclass_set(layer_num),'LA',opt);
        tmpHP(:,:,p) = Hptmp;
    end
    HPs{1} = tmpHP;
    
    
else
    
    for t=layer_num:-1:1
        tmpHPt = zeros(sample_num, midclass_set(t), base_kernel_num);
        if t==1
            tmpHPt1 = HPs{t+1};
            tmpgammat = gamma{t};
            tmpgammat1 = gamma{t+1};
            for p = 1:base_kernel_num
                tmp = tmpgammat(p)*K(:,:,p) + tmpgammat1(p)*tmpHPt1(:,:,p)*tmpHPt1(:,:,p)';
                tmp= (tmp+tmp')/2;
                opt.disp = 0;
                [Hptmp,~] = eigs(tmp,midclass_set(t),'LA',opt);
                tmpHPt(:,:,p) = Hptmp;
            end
        elseif t==layer_num
            tmpHPt0 = HPs{t-1};
            tmpgammat = gamma{t};
            for p = 1:base_kernel_num
                tmp = tmpgammat(p)*tmpHPt0(:,:,p)*tmpHPt0(:,:,p)' + lambda*beta(p)*H*H';
                tmp= (tmp+tmp')/2;
                opt.disp = 0;
                [Hptmp,~] = eigs(tmp,midclass_set(t),'LA',opt);
                tmpHPt(:,:,p) = Hptmp;
            end
        else
            tmpHPt0 = HPs{t-1};
            tmpHPt1 = HPs{t+1};
            tmpgammat = gamma{t};
            tmpgammat1 = gamma{t+1};
            for p = 1:base_kernel_num
                tmp = tmpgammat(p)*tmpHPt0(:,:,p)*tmpHPt0(:,:,p)' + tmpgammat1(p)*tmpHPt1(:,:,p)*tmpHPt1(:,:,p)';
                tmp= (tmp+tmp')/2;
                opt.disp = 0;
                [Hptmp,~] = eigs(tmp,midclass_set(t),'LA',opt);
                tmpHPt(:,:,p) = Hptmp;
            end
        end
        HPs{t} = tmpHPt;
    end

end






end

