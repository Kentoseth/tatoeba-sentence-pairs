# Package

version       = "0.0.1"
author        = "Kentoseth"
description   = "A CLI that generates sentence pairs from the Tatoeba corpus and exports as JSON"
license       = "GPL-3.0"
srcDir        = "src"
bin           = @["csvparser"]


# Dependencies

requires "nim >= 0.20.99"
requires "cligen >= 0.9.31"