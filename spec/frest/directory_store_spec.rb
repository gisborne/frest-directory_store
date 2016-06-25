require 'spec_helper'

describe Frest::DirectoryStore do
  it 'has a version number' do
    expect(Frest::DirectoryStore::VERSION).not_to be nil
  end

  it 'can retreive from a directory' do
    expect(Frest::DirectoryStore::get(path: 'spec/test_files', id: 'test1')).to be_a(Hash)
    expect(Frest::DirectoryStore::get(path: 'spec/test_files', id: 'test2')).to be_a(Proc)
  end
end