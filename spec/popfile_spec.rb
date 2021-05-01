# coding: utf-8
require 'spec_helper'

describe package('popfile') do
    it { should be_installed }
end

describe file('/usr/share/popfile/start_popfile.sh') do
    it { should exist }
end