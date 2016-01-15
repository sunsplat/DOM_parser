require_relative 'dom_reader'

class DomTree
	
Tag = Struct.new(:type, :classes, :id, :title, :text, :children, :parent)
# :attributes that holds all html elements
# Tag class
# methods on tag class to retrieve that attribute 
	attr_accessor :html_code, :root, :tag_type, :text_list

  def initialize(html_code)
    file = File.open(html_code, "rb")
    html_code = file.read
    tags(html_code)
    text(html_code)
    @root = nil
    p @text_list
    p @tag_type
  end

  #one array
  def tags(html_code)
    regex = /<.*?>/
    @tag_type = html_code.scan(regex)
    @tag_type.shift
  end

  #array of arrays
  def text(html_code)
    regex = />(.*?)</
    @text_list = html_code.scan(regex)
    @text_list.each do |text|
      text.each do |text_item|
      text_item.strip!
      end
    end
    @text_list.flatten!
  end

  def add_root_node(first_tag)
    @root = Tag.new(first_tag)
  end

  # def add_node(new_node)
  #   new_node = Tag.new()
  # end

  # def add_child_node(new_node, parent)
  # end

  # def make_tree
  #   #if we don't have a root, make one
  #   unless @root
  #     add_root_node(@tag_type[0]) 
  #   end

  #   tags = []
  #   tags << @root 
  #   while move = tags.pop
  #     move.children = make_children(tags)
  #     move.children.each do |next_tag|
  #       tags << next_tag unless next_tag.depth == max_depth
  #     end
  #   end
  # end

  def add_node
    unless @root
      add_root_node(@tag_type[0])
    end

    @tag_type.each do |tag|
      regex = /<\//
      if !tag.match(regex)
        return
      else
        tag = Tag.new(tag)
        puts tag
        text_list_index += 1
      end
    end
  end

  # def add_child_node(tag)
        
  #   current_node = @root
    
  #   #for each element of the tag_type array check if it has a /
  #   #if element has no /, go to text_list and get child
  #   #make a child node
  #   #if element has a /, make node
  #   @tag_type.each do |tag|
  #     regex = /<\//
  #     if !tag.match(regex)
  #      add_node(tag)
  #     elsif 
  #       add_child_node()#create child node 
  #       text_list_index += 1
  #     end

  #   while @html_code.length > 0
  #     add_node(???????????)
  #   end
  # end

  # def add_node()
		# if current node is nil
		# 	new structures
		# else
		# 	add_node (data)

  # end
end

# html_string = "<div>  div text before  <p>    p text  </p>  <div>    more div text  </div>  div text after</div>"

tree = DomTree.new('text.html')
tree.add_node
#tag_type
#["<div>", "<p>", "</p>", "<div>", "</div>", "</div>"] 

#text_list
#[["div text before"], ["p text"], [""], ["more div text"], ["div text after"]] 

