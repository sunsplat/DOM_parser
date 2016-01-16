ParsedStringStruct = Struct.new(:type, :classes, :id, :name, :src, :title)

class DomReader

  parsed_string = ParsedStringStruct.new

  def initialize(string)
    @string = string
  end

  def type  
    regex = /<(.*?)\s/
    type = string.scan(regex)
    parsed_string.type = type[1] if type
  end

  def classes
    regex =/class='(.*?)'/
    classes = string.scan(regex)
    parsed_string.classes = classes[1] if classes
  end

  def id
    regex = /id='(.*?)'/
    id = string.scan(regex)
    parsed_string.id = id[1] if id
  end

  def title
    regex = /title='(.*?)'/
    title = string.match(regex)
    parsed_string.title = title[1] if title
  end

end

# parse_tag("<p class='foo bar' id='baz'>")

# parse_tag("<p class='foo bar' id='baz' name='fozzie'>")

# parse_tag("<div id='bim'>")

# parse_tag("<img src='http://www.example.com' title='funny things'>")


#parsed_string = Struct.new(:type,:class,:id,:name)

