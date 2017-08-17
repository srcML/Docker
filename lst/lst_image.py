#!/usr/bin/python

import os
import yaml

# parse yaml containing system names
with open(os.path.expanduser("/lst_data/large_systems.yaml")) as yaml_data_file:
  data = yaml.load(yaml_data_file)

# parse name.txt to get os name

with open(os.path.expanduser("/name.txt"), 'r') as file:
  name = file.readline().rstrip()

# for each key(source), run srcml, zip and rename to machine_name ....

for key in data:
  srcml = os.popen("srcml /lst_data/data/%s.tar.gz -o /lst_data/%s/%s" % (key, key, name + '_' + key + '.xml')).read()
  gzip = os.popen("gzip /lst_data/%s/%s" % (key, name + '_' + key + '.xml')).read()