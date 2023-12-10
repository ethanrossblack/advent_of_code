require "./9"

=begin
  1   3   6  10  15  21
    2   3   4   5   6
      1   1   1   1
        0   0   0
=end

RSpec.describe "Advent of Code Day 9" do
  describe "Helper Methods" do
    describe "#next_sequence" do
      it "returns the a new array of the difference of each step" do
        one = [0,3,6,9,12,15]
        one_expected = [3,3,3,3,3]
        expect(next_sequence(one)).to eq(one_expected)
        
        two = [1,3,6,10,15,21]
        two_expected = [2,3,4,5,6]
        expect(next_sequence(two)).to eq(two_expected)
        
        three = [10,13,16,21,30,45]
        three_expected = [3,3,5,9,15]
        expect(next_sequence(three)).to eq(three_expected)
      end
    end

    describe "#all_sequences" do
      it "returns a nested array of all sequences" do
        one = [0,3,6,9,12,15]
        expected = [[0,3,6,9,12,15], [3,3,3,3,3], [0,0,0,0]]

        expect(all_sequences(one)).to eq(expected)

      end
    end
  end
end