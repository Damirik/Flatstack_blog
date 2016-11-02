require 'rails_helper'

describe Blog do
  it { belong_to(:user) }
  it { is_expected.to validate_presence_of :subject }
  it { have_many(:posts).dependent(:destroy) }

end
