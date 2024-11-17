#!/usr/bin/env python

# Original: https://gist.githubusercontent.com/opieters/756c86fdad219867c0f4/raw/679246849ab72342d0b962581dc13a377988d1e8/gallery_creator.py

# install imagesize: pip install imagesize pyyaml

# original
#__author__ = 'Olivier Pieters'
#__author_email__ = 'me@olivierpieters.be'
#__license__ = 'BSD-3-Clause'
__author__ = 'Riccardo Carlesso'
__author_email__ = 'palladiusbonton@gmail.com'
__license__ = 'BSD-3-Clause'

#BasePath = "../../assets/photography/"
BasePath = "blog/assets/fotoric/"

import yaml, imagesize
from os import listdir, rename
from os.path import isfile, join



def buridone_by_olivierpieters(output_file, input_file, image_path, extensions ):
  # set correct path
  path = join(BasePath, image_path)
  print("DEB buridone_by_olivierpieters(output_file={of}, input_file={inf}, image_path={ip}, extensions={ext} ): ".format(
      of=output_file,
      inf=input_file,
      ext=extensions,
      ip=image_path
  ))
  #return 42
  # extract image files
  print('Collecting files...')
  files = [f for f in listdir(path) if isfile(join(path, f))]
  files = [f for f in files if f[f.rfind('.')+1:] in extensions ]

  # rename image files
  print('Renaming files...')
  new_files = []
  for f in files:
      if f[f.rfind('-')+1:f.rfind('.')] != 'thumbnail':
          newf = f[:f.rfind('-')] + "-%sx%s" % imagesize.get(join(path, f)) + f[f.rfind('.'):]
          rename(join(path, f),join(path, newf))
      else:
          newf = f
      new_files.append(newf)

  files = new_files

  # helper objects to store gallery data
  new_gallery = {}
  thumbs = {}

  # group gallery data
  print('Grouping files...')
  for f in files:
      filename = f[:f.rfind('-')]
      if f[f.rfind('-')+1:f.rfind('.')] == "thumbnail":
          thumbs[filename] = f
      else:
          if filename in new_gallery:
              new_gallery[filename].append(f)
          else:
              new_gallery[filename] = [f]

  # find largest image -> set as original
  print('Searching for originals and missing thumbnails...')
  originals = {}
  for image_set in new_gallery:
      max_width, max_height = imagesize.get(join(path, new_gallery[image_set][0]))
      min_width, min_height = imagesize.get(join(path, new_gallery[image_set][0]))
      original = new_gallery[image_set][0]
      thumbnail = new_gallery[image_set][0]
      for image in new_gallery[image_set]:
          width, height = imagesize.get(join(path, image))
          if (width*height) > (max_width*max_height):
              original = image
          if (width*height) < (min_width*min_height):
              thumbnail = image
      # delete original from list to avoid double entries
      del new_gallery[image_set][new_gallery[image_set].index(original)]
      originals[image_set] = original
      # add thumbnial if not yet in dict (not removed since might still be useful)
      if image_set not in thumbs:
          thumbs[image_set] = thumbnail

  # try to load YAML data
  print('Checking existing YAML data for input_file: {}...\n'.format(input_file))
  if isfile(input_file):
      print("it exists! Nothing to do here. I return")
      return
      input_gallery = yaml.load(open(input_file, 'r'))
  else:
      # create empty dummy file
      input_gallery = {"pictures": []}

  old_gallery = input_gallery['pictures']

  # merge two data sets into one
  print('Merging YAML data...')
  for pic in new_gallery:
      found = False
      # try to find matching filename
      for i in old_gallery:
          if pic == i["filename"]:
              i["sizes"] = new_gallery[pic]
              # include thumbnail if present
              if pic in thumbs:
                  i["thumbnail"] = thumbs[pic]
              found = True
      if not found:
          # create new entry
          old_gallery.append({"filename": pic, "sizes": new_gallery[pic], "thumbnail": thumbs[pic], "original": originals[pic]})

  # check if path existing
  if "picture_path" not in input_gallery:
      input_gallery["picture_path"] = image_path

  # write to output file
  print('Writing YAML data to file...')
  with open(output_file, 'w') as f:
      f.write( yaml.dump(input_gallery, default_flow_style=False) )

    
def enumerate_ricc_folders(mypath):
    from os import listdir
    from os.path import isfile, join, isdir
    onlyfiles = [f for f in listdir(mypath) if isdir(join(mypath, f))]
    #arr = [ 123 ]
    return onlyfiles

def main():
    avoid_these_folder = [
       # 'riccardo-2021', # too big per ora. spezzimolo..
    ]
    print("== Ricc AutoFolder finder ==\n")
    folder_names = enumerate_ricc_folders("blog/assets/fotoric/")
    print("folder_names: ", folder_names)
    extensions= ['jpg', 'png', 'gif']
    print("== opeters YAML creator ==\n")
    for pix_subfolder in folder_names:
        # configuration
        output_file = "blog/_data/galleries/{f}.yml".format(f=pix_subfolder) 
        input_file = output_file
        image_path = pix_subfolder # "micro-album-cuties"         #image_path = "riccardo-2021"
        if pix_subfolder in avoid_these_folder:
            print("ATTENZIONE SKIPPO: ", pix_subfolder)
            next
            #break
        else:
            #print("non skippo: ", pix_subfolder)
            buridone_by_olivierpieters(output_file, input_file, image_path, extensions )

#print("vediamo\n")
main()