require "rails_helper"

describe Post do
  it { is_expected.to validate_presence_of :title }
  it { belong_to(:blog) }
  it { belong_to(:user) }
end
