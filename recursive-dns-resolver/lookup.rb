def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument
# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")



# ..
# ..
def parse_dns(dns_raw)

  dns_records = {:A => [], :CNAME => []}

  dns_raw.each do |line|

    if (line.strip.split(", ")[0] =="A" and line[0] != "#" and line.length != 1) #ignoring comments and empty lines
      dns_records[:A].push(line.strip.split(", ")[1..2]) #taking 1st and 2nd element from array


    elsif (line.strip.split(", ")[0] =="CNAME" and line[0] != "#" and line.length != 1)
      dns_records[:CNAME].push(line.strip.split(", ")[1..2])

    end
  end
  return dns_records

end
# ..
# ..

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
#dns_records = parse_dns(dns_raw)
#lookup_chain = [domain]
#lookup_chain = resolve(dns_records, lookup_chain, domain)
#puts lookup_chain.join(" => ")
