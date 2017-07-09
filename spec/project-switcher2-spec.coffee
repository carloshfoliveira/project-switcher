describe "waiting for project-switcher2 to load", ->
  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('project-switcher2')

  it "should have waited long enough", ->
    expect(atom.packages.isPackageActive('project-switcher2')).toBe true

describe "when project-switcher2:toggle event is triggered", ->
  workspaceElement = null

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    jasmine.attachToDOM(workspaceElement)

  it "should attach and detach the view", ->
    waitsForPromise ->
      atom.packages.activatePackage('project-switcher2')
    runs ->
      expect(workspaceElement.querySelector('.project-switcher')).not.toExist()
      atom.commands.dispatch workspaceElement, 'project-switcher2:toggle'
      expect(workspaceElement.querySelector('.project-switcher2')).toExist()
      expect(workspaceElement.querySelector('.project-switcher2')).toHaveFocus()
      atom.commands.dispatch workspaceElement, 'project-switcher2:toggle'
      expect(workspaceElement.querySelector('.project-switcher2')).toExist()
      expect(workspaceElement.querySelector('.project-switcher2')).not.toHaveFocus()
