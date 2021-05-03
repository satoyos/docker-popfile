#! /bin/bash

tar zcvf /tmp/popfile_back.tgz popfile_data/popfile.db popfile_data/popfile.cfg
aws s3 cp /tmp/popfile_back.tgz s3://popfile_back/
