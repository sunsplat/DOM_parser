class DomReader
#take in a string from an html file
#parse into hash or struct (regex)
#likely multiple regex's 

ParsedStringStruct = Struct.new(:type, :classes, :id, :name, :src, :title)

  def initialize(string)
    
		parsed_string = ParsedStringStruct.new

		#type
		regex = /<(.*?)\s/
    type = string.match(regex)
    parsed_string.type = type[1] if type

    #class
    regex =/class='(.*?)'/
    classes = string.match(regex)
    parsed_string.classes = classes[1] if classes

    #id
    regex = /id='(.*?)'/
    id = string.match(regex)
    parsed_string.id = id[1] if id

    #title
    regex = /title='(.*?)'/
    title = string.match(regex)
    parsed_string.title = title[1] if title

    puts "Parsed String is #{parsed_string}"
  end
end

# parse_tag("<p class='foo bar' id='baz'>")

# parse_tag("<p class='foo bar' id='baz' name='fozzie'>")

# parse_tag("<div id='bim'>")

# parse_tag("<img src='http://www.example.com' title='funny things'>")


#parsed_string = Struct.new(:type,:class,:id,:name)

