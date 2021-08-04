# Hierarchical Multiple Kernel Clustering (HMKC)

Matalb implementation for AAAI21 paper:

- Jiyuan Liu, Xinwang Liu\*, Yuexiang Yang, Siwei Wang, Sihang Zhou: [Hierarchical Multiple Kernel Clustering](https://liujiyuan13.github.io/pubs/HMKC.pdf). 35th AAAI Conference on Artificial Intelligence, AAAI 2021.

## Introduction
**Abstract**

Current multiple kernel clustering algorithms compute a partition with the consensus kernel or graph learned from the pre-specified ones, while the emerging late fusion methods firstly construct multiple partitions from each kernel separately, and then obtain a consensus one with them. However, both of them directly distill the clustering information from kernels or graphs with size $\mathbb{R}^{n\times n}$  to partition matrices with size $\mathbb{R}^{n\times k}$ , where n and k are the number of samples and clusters, respectively. This sudden drop of dimension would result in the loss of advantageous details for clustering. In this paper, we provide a brief insight of the aforementioned issue and propose a hierarchical approach to perform clustering while preserving advantageous details maximumly. Specifically, we gradually group samples into $\{c_t\}_{t=1}^s$ clusters, together with generating a sequence of intermediary matrices with size $\mathcal{R}^{n\times c_t}$, in which $n>c_1>\cdots>c_s>k$. A consensus partition with size $\mathbb{R}^{n\times k}$ is simultaneously learned and conversely guides the construction of intermediary matrices. This cyclic process is modeled into an unified objective and an alternative algorithm is designed to solve it. In addition, the proposed method is validated and compared with other representative multiple kernel clustering algorithms on benchmark datasets, demonstrating state-of-the-art performance by a large margin.

**Structure**

![structure](https://github.com/liujiyuan13/HMKC-code_release/blob/main/fig/framework_with_graph-crop.png)

## Citation

If you find our code useful, please cite:

	@inproceedings{DBLP:conf/aaai/0003LWZY21,
		author    = {Jiyuan Liu and
		            Xinwang Liu and
		            Siwei Wang and
		            Sihang Zhou and
		            Yuexiang Yang},
		title     = {Hierarchical Multiple Kernel Clustering},
		booktitle = {Thirty-Fifth {AAAI} Conference on Artificial Intelligence, {AAAI}
		            2021, Thirty-Third Conference on Innovative Applications of Artificial
		            Intelligence, {IAAI} 2021, The Eleventh Symposium on Educational Advances
		            in Artificial Intelligence, {EAAI} 2021, Virtual Event, February 2-9,
		            2021},
		pages     = {8671--8679},
		publisher = {{AAAI} Press},
		year      = {2021},
		url       = {https://ojs.aaai.org/index.php/AAAI/article/view/17051},
		timestamp = {Sat, 05 Jun 2021 18:11:55 +0200},
		biburl    = {https://dblp.org/rec/conf/aaai/0003LWZY21.bib},
		bibsource = {dblp computer science bibliography, https://dblp.org}
	}

## More
- For more related researches, please visit my homepage: [https://liujiyuan13.github.io](https://liujiyuan13.github.io).
- For data and discussion, please message me: liujiyuan13@nudt.edu.cn





