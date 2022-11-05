# frozen_string_literal: true

require 'sanitize'
# create html page
class CreateHtmlPage
  def self.create_page(content: '', name: 'index.html', bypass_html: false)
    page = ['<!DOCTYPE html>', '<html lang="en">', '<head>', '<meta charset="UTF-8">', '<title>New page</title>',
            '</head>', '<body>', CreateHtmlPage.smile(content), '</body>', '</html>']
    file_html = File.new(name, 'w+')
    pars = CreateHtmlPage.pars(content)
    if bypass_html
      file_html.write(CreateHtmlPage.add_content(page, pars))
    else
      file_html.write(CreateHtmlPage.add_content(page, CreateHtmlPage.clear_html(pars)))
    end
    file_html.close
  end

  def self.add_content(page, content)
    page.insert(page.index('</body>'), "&nbsp;&nbsp;#{content}").join("\n")
  end

  def self.clear_html(html)
    Sanitize.fragment(html, Sanitize::Config::RELAXED)
  end

  def self.pars(value)
    if value.is_a?(Hash)
      value.map { |k, v| "<div>\n<p>#{k} = #{v}</p>\n</div>\n" }.join
    else
      value
    end
  end

  def self.smile(value)
    case value[:health]
    when (4..1000)
      '<div style="font-size:48px">&#128512;</div>'
    when (-39..3)
      '<div style="font-size:48px">&#128547;</div>'
    when (-1000..-40)
      '<div style="font-size:48px">&#9760;</div>'
    else
      '<div style="font-size:48px">&#128126;</div>'
    end
  end
end
