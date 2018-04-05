require 'rails_helper'

RSpec.describe Developer, type: :model do
  subject { FactoryBot.build(:developer) }

  describe 'validation' do
    context 'invalid attributes' do
      subject { FactoryBot.build :invalid_developer }
      it { expect(subject).to be_invalid }
    end

    it 'valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'functions' do
    before do
      subject.email = subject.email.upcase
      subject.save
    end

    it '.downcase_email' do
      expect(subject.email).to eq subject.email.downcase
    end
  end

  describe 'association' do
    it 'has many developer skills' do
      relation = described_class.reflect_on_association(:developer_skills)
      expect(relation.macro).to eq :has_many
    end

    it 'has many skills' do
      relation = described_class.reflect_on_association(:languages)
      expect(relation.macro).to eq :has_many
    end

    it 'has many developer languages' do
      relation = described_class.reflect_on_association(:developer_languages)
      expect(relation.macro).to eq :has_many
    end

    it 'has many languages' do
      relation = described_class.reflect_on_association(:languages)
      expect(relation.macro).to eq :has_many
    end
  end
end
