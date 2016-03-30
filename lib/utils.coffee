fs = require 'fs-plus'
path = require 'path'

exports.listProjects = ()->
  if atom.config.get('project-switcher2.useProjectHome')
    exports.getProjectsPath()
  else
    exports.getSiblingProjects()

exports.getSiblingProjects = () ->
  paths = atom.project.getPaths()
  paths.forEach (projectPath) ->
    index = paths.indexOf projectPath
    value = path.dirname projectPath
    paths[index] = value

  return exports.readProjectsPaths(paths)

exports.getProjectsPath = () ->
  paths = atom.config.get('core.projectHome')
  paths = paths.replace(';', ',').split(',')
  return exports.readProjectsPaths(paths)

exports.readProjectsPaths = (paths) ->
  projects = {}
  for projectPath in paths
    do (projectPath) ->
    try
      projectsInPath = fs.readdirSync projectPath
    catch error
      continue
    projects[projectPath] = projectsInPath

  return exports.readProjects(projects)

exports.readProjects = (projects) ->
  projectsList = []
  for parent,folders of projects
    paths = projects[parent]
    paths.forEach (project) ->
      fullPath = parent + '/' + project
      if fs.isDirectorySync fullPath
        name = path.basename parent
        name = name + '/' + project
        projectsList.push name:name, fullpath: fullPath

  return projectsList
