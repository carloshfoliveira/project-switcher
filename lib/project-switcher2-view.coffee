{SelectListView} = require 'atom-space-pen-views'
utils = require './utils'


module.exports =
class ProjectSwitcher2View extends SelectListView

  initialize: (serializeState) ->
    super()
    @addClass('project-switcher2')
    atom.commands.add "atom-workspace", "project-switcher2:toggle", => @toggle()

  viewForItem: (item) ->
    "<li>#{item.name}</li>"

  confirmed: (item) ->
    if atom.config.get('project-switcher2.openInAnotherWindow')
      atom.open {
        pathsToOpen: [item.fullpath]
        newWindow: true
      }
      @cancel
    else
      atom.project.setPaths [item.fullpath]
    if atom.config.get('project-switcher2.closePanes')
      for pane in atom.workspace.getPanes()
        pane.destroy()
    @cancel()

  cancelled: ->
    @hide()

  # Tear down any state and detach
  destroy: ->
    @detach()

  show: ->
    @panel ?= atom.workspace.addModalPanel(item: this)
    @panel.show()

    @storeFocusedElement()

    items = utils.listProjects()

    @setItems(items)
    @focusFilterEditor()

  toggle: ->
    if @panel?.isVisible()
      @cancel()
    else
      @show()

  hide: ->
    @panel?.hide()

  getFilterKey: ->
    'name'
