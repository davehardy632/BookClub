require "rails_helper"

describe Review, type: :model do
  describe "Relationships" do
    it { should belong_to :book }
  end
  xdescribe 'validations' do
    # it { should validate_uniqueness_of :user }

    # actual = Review.create(title: 'House of Leaves Review', description: 'It was good.', rating: 3, user: 'Bill')
    # expect(actual.user).to eq(actual.user.titleize)
  end
end

# User names should be converted to Title Case before saving.
