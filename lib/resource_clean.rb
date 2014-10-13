require 'find'
require 'fileutils'
require 'ffi-xattr'

module ResourceClean
  class << self

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

    def run(path)
      Find.find path do |entry|
        name = File.basename entry
        if DELETE_FILES.index {|item| item.casecmp(name) == 0 } || name =~ /^\._/
          FileUtils.remove_entry entry
          puts "Delete file: #{entry}"
        else
          xattr = Xattr.new entry
          list = xattr.list
          unless list.empty?
            list.each {|key| xattr.remove key }
            puts "Delete xattr: #{entry}\n  #{list}"
          end
        end
      end
    end

  end
end
