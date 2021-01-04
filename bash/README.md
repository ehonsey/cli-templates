# Bash CLI

This repository contains an interface for creating a simple, but
robust command line structure for a shell script.

## Overview

The following components are available for use or deletion in your CLI

### Usage

The `usage` function should provide detail on the script command,
available flags, and parameters. An example may be a program that
supports commands, such as:

```bash
./bash-cli-template.sh [-F|--FLAG] COMMAND [PARAMS]
```

The above syntax could then have the following variants:

```bash
./bash-cli-template.sh -h
./bash-cli-template.sh --help
./bash-cli-template.sh --dry-run upload
./bash-cli-template.sh upload FILENAME --dry-run
./bash-cli-template.sh list
```

The template has built-in logic for parsing flags (-|--) and script
arguments. Your script will contain the logic for utilizing flags and
parameters, which are contained in the `PARAMS` variable.

### Help

The help function lists the usage function first, and then provides
room for a description of CLI program. A typical help function would
print the following:

```bash
./bash-cli-template.sh [-F|--FLAG] COMMAND [PARAMS]

Overview

  A script for uploading files to some location.

Commands

  upload FILENAME - upload the file at the given location, or the
                    default file if FILENAME is empty
  list            - lists the files in the target location
  
Flags

  -h|--help    - prints this menu
  -d|--dry-run - runs the script without performing the target
                 command. This is for test purposes.
  
```

### Argument Parsing

The default layout can parse flags in the following format:

* **Short flag** - a flag composed of a single hypen and one character,
  such as `-h`
  
* **Long flag** - a flag composed of two hypens and any number of
  characters. Words are typically spelled with a single hyphen as
  separator, such as `--dry-run`
  
* **Flag with argument** - flags can also take an argument value. Short
  flags have a space delimiter, while long flags allow for a space or
  equals sign as delimiters. An example could be taking in a
  directory value:
    * `./bash-cli-template.sh -d DIRECTORY upload`
	* `./bash-cli-template.sh --directory DIRECTORY upload`
	* `./bash-cli-template.sh --directory=DIRECTORY upload`

The default layout also allows for non-flag parameters, which can be
command names and/or required arguments for the operation. An example
is the upload operation, which may or may not take additional
arguments:

* `./bash-cli-template.sh upload`
* `./bash-cli-template.sh upload FILENAME`
