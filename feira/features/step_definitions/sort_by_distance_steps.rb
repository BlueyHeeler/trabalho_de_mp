Given('I am on the {string} page') do |page|
    visit "/home/#{page}"
  end

  Given('I am on the shopping tables page') do
    visit home_feira_path
  end

  When('I click on the {string} option') do |button_text|
    click_button button_text
  end

  Then('the shopping tables should be displayed in ascending order by distance') do
    distances = page.all('td.distance').map(&:text).map(&:to_f)
    expect(distances).to eq distances.sort
  end

  Then('each shopping table should display its distance from my location') do
    shopping_entries = page.all('tr')
    shopping_entries.each do |entry|
      expect(entry).to have_css('.distance')
      distance = entry.find('.distance').text
      expect(distance).to match(/\d+(\.\d+)?\s*km/)
    end
  end
