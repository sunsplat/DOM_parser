require_relative 'dom_reader'

Tag = Struct.new(:type, :depth, :parent, :closing_tag, :children, :attributes)

class DomTree

	attr_accessor :html_code, :root, :tag_type, :text_list

  def initialize(html_code)
    file = File.open(html_code, "rb")
    html_code = file.read
    @tag_type = tags(html_code)
    @root = Tag.new('document')
    @depth = 0
    @all_tags = []
    create_tree(@tag_type)
  end

  def tags(html_code)
    regex = /<.*?>|(?<=>).*?(?=<)/
    @tag_type = html_code.scan(regex)
    @tag_type.shift
    @tag_type
  end

  def create_tree(tags)
    depth = 0
    current_tag = @root
    closing_tag = /(<\/)/
    tags.each_with_index do |tag, index|
      unless tag.match(closing_tag)
        attributes = DomParser.parse(tag)
        tag = Tag.new(tag, depth, current_tag, nil, nil, attributes) 

        current_tag.children = [] unless current_tag.children
        current_tag.children << tag
        current_tag = tag
        depth += 1
      else
        current_tag = current_tag.parent
        depth -= 1
      end
    end
    @root
  end

     # opening_tag = /<[^\/].*?>/
  def create_child(tag, depth)

      new_tag = Tag.new(tag, depth, nil, nil, [])

    return new_tag
  end
  
end
# html_string = "<div>  div text before  <p>    p text  </p>  <div>    more div text  </div>  div text after</div>"

tree = DomTree.new('text.html')
p tree

    # new_tag.closing_tag = tag.match(/(<\/.*?)/)
  # def classes 
  #for rendering
   # tag.attributes.classes      
  # end  

# end


#tag_type
#["<div>", "<p>", "</p>", "<div>", "</div>", "</div>"] 

#text_list
#[["div text before"], ["p text"], [""], ["more div text"], ["div text after"]] 

