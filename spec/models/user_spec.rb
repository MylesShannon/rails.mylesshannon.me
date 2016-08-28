require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "first test" do
    user = build(:user)
    expect(user.first_name).to eql('MyString')
  end
end
