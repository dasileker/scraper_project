require './lib/scraper'

describe Scraper do
  before(:all) do
    @scraper = Scraper.new('rick%20and%20morty', 2)
    @scraper.scraper
  end

  describe '#initialize' do
    it 'Check html in initialize method' do
      expect(@scraper.instance_variable_get(:@html)).to eq('https://katcr.to/usearch/rick%20and%20morty/')
    end
    it 'Check that html is built dynamicly and that are not equal' do
      new_session = Scraper.new('modern%20family', 2)
      expect(@scraper.instance_variable_get(:@html)).not_to eq(new_session.instance_variable_get(:@html))
    end
  end

  describe '#counter' do
    it 'return the number of results fetched' do
      expect(@scraper.counter).to eq(645)
    end
    it 'Check that counter is built dynamicly' do
      new_session = Scraper.new('modern%20family', 2)
      new_session.scraper
      expect(@scraper.counter).not_to eq(new_session.counter)
    end
  end

  describe '#torrent' do
    it 'should display a total number of the list' do
      list = @scraper.torrent
      first = []
      list[1].each { |item| first << item }
      expect(first[0].to_i).to eq(2)
    end

    it 'check if number is increasing' do
      list = @scraper.torrent
      first = []
      list[2].each { |item| first << item }
      expect(first[0].to_i).not_to eq(2)
    end

    it 'shows the torrent name in the list' do
      list = @scraper.torrent
      first = []
      list[1].each { |item| first << item }
      expect(first[1]).to eq("Rick and Morty S04E03 1080p WEBRip x264-TBS TGx ⭐ \n")
    end

    it 'returns the list names that are not reapeted' do
      list = @scraper.torrent
      first = []
      list[2].each { |item| first << item }
      expect(first[2]).not_to eq("Rick and Morty S04E03 1080p WEBRip x264-TBS eztv \n")
    end

    it 'returns the genre of the searchd item' do
      list = @scraper.torrent
      first = []
      list[1].each { |item| first << item }
      expect(first[5]).to eq("TV  >\n")
    end

    it 'returns the genre of the searchd item' do
      list = @scraper.torrent
      first = []
      list[1].each { |item| first << item }
      expect(first[5]).not_to eq("TV >\n")
    end

    it 'returns the torrent is not dubled' do
      list = @scraper.torrent
      first = []
      list[1].each { |item| first << item }
      expect(first[6]).to eq("HD \n")
    end

    it 'returns the torrent is not dubled' do
      list = @scraper.torrent
      first = []
      list[1].each { |item| first << item }
      expect(first[6]).not_to eq("HD  \n")
    end
  end
end