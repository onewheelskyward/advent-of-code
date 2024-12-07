require 'rspec'
require './d3lib'

describe D3lib do
  describe "test" do

    before do
      @d3 = D3lib.new('d3-test.txt')
    end

    describe "test" do
      it "runs" do
        expect(@d3.score).to eq(157)
      end
    end

    describe "run" do
      it "runs" do
        d3 = D3lib.new('d3.txt')
        expect(d3.score).to eq(7967)
      end

      it "test2" do
        d3 = D3lib.new('d3-2.txt')
        expect(d3.score2).to eq(70)
      end
    end
  end
end
