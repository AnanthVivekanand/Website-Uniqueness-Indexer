require 'text'

class Website

  SAMPLE_TEXT =
  "<header>
    <title> Sample Title </title>
  </header>
  <navbar>
    <ul>
      <li>Sample Title 1</li>
      <li>Sample Title 2</li>
    </ul>
  </navbar>
  <footer>
    <a href='#'>First Link</a>
    <a href='#'>Second Link</a>
  </footer>"

  SAMPLE_TEXT2 =
  "<header>
    <title> Sample Title </title>
  </header>
  <navbar>
  </navbar>
  <footer>
    <a href='#'>First Link</a>
    <a href='#'>Second Link</a>
  </footer>"

  
  def initialize
    @sample_text = SAMPLE_TEXT
    @sample_text2 = SAMPLE_TEXT2
  end

  def compare_sections
    distance = Text::Levenshtein.distance(@sample_text, @sample_text2).to_f
    @diff_percentage = calculate_diff (distance)
    return @diff_percentage
  end

  private

  def calculate_diff(distance)
    return 0 if @sample_text.length.zero? && @sample_text2.length.zero?
    return 100 if @sample_text.length.zero? && @sample_text2.length.positive?
    string_length = [@sample_text.length, @sample_text2.length].max 
    distance / string_length * 100
  end

  
end
