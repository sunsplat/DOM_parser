Reader_Struct = Struct.new(:type, :classes, :id, :title)

class DomParser

  def self.parse(string)
    parsed_string = Reader_Struct.new

    regex = /<(.*?)[ >]/
    type = string.scan(regex)
    puts "String: #{string}"
    puts "Type: #{type}"
    parsed_string.type = type.first.first if type && type.first

    regex =/class="(.*?)"/
    classes = string.scan(regex)
    parsed_string.classes = classes.first.first if classes && classes.first

    regex = /id="(.*?)"/
    id = string.scan(regex)
    parsed_string.id = id.first.first if id && id.first

    regex = /title="(.*?)"/
    title = string.match(regex)
    parsed_string.title = title.first.first if title && title.first

    return parsed_string
  end

end