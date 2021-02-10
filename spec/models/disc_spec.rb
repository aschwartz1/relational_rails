require 'rails_helper'

describe Disc, type: :model do
  describe 'relationships' do
    it { should belong_to :manufacturer }
  end
end
