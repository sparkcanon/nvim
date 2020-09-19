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
      [[call path_job#setProjectPath()]]
    },
    {
      "VimResized",
      "*",
      "wincmd ="
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
