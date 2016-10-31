require 'rails_helper'

describe Blog do
  it { belong_to(:user) }
end
