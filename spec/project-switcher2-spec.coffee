# woProjectSwitcher2 = require '../lib/project-switcher2'
#
# # Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
# #
# # To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# # or `fdescribe`). Remove the `f` to unfocus the block.
#
# describe "ProjectSwitcher2", ->
#   activationPromise = null
#   workspaceElement = null
#   editorElement = null
#   beforeEach ->
#     workspaceElement = atom.views.getView(atom.workspace)
#     editorElement = atom.views.getView(atom.workspace.getActiveTextEditor())
#     waitsForPromise ->
#       atom.packages.activatePackage('project-switcher2')
#
#   describe "when asked whether project-switcher2 is active or not", ->
#     it "should be true", ->
#       expect(atom.packages.isPackageActive('project-switcher2')).toBe true
#
#   describe "when the project-switcher2:toggle event is triggered", ->
#     it "attaches and then detaches the view", ->
#       expect(editorElement.getElementsByClassName('.project-switcher2')).toEqual([])
#
#       # This is an activation event, triggering it will cause the package to be
#       # activated.
#       atom.commands.dispatch(workspaceElement, 'project-switcher2:toggle')
#
#       runs ->
#         expect(editorElement.getElementsByClassName('.project-switcher2')).not.toEqual([])
#         atom.commands.dispatch(workspaceElement, 'project-switcher2:toggle')
#         expect(editorElement.find('.project-switcher2')).toEqual([])
