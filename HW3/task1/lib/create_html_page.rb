# frozen_string_literal: true

require 'sanitize'
# create html page
class CreateHtmlPage
  def self.create_page(content: '', name: 'index.html', bypass_html: false)
    page = ['<!DOCTYPE html>', '<html lang="en">', '<head>', '<meta charset="UTF-8">', '<title>New page</title>',
            '</head>', '<body>', '</body>', '</html>']
    file_html = File.new(name, 'w+')
    if bypass_html
      file_html.write(CreateHtmlPage.add_content(page, content))
    else
      file_html.write(CreateHtmlPage.add_content(page, CreateHtmlPage.clear_html(content)))
    end
  end

  def self.add_content(page, content)
    page.insert(page.index('</body>'), "&nbsp;&nbsp;#{content}").join("\n")
  end

  def self.clear_html(html)
    Sanitize.fragment(html)
  end
end
