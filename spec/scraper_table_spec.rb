require './lib/scraper_table'

describe ScrapedTable do
  let(:scraper_table) { ScrapedTable.new(1, 'rick%20and%20morty', 634) }

  describe '#index' do
    it 'returns the total of pages divided' do
      private_method = scraper_table.send(:index)
      expect(private_method).to eq(31)
    end

    it 'returns the total of pages divided' do
      private_method = scraper_table.send(:index)
      expect(private_method).not_to eq(32)
    end

    it 'Checks that index and that total is not diff' do
      private_method = scraper_table.send(:index)
      expect(private_method).not_to eq(scraper_table.instance_variable_get(:@totla))
    end
  end

  describe '#user_request' do
    it 'returns the url unparsed more readable.' do
      private_method = scraper_table.send(:user_request)
      expect(private_method).to eq('rick and morty')
    end

    it 'Checks that displayed query is not same as url query' do
      private_method = scraper_table.send(:user_request)
      expect(private_method).to_not eq(scraper_table.instance_variable_get(:@input))
    end
  end
end