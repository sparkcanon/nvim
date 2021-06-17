local snap = require "snap"
local S = {}

function S.Files()
  snap.run {
    producer = snap.get "consumer.fzf"(snap.get "producer.fd.file"),
    select = snap.get "select.file".select,
    multiselect = snap.get "select.file".multiselect,
    views = {snap.get "preview.file"},
    prompt = "Files"
  }
end

function S.Grep()
  snap.run {
    producer = snap.get "producer.ripgrep.vimgrep",
    select = snap.get "select.vimgrep".select,
    multiselect = snap.get "select.vimgrep".multiselect,
    views = {snap.get "preview.vimgrep"},
    prompt = "Grep"
  }
end

return S
