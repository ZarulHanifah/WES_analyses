rule concordance_NA12878:
	input:
		ref = rules.download_reference_genome.output,
		intervals = config["exon_bed"],
		truth_vcf = config["NA12878_validation_vcf"],
		truth_idx = config["NA12878_validation_vcf"] + ".tbi",
		eval_vcf = rules.funcotator.output.vcf,
		eval_idx = rules.funcotator.output.idx
	output:
		os.path.join(config["intermediate_path"], "single_calling/concordance_NA12878/{sample}.tsv")
	conda:
		"../envs/gatk.yaml"
	log:
		os.path.join(config["intermediate_path"], "log/single_calling/concordance_NA12878/{sample}.log")
	shell:
		"""
		gatk Concordance \
			-R {input.ref} \
			-eval {input.eval_vcf} \
			--truth {input.truth_vcf} \
			--intervals {input.intervals} \
			--summary {output} 2> {log}
		"""
