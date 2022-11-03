# frozen_string_literal: true

require 'sanitize'
# create html page
class CreateHtmlPage

  def initialize(content, name = 'index.html')
    @content = content
    @name = name
    @page = ['<!DOCTYPE html>',
             '<html lang="en">',
             '<head>',
             '<meta charset="UTF-8">',
             '<title>New page</title>',
             '</head>',
             '<body>',
             '</body>',
             '</html>']
  end

  def create_page(bypass_html: false)
    file_html = File.new(@name, 'w+')
    if bypass_html
      file_html.write(add_content(@page, @content))
    else
      file_html.write(add_content(@page, clear_html(@content)))
    end
  end

  private

  def add_content(page, content)
    page.insert(page.index('</body>'), "&nbsp;&nbsp;#{content}").join("\n")
  end

  def clear_html(html)
    Sanitize.fragment(html)
  end

end

create_file = CreateHtmlPage.new('I love so much, <script>document.getElementById("demo").innerHTML = "Hello JavaScript!";
                                        </script>, <h1 style="color:blue;">A Blue Heading</h1>')
create_file.create_page
