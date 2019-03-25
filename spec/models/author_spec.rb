require "rails_helper"

describe Author, type: :model do
  describe "Relationships" do
    it { should have_many :book_authors}
    it { should have_many(:books).through(:book_authors) }
  end
  describe 'validations' do
    it { should validate_uniqueness_of :name}
  end
end
