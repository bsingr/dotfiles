require "rubygems"
begin
  require 'irb/completion'
  require 'irb/ext/save-history'
rescue LoadError
end
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "~/.irb_history"
