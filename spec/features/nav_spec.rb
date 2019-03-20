require 'rails_helper'
RSpec.describe 'as a visitor' do
  describe 'I see a navigation bar' do
    it 'includes welcome and books index links' do
      visit welcome_path

      expect(page).to have_content("Home Page")
      expect(page).to have_content("All Books")
    end
  end
end
