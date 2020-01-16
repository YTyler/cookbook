require 'rails_helper'

describe Recipe do
  it { should have_and_belong_to_many :ingredients }
  it { should validate_presence_of :name }
  it { should validate_presence_of :category }
  it { should validate_presence_of :rank }
  it { should validate_presence_of :instructions }
  it { should validate_length_of(:name).is_at_most(100) }
  it { should allow_value('tim').for(:name) }
  it { should_not allow_value('123').for(:name) }
  it { should_not allow_value('~').for(:name) }

end
