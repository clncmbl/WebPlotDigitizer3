#!/usr/bin/env python

import os, sys
import Image
import math

def main():
    readSimpleImage()

def readSimpleImage():
    imageFilename = "../../../TestImages/BasicLines/SimpleLine.png"
    if os.path.isfile(imageFilename):
        print "Reading Simple Image"
        
        img = Image.open(imageFilename)

        print "Image Size: %s " % (img.size,)

        xlen = img.size[0]
        ylen = img.size[1]

        pix = img.load()

        foundblack = False

        ii = 0
        jj = 0

        while (ii < xlen and foundblack == False):
            jj = 0
            while (jj < ylen and foundblack == False):
                px = pix[ii, jj]
                if (px[0]*px[0] + px[1]*px[1] + px[2]*px[2] < 10):
                    foundblack = True
                jj = jj + 1
            ii = ii + 1

        print ii
        print jj

    else:
        print "File not found!"
    return


if __name__ == "__main__":
    main()
