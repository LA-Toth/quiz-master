require 'rails_helper'

RSpec.describe User do
  context 'Validations' do
    it 'requires valid email' do
      expect { described_class.create!(password: 'secret') }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email can't be blank")
    end

    it 'accepts a valid email' do
      expect(described_class.create!(email: 'a@b.com', password: 'secret').email).to eq('a@b.com')
    end
  end

  context 'when a user is created without setting the admin field' do
    let(:user) { FactoryBot.create(:user) }

    it 'is created as regular user by default' do
      expect(described_class.create!(email: 'a@b.com', password: 'secret').admin).to eq(false)
    end

    it 'is not an admin' do
      expect(user.admin).to be(false)
      expect(user.admin?).to be(false)
    end

    it 'is not a quiz master' do
      expect(user.quiz_master?).to be(false)
    end
  end

  context 'when the user is an admin' do
    let(:admin) { FactoryBot.create(:admin) }

    it 'is has admin attribute' do
      expect(admin.admin).to be(true)
    end

    it 'is an admin by #admin?' do
      expect(admin.admin?).to be(true)
    end

    it 'is a quiz master' do
      expect(admin.quiz_master?).to be(true)
    end

  end
end
