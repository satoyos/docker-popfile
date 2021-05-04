# coding: utf-8
require 'spec_helper'

describe command('date') do
  its(:stdout) { should match /JST/}
end

describe command('echo $LANG') do
  its(:stdout) { should match /ja_JP.UTF-8/}
end
