require 'terminal-table'


class ScrapedTable
  def initialize(page, input, total)
    @page = page
    @input = input
    @totla = total
    @index = 0
  end

  def display
    Terminal::Table.new(
      row: [
        [@total, @page, pages_index, user_Query]
      ],
      headers: [
        'result',
        'page fetched',
        'page totals',
        'fetched',
      ],
      style: {
        border_i: '-'
      }
    )
  end




end