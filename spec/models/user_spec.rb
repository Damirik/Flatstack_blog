require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of :email }
  it { have_many(:tasks).dependent(:destroy) }
end
