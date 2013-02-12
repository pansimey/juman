# coding: utf-8

require 'rspec'
require 'juman'

describe Juman::Morpheme do
  context 'when initialized with a line of the result of "見る"' do
    subject { Juman::Morpheme.new(
        '見る みる 見る 動詞 2 * 0 母音動詞 1 基本形 2 "情 報"') }
    its(:surface){ should eq '見る' }
    its(:pronunciation){ should eq 'みる' }
    its(:base){ should eq '見る' }
    its(:pos){ should eq '動詞' }
    its(:pos_id){ should be 2 }
    its(:pos_spec){ should be_nil }
    its(:pos_spec_id){ should be 0 }
    its(:type){ should eq '母音動詞' }
    its(:type_id){ should be 1 }
    its(:form){ should eq '基本形' }
    its(:form_id){ should be 2 }
    its(:info){ should eq '情 報' }
  end
end
describe Juman::Result do
  context 'when initialized with an Array of the result of "見る"' do
    before { @result = Juman::Result.new(
      ['見る みる 見る 動詞 2 * 0 母音動詞 1 基本形 2 "情 報"']) }
    subject { @result }
    it { should be_an Enumerable }
    it { should respond_to :each }
    it { should respond_to :[] }
    it { should respond_to :at }
    describe '#[]' do
      context 'when argument 0' do
        subject { @result[0] }
        it 'should return Juman::Morpheme' do
          should be_an_instance_of Juman::Morpheme
        end
      end
    end
    describe '#each' do
      context 'without block' do
        subject { @result.each }
        it 'should return Enumerator' do
          should be_an_instance_of Enumerator
        end
      end
      context 'with block' do
        subject { @result.each{} }
        it 'should return Array' do
          should be_an_instance_of Array
        end
      end
    end
  end
end
describe Juman::Process do
  before { @process = Juman::Process.new('juman -e2 -B') }
  describe '#readlines' do
    context 'when have written "見る"' do
      before { @process.puts('見る') }
      subject { @process.readlines }
      it 'should return Array' do
        should be_an_instance_of Array
      end
    end
  end
end
describe Juman do
  before { @juman = Juman.new }
  subject { @juman }
  it { should respond_to :analyze }
  describe '#analyze' do
    context 'when argument "見る"' do
      before { @result = @juman.analyze('見る') }
      it 'should return Juman::Result' do
        @result.should be_an_instance_of Juman::Result
      end
      describe 'returned Juman::Result' do
        subject { @result }
        describe '#[]' do
          context 'when argument 0' do
            it 'should return Juman::Morpheme' do
              @result[0].should be_an_instance_of Juman::Morpheme
            end
          end
        end
      end
    end
  end
end
