require_relative 'dom_reader'

Tag = Struct.new(:type, :depth, :parent, :closing_tag, :children, :attributes)

class DomTree

	attr_accessor :html_code, :document_root, :tag_type, :text_list

  def initialize(html_code)
    file = File.open(html_code, "rb")
    html_code = file.read
    @tag_type = tags(html_code)
    @document_root = Tag.new('document', 0, nil)
    @depth = 0
    @all_tags = []
    # create_tree
    create_tree(@tag_type)
  end

  #one array
  def tags(html_code)
    regex = /<.*?>|(?<=>).*?(?=<)/
    @tag_type = html_code.scan(regex)
    @tag_type.shift
    @tag_type
  end

  def create_tree(tags)
    depth = 1
    closing_tag = /(<\/)/
    tags.each_with_index do |tag, index|
      if tag.match(closing_tag)
        add_closing_tag(tag, depth)
        depth -= 1
      else
        @all_tags << create_child(tag, depth)
        depth += 1
      end
    end
    @all_tags
  end

  def add_closing_tag(tag, depth)
    depth = depth
    @all_tags.each do |tag|
      if tag.depth == depth 
        same_depth_tags << tag
      end
      same_depth_tags.each do |tag|
        if !tag.closing_tag
          tag.closing_tag = tag
        end
      end
    end
    @all_tags
  end

  #check the depth level
  #find the other elements in that depth
  #find the first match that doesn't have a child
  #   tag.closing_tag = tag
  # end

    # opening_tag = /<[^\/].*?>/
  def create_child(tag, depth)
    current_node = @document_root
    depth = current_node.depth 
    until depth == 6 && current_node == nil
      new_tag = Tag.new(tag, depth, current_node, nil, [])

    previous_node = current_node

    end
    # new_tag.closing_tag = tag.match(/(<\/.*?)/)

    return new_tag
  end


  # def add_child_node(new_node, parent)
  #   child_node.parent = Tag.new(parent)
  #   child_node.type = new_node
  # end


  # def create_tree
  #   current_node = @document_root
  #   current_depth = current_node.depth

  # end
  
  # create all nodes
  # depth = 0
  # tag-list.each do tag
  #   if tag.match ()

  # def add_node
  #   unless @root
  #     add_root_node(@tag_type[0])
  #   end

  #   @tag_type.each do |tag|
  #     regex = /<\//
  #     if !tag.match(regex)
  #       return
  #     else
  #       tag = Tag.new(tag)
  #       puts tag
  #       text_list_index += 1
  #     end
  #   end
  # end

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

end
# html_string = "<div>  div text before  <p>    p text  </p>  <div>    more div text  </div>  div text after</div>"

tree = DomTree.new('text.html')
p tree
#tag_type
#["<div>", "<p>", "</p>", "<div>", "</div>", "</div>"] 

#text_list
#[["div text before"], ["p text"], [""], ["more div text"], ["div text after"]] 

