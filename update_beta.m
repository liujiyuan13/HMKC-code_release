function beta = update_beta( H, HP)

base_kernel_num = size(HP, 3);

V = zeros(base_kernel_num,1);
for p=1:base_kernel_num
    V(p) = trace(H*H'*HP(:,:,p)*HP(:,:,p)');
end

beta = V./norm(V,2);

end

