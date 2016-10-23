require 'rails_helper'

RSpec.describe PagesController do
  describe '#index' do
    subject { get :index }
    before { create(:page) }

    it do
      is_expected.to have_http_status(:ok)
    end
  end

  describe '#create' do
    subject { post :create, url: url }

    context 'page was not indexed yet' do
      let(:page) { Page.last }
      let(:url) { 'https://github.com' }
      around { |example| VCR.use_cassette('create github page index') { example.run } }

      it do
        expect { subject }.to change(Page, :count).by(1)
        is_expected.to have_http_status(:created)
        expect(subject.body).to eq(page.to_json)
      end
    end

    context 'page was already indexed' do
      let(:page) { create(:page, url: url) }
      let(:url) { 'https://github.com' }
      around { |example| VCR.use_cassette('create github page index') { example.run } }

      it do
        expect { subject }.to change { page.reload.headers1 }
                                .and(change { page.reload.headers2 })
                                .and(change { page.reload.headers3 })
                                .and(change { page.reload.links })
        is_expected.to have_http_status(:created)
        expect(subject.body).to eq(page.to_json)
      end
    end

    context 'url is not a web uri' do
      let(:url) { 'config/secrets.yml' }

      it do
        expect { subject }.not_to change(Page, :count)
        is_expected.to have_http_status(400)
        expect(subject.body).to eq('the url provided is not a web uri')
      end
    end
  end
end
