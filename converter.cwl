baseCommand: [fcToBedpe]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- id: inputfile
  inputBinding: {position: 1}
  type: File
outputs:
- id: fusionout
  outputBinding: {glob: output.bedpe}
  type: File
requirements:
- {class: DockerRequirement, dockerPull: jeltje/tobedpe}
stdout: output.bedpe
