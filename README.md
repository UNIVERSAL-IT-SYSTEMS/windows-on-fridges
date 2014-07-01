windows-on-fridges
==================


Github pages for Windows on Fridges.
Visit the site at [Windows on Fridges](http://ms-iot.github.io/windows-on-fridges).
Uses [Hugo](hugo.spf13.com) for static site generation.


## Contribute
* Fork the official repo at ms-iot/windows-on-fridges
* Clone your fork
* Use the Hugo command line tool to create new content or edit existing content in the content directory.
```
hugo new post/postname.md       # From the root of the directory
```
* On newly created pages you must change draft to false at the top of the file.
* To see your changes and run them locally
```
hugo server
```
* Only add changes in the content directory
* Run the contrib shell script
```
sh contrib.sh
```
* Make a pull request from your master branch to the official master branch.
* Content will be merged and site will be rebuilt.

## Windows Workflow
* Download the [Hugo Binary](https://github.com/spf13/hugo/releases) for your specific system (eg. hugo_0.11_windows_amd64.zip). The binary has no external dependencies.
* Extract the zip file.
* Copy the executable to C:\Program Files (x86)\Git\bin and rename the executable to hugo.exe
* To regenerate the site, navigate to the source directory where you cloned this project and from Git Bash execute (the windows version has some path issues)
```
hugo --source="."
```
* For all of the commands in the contribute section just add --source="." if you are using the windows version.


