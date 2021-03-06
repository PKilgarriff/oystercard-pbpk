# JourneyLog should manage all Journey objects
# It should have the methods: 
# - start
# - finish
# - current_journey
# - journeys
# Oystercard needs to contain a JourneyLog object
# The Oystercard that call Journey should now start calling JourneyLog

require 'journeylog'

describe JourneyLog do
  let(:journey) {double(:journey_double)}
  subject(:log) { described_class.new(journey) }

  # describe '#start' do
  #   it 'changes the entry station' do
  #     expect { log.start('Aldgate East') }.to change { log.entry_station }
  #   end
  # end

  # describe '#finish' do
  #   it 'changes the exit station' do
  #     expect { log.finish('Piccadilly Circus') }.to change { log.exit_station }
  #   end
  # end

  # describe '#current_journey' do
  #   it 'is an actual method' do
  #     allow(journey).to receive(:complete?).and_return(true)
  #     expect(log.current_journey.class).to eq (Journey) 
  #   end 
  # end

  describe '#list_journeys' do
    it 'prints a list of journeys' do
      allow(journey).to receive(:journey_record).and_return({ entry: 'Waterloo', exit: 'Victoria' })
      allow(journey).to receive(:end_journey)
      log.finish("test")
      expect { log.list_journeys }.to output("Waterloo to Victoria\n").to_stdout
    end
  end
end