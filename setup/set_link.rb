#!/usr/bin/ruby

# ToDo: mv ~/.vimrc ~/.vimrc_tmp_backup # if exist

def delete_interactive( ary )
  alen = ary.length
  msg1 = "\n\nSymbolic links will be made under HOMEDIR\n"
  print msg1
  display_ary( ary )

  msg2 = "type number to delete (q: quit):"
  print msg2
  while input = gets.chomp
    return 0 if input == "q"
    if str_is_i?(input) and (input.to_i >= 0)and (input.to_i < alen)
      del_ele = ary[ input.to_i]
      puts "  delete #{del_ele}"
      ary.delete(del_ele)
      print msg1
      display_ary(ary)
    end
    print msg2
  end

  return 0
end # def delete_interactive( ary )
  
  def display_ary( ary )
    ary.each_with_index do | ele,n |
      puts "  #{n}: #{ele}"
    end
  end

#http://taro-tnk.hatenablog.com/entry/2012/12/17/001552
#def integer_string?(str)
def str_is_i?(str)
  Integer(str)
  true
rescue ArgumentError
  false
end


puts "This program set link at HOME to HOME/dotfiles"

dotfiles = Dir::glob(".*")
  [".", "..", ".git"].each do | delf | dotfiles.delete( delf ) end

ret = delete_interactive( dotfiles )

home = ENV[ 'HOME' ]
Dir::chdir(home)
clock = Time.now.strftime("%Y%m%d_%H%M")
#p clock
# test
#  Dir::chdir("#{home}/test")
dotfiles.each do | df |
  fpath ="#{home}/dotfiles/#{df}"
  if File.exist?(df)
    system("mv #{df} #{df + clock}")
  end
  ret = system("ln -s #{fpath} #{df}")
end

print "\n\n\n"; puts "End of Program"

__END__
