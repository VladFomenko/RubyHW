# frozen_string_literal: true

require 'sanitize'
# create html page
class CreateHtmlPage
  def self.create_page(content: '', name: 'index.html', bypass_html: false)
    page = ['<!DOCTYPE html>', '<html lang="en">', '<head>', '<meta charset="UTF-8">', '<title>New page</title>',
            '</head>', '<body>', '</body>', '</html>']
    file_html = File.new(name, 'w+')
    pars = CreateHtmlPage.pars(content)
    if bypass_html
      file_html.write(CreateHtmlPage.add_content(page, pars))
    else
      file_html.write(CreateHtmlPage.add_content(page, CreateHtmlPage.clear_html(pars)))
    end
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
end

c = { health: @health_index,
      hungry: @hunger_index,
      thirst: @thirst_index,
      sleep: @asleep_index,
      age: @time_index,
      play: @play_index,
      love: @love_index,
      disease: @disease_index }

CreateHtmlPage.create_page(content: c)
