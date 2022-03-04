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
        exit: 'Sloane Square'
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

  # calculating fare
  it 'deducts penalty fare if the journey is incomplete' do
    allow(journey).to receive(:complete?).and_return(false)
    expect(journey.fare).to eq 6
  end
  
  it 'deducts minimum fare if the journey is complete' do
    allow(journey).to receive(:complete?).and_return(true)
    expect(journey.fare).to eq 1
  end
end
