fs = require 'fs-plus'
path = require 'path'

exports.listProjects = ()->
  paths = []

  if atom.config.get('project-switcher2.useProjectHome')
    projectHomePaths = exports.getProjectsPath()
    paths = paths.concat(projectHomePaths)

  siblingPaths = exports.getSiblingProjects()
  projectsLocations = exports.getProjectsLocation()

  paths = paths.concat(siblingPaths, projectsLocations)

  return exports.readProjectsPaths(paths)

exports.getProjectsLocation = () ->
  projectsLocations = atom.config.get('project-switcher2.projectsLocations')
  return projectsLocations.replace(';', ',').split(',')

exports.getSiblingProjects = () ->
  siblingPaths = atom.project.getPaths()
  siblingPaths.forEach (projectPath) ->
    index = siblingPaths.indexOf projectPath
    value = path.dirname projectPath
    siblingPaths[index] = value

  return siblingPaths

exports.getProjectsPath = () ->
  projectHomePaths = atom.config.get('core.projectHome')
  return projectHomePaths.replace(';', ',').split(',')

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
        if Object.keys(projects).length > 1
          parent_basename = path.basename parent
          name = parent_basename + '/' + project
        else
          name = project
        projectsList.push name:name, fullpath: fullPath

  return projectsList
