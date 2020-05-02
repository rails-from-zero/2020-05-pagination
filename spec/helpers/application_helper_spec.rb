require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe "#paginate" do
    subject(:paginate) { helper.paginate(result) }

    let(:result) {
      instance_double(
        Post::PaginationResult, current_page: current_page, total_pages: 3
      )
    }
    let(:current_page) { 2 }

    it { is_expected.to include('<a href="/posts?page=1">previous</a>') }

    it { is_expected.to include('<a href="/posts?page=3">next</a>') }

    context "on first page" do
      let(:current_page) { 1 }

      it { is_expected.to_not match(%r{<a(.*)>previous</a>}) }
    end

    context "on last page" do
      let(:current_page) { 3 }

      it { is_expected.to_not match(%r{<a(.*)>next</a>}) }
    end
  end
end
