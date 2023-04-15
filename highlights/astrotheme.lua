return function(H) -- a table of overrides/changes to the astrodark theme
  local C = require "astrotheme.palettes.astrodark"
  H["Boolean"] = { fg = C.orange }
  H["Constant"] = { fg = C.orange }
  H["Identifier"] = { fg = C.red }
  H["NoiceCursor"] = { bg = C.surface2 }
  H["Type"] = { fg = C.purple }

  H["@keyword.function.rust"] = { fg = C.purple }
  H["@namespace.rust"] = { fg = C.cyan }
  H["@parameter"] = { fg = C.red }
  H["@punctuation.special"] = { fg = C.purple }
  H["@storageClass.lifetime"] = { fg = C.surface2 }

  H["@lsp.mod.constant"] = { fg = C.orange }
  H["@lsp.mod.mutable"] = { bold = true, underline = true }
  H["@lsp.type.attributeBracket"] = { fg = C.purple }
  H["@lsp.type.builtinType"] = { fg = C.blue }
  H["@lsp.type.decorator"] = { fg = C.orange }
  H["@lsp.type.enum"] = { fg = C.cyan }
  H["@lsp.type.interface"] = { fg = C.blue }
  H["@lsp.type.lifetime"] = { fg = C.surface2 }
  H["@lsp.type.macro"] = { fg = C.orange, italic = true }
  H["@lsp.type.namespace"] = { fg = C.cyan }
  H["@lsp.type.parameter"] = { italic = true }
  H["@lsp.type.selfKeyword"] = { fg = C.purple, italic = true }
  H["@lsp.type.selfTypeKeyword"] = { fg = C.purple }
  H["@lsp.type.typeParameter"] = { fg = C.surface2 }
  H["@lsp.typemod.enumMember.defaultLibrary"] = { fg = C.yellow }
  H["@lsp.typemod.method.defaultLibrary"] = { fg = C.blue }
  return H
end
