fs = require 'fs-plus'
path = require 'path'

exports.listProjects = ()->
  exports.getSiblingProjects()

exports.getSiblingProjects = () ->
  parent = path.dirname atom.project.getPaths()
  paths = fs.readdirSync parent
  projects = []
  paths.forEach (name) ->
    fullpath = parent + '/' + name
    if fs.isDirectorySync fullpath
      projects.push name:name, fullpath:fullpath
  return projects
