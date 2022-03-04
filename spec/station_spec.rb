require 'station'

describe Station do
  subject(:station) { described_class.new("Victoria", 1) }

  it 'returns name' do
    expect(station.name).to eq("Victoria")
  end

  it 'returns zone' do
    expect(station.zone).to eq 1
  end
end
