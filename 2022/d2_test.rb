require 'rspec'
require './d2lib'

describe D2lib do
  describe "test" do

    before do
      @d2 = D2lib.new('d2-test.txt')
    end

    describe "run" do
      it "runs" do
        # puts @d2.data
        score = @d2.score
        expect(score).to equal(15)
      end

      it "runs2" do
        # puts @d2.data
        score = @d2.score2b
        expect(score).to equal(12)
      end
    end
  end
end
