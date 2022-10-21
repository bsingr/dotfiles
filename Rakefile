require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install => [:iterm_import, :link, :scripts]

desc "link all files"
task :link do
  # copy files
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README* LICENSE* install_scripts tool_scripts].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

desc "install scripts"
task :scripts do
  # run install scripts
  Dir["install_scripts/*"].each do |file|
    puts file
    system "chmod +x ./#{file} && ./#{file}"
  end
end

desc "install iterm profile"
task :iterm_import do
  system "defaults import com.googlecode.iterm2 ~/Development/dotfiles/osx-terminal/iterm2/com.googlecode.iterm2.plist"
end

desc "install iterm profile"
task :iterm_export do
  system "defaults export com.googlecode.iterm2 ~/Development/dotfiles/osx-terminal/iterm2/com.googlecode.iterm2.plist"
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %{rm "$HOME/.#{file}"}
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

task :default => :install
