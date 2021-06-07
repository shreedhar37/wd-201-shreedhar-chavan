# A Ruby Program that renders an HTML document to the console

node1 = {
  :tag => "h1",
  :text => "Welcome to SaaS 201"
}

node2 = {
  :tag => "div",
  :children => [
    {
      :tag => "h2",
      :text => "The Ruby Language"
    },
    {
      :tag => "p",
      :text => "Ruby is built for programmer happiness"
    }
  ]
}

html = {
  :tag => "div",
  :children => [node1, node2]
}

def render(node)
  if node[:tag] == "h1"
    puts "**** #{node[:text].upcase} ****"
  elsif node[:tag] == "h2"
    puts "** #{node[:text]} **"
  elsif node[:tag] == "p"
    puts node[:text]
  elsif node[:tag] == "div"
    children = node[:children]
    children.each {|child| render(child)} #recursion
  end
end

render(html)
