baseCommand: [fusioncatcher]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- id: fastq
  inputBinding: {itemSeparator: ',', position: 2, prefix: --input, separate: true}
  type: {items: File, type: array}
- default: true
  doc: Do not check for updates
  id: noupdate
  inputBinding: {prefix: --skip-update-check}
  type: ['null', boolean]
- default: outdir
  doc: Directory for output files
  id: outputdir
  inputBinding: {prefix: --output}
  type: ['null', string]
label: FusionCatcher fusion caller tool by Daniel Nicorici
outputs:
- id: output
  outputBinding: {glob: $(inputs.outputdir)/final-list_candidate-fusion-genes.GRCh37.txt}
  type: File
requirements:
- {class: DockerRequirement, dockerPull: jeltje/fusioncatcher}
