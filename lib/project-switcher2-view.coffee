{SelectListView} = require 'atom-space-pen-views'
utils = require './utils'

module.exports =
class ProjectSwitcher2View extends SelectListView

  initialize: (serializeState) ->
    super
    @addClass 'project-switcher2 overlay from-top'
    atom.workspaceView.command "project-switcher2:toggle", => @toggle()

  viewForItem: (item) ->
    "<li>#{item.name}</li>"

  confirmed: (item) ->
    atom.project.setPath item.fullpath
    for pane in atom.workspace.getPanes()
      pane.destroy()
    @destroy()

  getFilterKey: ()->
    'name'

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    if @hasParent()
      @detach()
    else
      @setItems utils.listProjects()
      atom.workspaceView.append(this)
      @focusFilterEditor()
