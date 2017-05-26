class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': jeltje@synapse.org,
  'foaf:name': jeltje}
doc: 'SMC-RNA challenge fusion detection submission

  Fusioncatcher fusion caller workflow'
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: convert/fusionout, type: File}
requirements:
- {class: MultipleInputFeatureRequirement}
steps:
- id: convert
  in:
  - {id: inputfile, source: fusioncatcher/output}
  out: [fusionout]
  run: converter.cwl
- id: fusioncatcher
  in:
  - id: fastq
    source: [main/TUMOR_FASTQ_1, main/TUMOR_FASTQ_2]
  out: [output]
  run: fusioncatcher.cwl
