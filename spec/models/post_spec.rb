require 'rails_helper'

RSpec.describe Post do
  describe ".paginate" do
    subject(:entries) { Post.paginate(page: 3, per_page: 2) }

    let!(:post1) { FactoryBot.create(:post) }
    let!(:post2) { FactoryBot.create(:post) }
    let!(:post3) { FactoryBot.create(:post) }
    let!(:post4) { FactoryBot.create(:post) }
    let!(:post5) { FactoryBot.create(:post) }
    let!(:post6) { FactoryBot.create(:post) }
    let!(:post7) { FactoryBot.create(:post) }

    it { is_expected.to eq([post5, post6]) }

    it "contains total pages" do
      expect(entries.total_pages).to eql(4)
    end

    it "contains current page" do
      expect(entries.current_page).to eql(3)
    end
  end
end
