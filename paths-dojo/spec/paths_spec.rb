require "paths.rb"

describe Paths do
  context "When Paths is initialized" do
    let(:sut) { Paths.new "/" }

    it "should be defined" do
      expect(sut).to_not be_nil
    end
  end

  context "When nil is passed" do
    let(:sut) { Paths.new "/" }

    it "should return nil" do
      expect(sut.proceed(nil)).to be_nil
    end
  end

  context "When a number is passed" do
    let(:sut) { Paths.new "/" }

    it "should raise an error" do
      expect{ sut.proceed(1) }.to raise_error(ArgumentError, "Please pass a String.")
    end
  end

  context "When /root is passed" do
    let(:result) { Paths.new.proceed("/root") }

    it "should return an Array" do
      expect(result).to be_a(Array)
    end

    it "should have one element" do
      expect(result.count).to be(1)
    end

    it "should return /root" do
      expect(result.first).to eq("/root")
    end
  end

  context "When /root/sub is passed" do
    let(:result) { Paths.new.proceed("/root/sub") }

    it "should return a Array with 2 elements" do
      expect(result.count).to be(2)
    end

    it "should return /root as first element" do
      expect(result[0]).to eq("/root")
    end

    it "should return /sub as second element" do
      expect(result[1]).to eq("/sub")
    end
  end
end
