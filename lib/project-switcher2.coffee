ProjectSwitcher2View = require './project-switcher2-view'

module.exports =
  projectSwitcher2View: null

  activate: (state) ->
    @projectSwitcher2View = new ProjectSwitcher2View(state.projectSwitcher2ViewState)

  deactivate: ->
    @projectSwitcher2View.destroy()

  serialize: ->
    projectSwitcher2ViewState: @projectSwitcher2View.serialize()
