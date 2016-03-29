fs = require 'fs-plus'
path = require 'path'

exports.listProjects = ()->
  if atom.config.get('project-switcher2.useProjectHome')
    exports.getProjectsPath()
  else
    exports.getSiblingProjects()

exports.getSiblingProjects = () ->
  parent = path.dirname atom.project.getPaths()
  return exports.readProjects(parent)

exports.getProjectsPath = () ->
  projectHome = atom.config.get('core.projectHome')
  return exports.readProjects(projectHome)

exports.readProjects = (projectsPath) ->
  paths = fs.readdirSync projectsPath
  projectList = []
  paths.forEach (projectName) ->
    fullPath = projectsPath + '/' + projectName
    if fs.isDirectorySync fullPath
      projectList.push name:projectName, fullpath:fullPath
  return projectList
