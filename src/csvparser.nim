import parsecsv
import os
import strutils
import tables
import json

var p: CsvParser #the main language file

var y: CsvParser #the link file matching the translations

# this object stores the index and sequence of translations for each main sentence from the first chosen language
type
  main_table_data = object
    f0* : string
    f1* : seq[string]

# this table holds the target sentence(f0) and the translations that match to it stored in a sequence(f1)
var main_table = newTable[string, main_table_data]()

# stores the translations
var second_table = newTable[string, string]()

# used to store targets with empty elements
var counter : seq[int] = @[]

# the main function that executes the filtering; requires 4 inputs
proc main(target: string = "", translation: string = "", sentences_file: string = "", links_file: string ="") =

  ## >>example: ./csvparser main -t=cmn -o=eng -s=sentences_file.csv -l=links_file.csv

  p.open(sentences_file, separator='\t', quote = '\0')

  y.open(links_file, separator='\t')

  # looping through the first file, necessary due to how the parsecsv module works
  while p.readRow():

    if p.row[1] == target:

      main_table[p.row[0]] = main_table_data(f0: p.row[2])

    elif p.row[1] == translation:
      second_table[p.row[0]] =  p.row[2]


  # see line 33
  while y.readRow():

    # checks if the links file has the first and second values
    # in the main and second table
    if y.row[0] in main_table and y.row[1] in second_table:

      main_table[y.row[0]].f1.add(second_table[y.row[1]]) # adding multiple translations associated with each target sentence


  # checks for empty elements and adds them to the counter
  for x, y in main_table:

    if y.f1 == []:

      counter.add(parseInt(x))

    # echo x
    # 47
    # echo y
    # (f0: "如果我可以像那樣的話...", f1: @[])

  # removes empty elements from main_table
  for x in counter:
    main_table.del(intToStr(x))


  var myjs = $(%main_table) #converts main_table from a table to json

  var file_name: string = "output-" & target & "-" & translation & ".json" #generates filename for output
  # no checking for existing filenames, be careful of file overwrites!

  writeFile(file_name, myjs)

  p.close()

  y.close()

# Unneeded test function to make sure cligen is working correctly
proc upath(run: seq[string]) =

  ## for testing purposes. Can ignore

  echo "Test"

when isMainModule:
  import cligen
  dispatchMulti([ main, short = { "target": 't', "translation": 'o', "sentences_file": 's', "links_file": 'l' } ],
                [ upath ] )
