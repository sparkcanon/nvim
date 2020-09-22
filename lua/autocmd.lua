local autocmd = {
  ColorsCmd = {
    {
      "ColorScheme",
      "*",
      [[lua require 'functions/color'.ModifyBufferColors()]]
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
      [[lua require 'functions/session'.SessionSave()]]
    },
    {
      "VimEnter",
      "*",
      [[lua require 'functions/path'.Path()]]
    },
    {
      "VimResized",
      "*",
      "wincmd ="
    }
  },
  FileTypeAutocmd = {
    {
      "FileType",
      "javascript,javascriptreact,typescript,typescriptreact",
      [[lua require 'functions/javascript'.Javascript()]]
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

require "utils".Create_augroup(autocmd)
