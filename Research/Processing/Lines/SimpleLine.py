#!/usr/bin/env python

import os, sys
import Image

def main():
    print "Hello"
    readSimpleImage()

def readSimpleImage():
    imageFilename = "../../../TestImages/BasicLines/SimpleLine.png"
    if os.path.isfile(imageFilename):
        print "Reading Simple Image"
        
        

    else:
        print "File not found!"
    return


if __name__ == "__main__":
    main()
