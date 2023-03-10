return function(H) -- a table of overrides/changes to the astrodark theme
  local C = require "astrotheme.palettes.astrodark"
  H["NoiceCursor"] = { bg = C.white }

  H["@constant.rust"] = { fg = C.orange }
  H["@keyword.function.rust"] = { fg = C.purple }
  H["@namespace.rust"] = { fg = C.cyan }
  H["@operator"] = {}
  H["@punctuation.special"] = { fg = C.purple }
  H["@storageClass.lifetime"] = { fg = C.white }

  H["@lsp.mod.constant"] = { fg = C.orange }
  H["@lsp.mod.mutable"] = { bold = true, underline = true }
  H["@lsp.type.attributeBracket"] = { fg = C.purple }
  H["@lsp.type.decorator"] = { fg = C.orange }
  H["@lsp.type.enum"] = { fg = C.cyan }
  H["@lsp.type.function"] = { fg = C.blue }
  H["@lsp.type.interface"] = { fg = C.blue }
  H["@lsp.type.keyword"] = { fg = C.purple }
  H["@lsp.type.lifetime"] = { fg = C.white }
  H["@lsp.type.macro"] = { fg = C.orange, italic = true }
  H["@lsp.type.method"] = { fg = C.blue }
  H["@lsp.type.namespace"] = { fg = C.cyan }
  H["@lsp.type.parameter"] = { fg = C.red, italic = true }
  H["@lsp.type.property"] = { fg = C.red }
  H["@lsp.type.selfKeyword"] = { fg = C.purple, italic = true }
  H["@lsp.type.selfTypeKeyword"] = { fg = C.purple }
  H["@lsp.type.typeParameter"] = { fg = C.white }
  H["@lsp.type.variable"] = { fg = C.red }
  return H
end
