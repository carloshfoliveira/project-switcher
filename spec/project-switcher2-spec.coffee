ProjectSwitcher2 = require '../lib/project-switcher2'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "ProjectSwitcher2", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('projectSwitcher2')

  describe "when the project-switcher2:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.project-switcher2')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'project-switcher2:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.project-switcher2')).toExist()
        atom.workspaceView.trigger 'project-switcher2:toggle'
        expect(atom.workspaceView.find('.project-switcher2')).not.toExist()
