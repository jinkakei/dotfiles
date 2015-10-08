#!/usr/bin/ruby

bdl_path = "~/.vim/bundle" 
cmd_mkd = "mkdir -p #{bdl_path}"
  puts( cmd_mkd ); system( cmd_mkd )
g_url = "git://github.com/Shougo"
nbdl = "neobundle.vim" 
cmd_dl = "git clone #{g_url}/#{nbdl} #{bdl_path}/#{nbdl}"
  puts( cmd_dl ); system( cmd_dl )

puts( "Next Step")
puts( "  $ vim test.txt")
puts( "    :NeoBundleInstall")
puts( "    :NeoBundleUpdate")

