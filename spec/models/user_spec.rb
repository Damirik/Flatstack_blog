require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of :email }
  it { have_many(:blogs).dependent(:destroy) }
  it { have_many(:posts) }
end
