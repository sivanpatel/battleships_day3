require 'board'

describe Board do
  let(:ship) { double(:ship, { size: 2 }) }
  it "responds to display_grid" do
    expect(subject).to respond_to(:display_grid)
  end

  it 'converts coordinates' do
    expect(subject.coordinate_converter('D10')).to eq([3, 9])
  end

  describe "#place" do
    it 'responds to place' do
      expect(subject).to respond_to(:place).with(2).argument
    end
  end

  describe "#check_coord" do
    before(:each) do
      allow(ship).to receive(:destroyer)
    end

    it 'gives an error if attempts to place horizontal ship on grid' do
      expect{subject.place(ship, 'J1')}.to raise_error "Your ship is off the grid"
    end

    it 'gives an error if attempts to place vertical ship on grid' do
      expect{subject.place(ship, 'A10', :vertical)}.to raise_error "Your ship is off the grid"
    end

    it 'should return a grid reference for valid coordinates' do
      expect(subject.check_coord(ship, [0, 0], :horizontal)).to eq(0)
    end
  end
end
