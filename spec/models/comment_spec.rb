require 'rails_helper'

describe Comment do
  it { belong_to(:post) }
  it { is_expected.to validate_presence_of :body }
end
