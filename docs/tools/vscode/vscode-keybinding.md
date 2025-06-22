# vscode 快捷键设置

打开键盘快捷键方式（json）文件。

```json
[
  {
    "key": "ctrl+shift+oem_comma",
    "command": "workbench.action.openSettingsJson"
  },

  // canceld key
  {
    "key": "ctrl+n",
    "command": "-workbench.action.files.newUntitledFile"
  },

  // nevigation
  {
    "key": "ctrl+h",
    "command": "workbench.action.navigateLeft"
  },
  {
    "key": "ctrl+l",
    "command": "workbench.action.navigateRight"
  },
  {
    "key": "ctrl+p",
    "command": "selectPrevCodeAction",
    "when": "codeActionMenuVisible"
  },
  {
    "key": "ctrl+n",
    "command": "selectNextCodeAction",
    "when": "codeActionMenuVisible"
  },
  {
    "key": "ctrl+p",
    "command": "quickInput.previous",
    "when": "inQuickInput && quickInputType == 'quickPick'"
  },
  {
    "key": "ctrl+n",
    "command": "quickInput.next",
    "when": "inQuickInput && quickInputType == 'quickPick'"
  },
  {
    "key": "tab",
    "command": "workbench.action.nextEditorInGroup",
    "when": "(vim.mode == 'Normal' || vim.mode == 'Visual') && (editorTextFocus || !inputFocus})"
  },
  {
    "key": "shift+tab",
    "command": "workbench.action.previousEditorInGroup",
    "when": "(vim.mode == 'Normal' || vim.mode == 'Visual') && (editorTextFocus || !inputFocus})"
  },
  {
    "key": "h",
    "command": "editor.action.scrollLeftHover",
    "when": "editorHoverFocused"
  },
  {
    "key": "j",
    "command": "editor.action.scrollDownHover",
    "when": "editorHoverFocused"
  },
  {
    "key": "k",
    "command": "editor.action.scrollUpHover",
    "when": "editorHoverFocused"
  },
  {
    "key": "l",
    "command": "editor.action.scrollRightHover",
    "when": "editorHoverFocused"
  },
  {
    "key": "space e",
    "command": "workbench.action.toggleSidebarVisibility",
    "when": "filesExplorerFocus && !inputFocus"
  },

  // file explorer
  {
    "key": "r",
    "command": "renameFile",
    "when": "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus"
  },
  {
    "key": "x",
    "command": "filesExplorer.cut",
    "when": "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus"
  },
  {
    "key": "c",
    "command": "filesExplorer.copy",
    "when": "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !inputFocus"
  },
  {
    "key": "p",
    "command": "filesExplorer.paste",
    "when": "explorerViewletVisible && filesExplorerFocus && !explorerResourceReadonly && !inputFocus"
  },
  {
    "key": "a",
    "command": "explorer.newFile",
    "when": "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !explorerResourceReadonly && !inputFocus"
  },
  {
    "key": "d",
    "command": "deleteFile",
    "when": "explorerResourceMoveableToTrash && filesExplorerFocus && foldersViewVisible && !explorerResourceReadonly && !inputFocus"
  },

  // others
  {
    "key": "alt+j",
    "command": "workbench.action.toggleMaximizedPanel"
  }
]
```
