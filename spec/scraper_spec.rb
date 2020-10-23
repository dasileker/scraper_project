# !/scraper_spec.rb

require_relative '../bin/scraper.rb'


describe scraper do
  

    describe "#scraper" do
      page = 'https://www.avito.ma/fr/maroc/v%C3%A9hicules-%C3%A0_vendre?o=1'
      it 'should check the page' do
        expect(page.scraper).to eq(page)
        
      end
    end
end