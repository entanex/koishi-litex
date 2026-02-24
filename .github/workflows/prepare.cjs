const { readFileSync, writeFileSync } = require('fs')

const source = JSON.parse(readFileSync('package.json', 'utf8'))
Object.assign(source.dependencies, source.optionalDependencies)

source.scripts = {
  start: source.scripts.start,
}

writeFileSync('package.json', JSON.stringify(source, null, 2))
