clear
clc

src_path = 'D:\Work\datasets\Kmatrix\';
proj_path = 'D:\Jiyuan\IMKC-code\';
data_name = 'AR10P';
load([src_path, data_name, '_Kmatrix'], 'KH', 'Y');

class_num = length(unique(Y));
kernel_num = size(KH, 3);
sample_num = size(KH, 1);

K = kcenter(KH);
K = knorm(K);

lambda = 1;
firc = [3:1:10]*class_num;
secc = [2:1:10]*class_num;

acc = cell(length(firc),length(secc));
nmi = cell(length(firc),length(secc));
pur = cell(length(firc),length(secc));

ts = cell(length(firc),length(secc));

for ifi = 1:length(firc)
    for ise = 1:ifi+1
        tic;
        [H_normalized, betatmp, gammatmp, ~, objtmp] = ...
            iterative_multiple_kernel_clustering( K, lambda, class_num, [firc(ifi), secc(ise)]);
        ytmp = my_lite_kmeans(H_normalized, class_num);
        eval = my_eval_y(ytmp, Y);
        ts{ifi, ise} = toc;
        
        acc{ifi, ise} = eval(1);
        nmi{ifi, ise} = eval(2);
        pur{ifi, ise} = eval(3);

        fprintf('time: %f, first c: %d, second c: %d, ', ts{ifi, ise}, firc(ifi)/class_num, secc(ise)/class_num);
        fprintf('acc: %f, nmi: %f, pur: %f\n', acc{ifi, ise}, nmi{ifi, ise}, pur{ifi, ise}); 
    end
end