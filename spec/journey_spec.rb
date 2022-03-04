require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  # starting a journey
  it 'starts the journey' do
    expect { journey.start_journey('Waterloo') }.not_to raise_error
  end
  
  # finishing a journey
  it 'finishes the journey' do
    expect { journey.end_journey('Sloane Square') }.not_to raise_error
  end

  # recording a journey
  describe '#journey_record' do
    it 'returns the journey hash' do
      journey.start_journey('Waterloo')
      journey.end_journey('Sloane Square')
      expect(journey.journey_record).to include(
        entry: 'Waterloo',
        exit: 'Sloane Square',
        fare: 1
     )
    end

    it 'returns a hash without touch in' do
      journey.end_journey('Sloane Square')
      expect(journey.journey_record).to include(
        entry: nil,
        exit: 'Sloane Square',
        fare: 6
     )
    end
      
    it 'returns a hash without touch out' do
      journey.start_journey('Waterloo')
      expect(journey.journey_record).to include(
        entry: 'Waterloo',
        exit: nil,
        fare: 6
     )
    end
  end

  # journey complete?
  context 'checks if the journey is complete' do
    it 'returns false when incomplete' do
      journey.start_journey('Waterloo')
      expect(journey.complete?).to be false
    end
  end
end
