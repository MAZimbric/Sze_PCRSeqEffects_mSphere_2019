library(tidyverse)

stool_alpha_file <- "data/mothur/stool.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.opti_mcc.groups.ave-std.summary"

read_tsv(stool_alpha_file) %>%
	separate(group, into=c("rounds", "polymerase", "dummy1", "dummy2", "subject")) %>%
	mutate(rounds = str_replace(rounds, "x", "")) %>%
	filter(method == 'ave') %>%
	select(rounds, polymerase, subject, nseqs, coverage, invsimpson, shannon, sobs) %>%
	gather(key=metric, value=value, nseqs, coverage, invsimpson, shannon, sobs) %>%
	write_tsv("data/process/stool_alpha_diversity.tsv")
