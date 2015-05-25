{SelectListView} = require 'atom-space-pen-views'
utils = require './utils'

workspace_view = atom.views.getView(atom.workspace).__spacePenView

module.exports =
class ProjectSwitcher2View extends SelectListView

  initialize: (serializeState) ->
    super
    @addClass 'project-switcher2 overlay from-top'
    workspace_view.command "project-switcher2:toggle", => @toggle()

  viewForItem: (item) ->
    "<li>#{item.name}</li>"

  confirmed: (item) ->
    atom.project.setPaths [item.fullpath]
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
      @destroy()
    else
      @setItems utils.listProjects()
      workspace_view.append(this)
      @focusFilterEditor()
