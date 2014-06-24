windows-on-fridges
==================


Github pages for Windows on Fridges.
Visit the site at [Windows on Fridges](ms-iot.github.io/windows-on-fridges).
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
