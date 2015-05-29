class Page
  def initialize(url)
    @url = url
  end

  def fetch!
    puts "Fetching..."
    @response = Net::HTTP.get_response(URI(@url))
    @document = Nokogiri::HTML(@response.body)
  end

  def title
    puts "Title: #{@document.css("title").text}"
  end

  def links
    links_list = @document.css("a").map { |link| link["href"] }.uniq.sort
    puts "Links:"
    links_list.each do |link|
      puts link if link =~ /^http:/
    end
  end

  def content_length
    content_length = @response.header["content-length"]
    puts "Content length: #{content_length} characters"
  end
end