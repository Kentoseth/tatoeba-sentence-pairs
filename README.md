# tatoeba-sentence-pairs

This project is a high-performance and self-contained CLI clone of the [sentence-pairs](https://github.com/kmicklas/sentence-pairs) project. The Nim programming language was used for 2 reasons:

 - To increase the performance of execution on the large CSV/raw-data files containing all the Tatoeba languages and links
 - To provide a self-contained binary CLI application that can be executed without dependencies or runtimes

This application generates sentence pairs from the Tatoeba corpus and exports as JSON.

## Contents
 * [Requirements](#requirements)
 * [Compiling](#compile)
 * [Installation](#installation)
 * [Releases](#releases)
 * [Usage](#usage)
 * [Contribute](#contribute)
 * [License](#license)
 * [Queries](#queries)

## Requirements

 * csvparser binary (available under "Releases")
 * The sentence-output file available [here](https://tatoeba.org/eng/downloads)
 * The links file matching sentences with their translations available [here](https://tatoeba.org/eng/downloads)

## Compile

 * Run the `csvparser.nimble` file to install the dependencies
 * Dependencies: cligen
 * `cd src`
 * `nim c -d:release csvparser.nim`
 * (this program was compiled on the `devel` branch of Nim, which is/was `0.20.99` at time of compilation)

## Installation

 * Create a folder to store the binary file in, example: `mkdir ~/tatoeba-bin`
 * Place the binary file in `~/tatoeba-bin`
 * Export the PATH in your .profile or other file: `export PATH=/home/user/tatoeba-bin:$PATH`
 * Refresh by starting a new terminal session or using: `source .profile`
 * The CLI should now be globally executable

(if you don't want to make the program globally executable, just make sure the binary file is in the same directory as the CSV/raw-data files)

## Releases

Available at: https://github.com/Kentoseth/tatoeba-sentence-pairs/releases

Release will contain:

 * `csvparser` binary
 * This README file

**NOTE** This binary only supports Linux X64 distros. It is untested on Mac and will need to be compiled on Mac/Windows to work on those operating systems

## Usage

csvparser currently has 1 supported command: main

 * `./csvparser main -t=cmn -o=eng -s=sentences_file.csv -l=links_file.csv` - will fetch all `cmn` sentences and find the corresponding `eng` translations, removing any empty translations and then exporting as JSON `output-ara-eng.json`

Use `./csvparser --help` or `./csvparser main --help` for more information.

## Contribute

You can create a PR or discuss it first by opening an Issue

PR Rules:

 * Make sure the program compiles
 * Test it locally to make sure the program runs
 * If the code is not readable, the PR may be rejected

This project follows the UNIX philosophy of doing one thing only and (hopefully) doing it well.

## License

This package is licensed under the open-source "GNU GPL, Version 3".

The full license text is available in the file LICENSE

## Queries

Open an Issue to discuss

-----

If you find this project interesting or useful, please star it and share it with colleagues and friends.
