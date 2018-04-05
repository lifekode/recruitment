require 'rails_helper'

RSpec.describe DevelopersController, type: :controller do
  let(:developer) { FactoryBot.create :developer }
  let(:language) { FactoryBot.create :language, code: 'VI' }
  let(:skill) { FactoryBot.create :programming_language }

  let(:developer2) { FactoryBot.create :developer }
  let(:language2) { FactoryBot.create :language, code: 'VI' }
  let(:skill2) { FactoryBot.create :programming_language }

  describe 'GET #index' do

    before(:each) do
      developer.skills << skill
      developer.languages << language
    end
    describe 'no params' do
      subject { get :index }

      it 'renders the index template' do
        expect(subject).to render_template(:index)
        assert_response :success
        expect(assigns(:developers)).to include developer
        expect(assigns(:skills)).to include skill
        expect(assigns(:languages)).to include language
        expect(assigns(:skill_selected)).to be nil
        expect(assigns(:language_selected)).to be nil
      end
    end

    describe 'exist params' do
      context 'email params' do
        it 'wrong email' do
          get :index, :email => 'wrong email'
          expect(assigns(:developers)).to eq []
          expect(assigns(:skills).count).to eq ProgrammingLanguage.count
          expect(assigns(:languages).count).to eq Language.count
        end

        it 'right email' do
          get :index, :email => developer.email
          expect(assigns(:developers)).to include developer
          expect(assigns(:developers).count).to eq 1
          expect(assigns(:skills).count).to eq ProgrammingLanguage.count
          expect(assigns(:languages).count).to eq Language.count
        end
      end

      it 'skill params' do
        get :index, :email => developer.email, :skill => skill.id

        expect(assigns(:developers)).to include developer
        expect(assigns(:skills).count).to eq ProgrammingLanguage.count
        expect(assigns(:skills)).to include skill
        expect(assigns(:skill_selected).id).to eq skill.id
        expect(assigns(:languages).count).to eq Language.count
      end

      it 'language params' do
        get :index, :email => developer.email, :language => language.id

        expect(assigns(:developers)).to include developer
        expect(assigns(:skills).count).to eq ProgrammingLanguage.count
        expect(assigns(:skills)).to include skill
        expect(assigns(:languages).count).to eq Language.count
        expect(assigns(:language_selected).id).to eq language.id
      end
    end
  end
end
