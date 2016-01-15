require_relative 'dom_reader'

Tag = Struct.new(:type, :text, :classes, :id, :title, :depth, :children, , :closing_tag, :parent)

class DomTree

	attr_accessor :html_code, :document_root, :tag_type, :text_list

  def initialize(html_code)
    file = File.open(html_code, "rb")
    html_code = file.read
    tags(html_code)
    text(html_code)
    @document_root = Tag.new('document', nil, nil, nil, nil, 0)
    @depth = 0
    @tree = nil
    @all_tags = []
    create_tree
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

  def combine_tags(tag_type, text_list)
    depth = 0
    opening_tag = /<[^\/].*?>/
    tag_type.each_with_index do |tag, index|
      if tag.match(opening_tag)
        @all_tags << attributes(tag, depth, @text_list[index])
        depth += 1
      else
        depth -= 1
      end
    @all_tags
  end

  def add_child_node(new_node, parent)
    child_node.parent = Tag.new(parent)
    child_node.type = new_node
  end


  def create_tree
    current_node = @document_root
    current_depth = current_node.depth

  end
  
  create all nodes
  depth = 0
  tag-list.each do tag
    if tag.match ()

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
def add_node
  if @node == nil

  # def add_node()
		# if current node is nil
		# 	new structures
		# else
		# 	add_node (data)

  end
end

# html_string = "<div>  div text before  <p>    p text  </p>  <div>    more div text  </div>  div text after</div>"

tree = DomTree.new('text.html')
tree.add_node
#tag_type
#["<div>", "<p>", "</p>", "<div>", "</div>", "</div>"] 

#text_list
#[["div text before"], ["p text"], [""], ["more div text"], ["div text after"]] 

