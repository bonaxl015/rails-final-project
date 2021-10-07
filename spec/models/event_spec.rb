require 'rails_helper'

RSpec.describe Event, type: :model do
  subject(:event) { create(:event) }

  let(:event_with_attendees) { create(:event_with_attendees) }

  it 'belongs to user' do
    expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'has many attends' do
    expect(described_class.reflect_on_association(:attends).macro).to eq(:has_many)
  end

  it 'deletes its attendees' do
    event_with_attendees.destroy
    expect(Attend.find_by(event_id: event_with_attendees.id)).to eq(nil)
  end

  describe '#name' do
    it 'invalidates null' do
      event.name = nil
      event.valid?
      expect(event.errors[:name].size).to eq(1)
    end

    context 'when not unique but case sensitive' do
      before do
        event.name = create(:event).name.upcase
        event.valid?
      end

      it 'does not validate' do
        expect(event.errors[:name].size).to eq(1)
      end
    end

    context 'when not unique but not case sensitive' do
      before do
        event.name = create(:event).name
        event.valid?
      end

      it 'does not validate' do
        expect(event.errors[:name].size).to eq(1)
      end
    end
  end

  describe '#start_date' do
    it 'invalidates null' do
      event.start_date = nil
      event.valid?
      expect(event.errors[:start_date].size).to eq(1)
    end

    it 'invalidates when in the past' do
      event.start_date = Time.zone.now.yesterday
      event.valid?
      expect(event.errors[:start_date].size).to eq(1)
    end
  end

  describe '#end_date' do
    it 'invalidates null' do
      event.end_date = nil
      event.valid?
      expect(event.errors[:end_date].size).to eq(1)
    end

    it 'invalidates when behind start date' do
      event.end_date = event.start_date.yesterday
      event.valid?
      expect(event.errors[:end_date].size).to eq(1)
    end
  end
end
