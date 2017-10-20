require 'json'
require 'bundler/gem_tasks'

module Util
  extend self

  JQUERY_FILE_DOWNLOAD_README_PATH = 'jquery.fileDownload/README.md'
  JQUERY_FILE_DOWNLOAD_SCRIPT_PATH = 'jquery.fileDownload/src/Scripts/jquery.fileDownload.js'
  TARGET_VERSION_PATH = 'lib/jquery_file_download/rails/version.rb'

  def read_jquery_file_download_version(file_name)
    File.readlines(file_name).each do |line|
      return $1 if line =~ /jQuery File Download Plugin v(\d+\.\d+\.\d+)/
    end
    raise 'Could not determine jquery.fileDownload version'
  end

  # See https://github.com/joliss/jquery-ui-rails/blob/master/Rakefile
  def protect_copyright_notice(content)
    content.gsub!(/\A\s*\/\*\r?\n/, "/*!\n")
  end
end

desc 'Update the jquery.fileDownload submodule'
task :submodule do
  Rake.rake_output_message 'Updating jquery.fileDownload submodule'
  sh 'git submodule update --init' unless File.exist?(Util::JQUERY_FILE_DOWNLOAD_README_PATH)
end

desc 'Clean the app directory'
task :clean do
  rm_rf 'app'
end

desc 'Update jquery.fileDownload.js version number'
task :version => :submodule do
  version = Util.read_jquery_file_download_version(Util::JQUERY_FILE_DOWNLOAD_SCRIPT_PATH)

  Rake.rake_output_message "jquery.fileDownload version is #{version}"

  content = File.read(Util::TARGET_VERSION_PATH)
  pattern = /JQUERY_FILE_DOWNLOAD_VERSION = '[^']*'/
  replacement = "JQUERY_FILE_DOWNLOAD_VERSION = '#{version}'"
  content.sub! pattern, replacement or raise "Could not update version in #{Util::TARGET_VERSION_PATH}"
  File.write(Util::TARGET_VERSION_PATH, content)
end

desc 'Generate JavaScript assets'
task :javascripts => :submodule do
  target_dir = "app/assets/javascripts"
  mkdir_p target_dir

  Dir.glob('jquery.fileDownload/src/Scripts/*.js').each do |path|
    base_name = File.basename(path)
    file_name = "#{target_dir}/#{base_name}"
    Rake.rake_output_message "Updating #{file_name}"
    File.open(file_name, 'w') do |f|
      content = File.read(path)
      Util.protect_copyright_notice(content)
      f.write(content)
    end
  end
end

task :default => [
  :clean,
  :version,
  :javascripts
]

