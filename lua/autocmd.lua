local autocmd = {
  ColorsCmd = {
    {
      "ColorScheme",
      "*",
      [[lua require 'utils/color'.ModifyBufferColors()]]
    }
  },
  GeneralAutocmds = {
    {
      "CompleteDone",
      "*",
      "silent! pclose"
    },
    {
      "CursorMoved",
      "*",
      "silent! pclose"
    },
    {
      "VimLeavePre",
      "*",
      [[lua require 'utils/session'.SessionSave()]]
    },
    {
      "VimEnter",
      "*",
      [[lua require 'utils/path'.Path()]]
    },
    {
      "VimResized",
      "*",
      "wincmd ="
    },
    {
      "QuickFixCmdPost",
      "[^l]*",
      "cwindow"
    },
    {
      "QuickFixCmdPost",
      "l*",
      "lwindow"
    }
  },
  FileTypeAutocmd = {
    {
      "FileType",
      "javascript,javascriptreact,typescript,typescriptreact",
      [[lua require 'utils/javascript'.Javascript()]]
    }
  },
  MkdirAutocmd = {
    {
      "BufNewFile",
      "*",
      [[call utils#mkdir(expand('<afile>:p:h'))]]
    }
  }
}

require "utils/general".Create_augroup(autocmd)
