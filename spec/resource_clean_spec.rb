require 'spec_helper'
require 'fileutils'

describe ResourceClean do
  before :all do
    Dir.mkdir 'tmp' unless File.exists? 'tmp'
    Dir.chdir 'tmp'
  end

  after :all do
    Dir.chdir '..'
    FileUtils.rm_r 'tmp'
  end

  context 'when run' do

    DELETE_FILES = %w(
      .AppleDouble
      .DS_Store
      .fseventsd
      .Spotlight-V100
      .TemporaryItems
      .Trashes
      .VolumeIcon.icns
      Desktop.ini
      Thumbs.db
    )

    before :all do
      FileUtils.cp_r "#{File.dirname(__FILE__)}/fixtures/resource", '.'
      @path = "#{Dir.pwd}/resource"
      begin
        $stdout = StringIO.new
        ResourceClean.run(@path)
      ensure
        $stdout = STDOUT
      end
    end

    it 'should not exist' do
      Dir.glob("#{@path}/**/*", File::FNM_DOTMATCH).each do |entry|
        name = File.basename entry
        return false if DELETE_FILES.index {|item| item.casecmp(name) == 0 } || name =~ /^\._/
      end
      true
    end

    it 'should clear xattr' do
      Dir.glob("#{@path}/**/*", File::FNM_DOTMATCH).each do |entry|
        xattr = Xattr.new entry
        return false unless xattr.list.empty?
      end
      true
    end

  end
end
