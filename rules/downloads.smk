rule download_reference_genome:
	output:
		os.path.join(config["intermediate_path"], "GRCh38_full_analysis_set_plus_decoy_hla.fa")
	params:
		url = config["reference_genome_url"]
	shell:
		"""
		wget -c {params.url} -O {output}
		"""

