require 'terminal-table'

class ScrapedTable
  def initialize(page, input, total)
    @pages = page
    @input = input
    @totla = total
    @index = 0
  end

  def display
    Terminal::Table.new(
      row: [
        [@total, @pages, index, user_request]
      ],
      headers: [
        'result',
        'page fetched',
        'page totals',
        'fetched'
      ],
      style: {
        border_i: '-'
      }
    )
  end

  def index
    @index = @totla / 20
  end

  def user_request
    @input.gsub('%20', ' ')
  end
end
