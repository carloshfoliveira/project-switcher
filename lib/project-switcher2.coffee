ProjectSwitcher2View = require './project-switcher2-view'

module.exports =
  projectSwitcher2View: null

  config:
    closePanes:
      type: 'boolean'
      description: 'This option sets whether panes are closed when switching between sibling projects'
      default: false
    openInAnotherWindow:
      type: 'boolean'
      description: 'This option sets to open selected project in another window instead of the same one.'
      default: false
    useProjectHome:
      type: 'boolean'
      description: 'This options sets to switch between projects defined in Atom Settings. See Project Home option.'
      default: false
    projectsLocations:
      type: 'string'
      description: 'Set a list of paths where to find projects. You can set multiple paths separated by commas'
      default: ''

  activate: (state) ->
    @projectSwitcher2View = new ProjectSwitcher2View(state.projectSwitcher2ViewState)

  deactivate: ->
    @projectSwitcher2View.destroy()

  serialize: ->
    projectSwitcher2ViewState: @projectSwitcher2View.serialize()
