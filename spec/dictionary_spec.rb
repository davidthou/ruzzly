require_relative '../lib/dictionary'

describe Dictionary do
  describe '#add' do
    it 'raises an ArgumentError when given an empty string' do
      expect {
        subject.add('')
      }.to raise_error(ArgumentError)
    end

    it 'adds a word to the dictionary' do
      subject.add('ciao')
      expect(subject.count).to be 1
    end

    it 'silently ignores words already added' do
      subject.add('gennaro')
      subject.add('gennaro')
      expect(subject.count).to be 1
    end
  end

  describe '#count' do
    it 'returns 0 on a newly created Dictionary object' do
      expect(subject.count).to be 0
    end
  end

  describe '#include?' do
    it 'raises an ArgumentError when given an empty string' do
      expect {
        subject.include?('')
      }.to raise_error(ArgumentError)
    end

    it 'returns true when the word was added' do
      subject.add('tizio')
      expect(subject).to include 'tizio'
    end

    it 'returns false when the word was not added' do
      expect(subject).not_to include 'tizio'
    end
  end
end