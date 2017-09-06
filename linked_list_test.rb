require_relative 'linked_list'

describe LinkedList do
  let (:linked_list) { LinkedList.new }

  describe '#push' do
    it 'can push to an empty list' do
      linked_list.push(:foo)
      expect(linked_list.to_a).to eq([:foo])
    end

    it 'can push to a non-empty list' do
      linked_list.push(:foo)
      linked_list.push(:bar)
      expect(linked_list.to_a).to eq([:foo, :bar])
    end
  end

  describe '#pop' do
    it 'is nil when the list is empty' do
      expect(linked_list.pop).to be_nil
      expect(linked_list.to_a).to be_empty
    end

    it 'is the pops element when the list has size 1' do
      linked_list.push(:foo)
      expect(linked_list.pop).to eq(:foo)
      expect(linked_list.to_a).to be_empty
    end

    it 'is the pops element when the list has multiple elements' do
      linked_list.push(:foo)
      linked_list.push(:bar)
      linked_list.push(:foobar)
      expect(linked_list.pop).to eq(:foobar)
      expect(linked_list.to_a).to eq([:foo, :bar])
    end
  end

  describe '#shift' do
    it 'is nil when the list is empty' do
      expect(linked_list.shift).to be_nil
      expect(linked_list.to_a).to be_empty
    end

    it 'is the shifts element when the list has size 1' do
      linked_list.push(:foo)
      expect(linked_list.shift).to eq(:foo)
      expect(linked_list.to_a).to be_empty
    end

    it 'is the shifts element when the list has multiple elements' do
      linked_list.push(:foo)
      linked_list.push(:bar)
      linked_list.push(:foobar)
      expect(linked_list.shift).to eq(:foo)
      expect(linked_list.to_a).to eq([:bar, :foobar])
    end
  end

  describe '#unshift' do
    it 'can unshift to an empty list' do
      linked_list.unshift(:foo)
      expect(linked_list.to_a).to eq([:foo])
    end

    it 'can unshift to a non-empty list' do
      linked_list.unshift(:foo)
      linked_list.unshift(:bar)
      expect(linked_list.to_a).to eq([:bar, :foo])
    end
  end

  describe '#display' do
    it 'is pretty when the list is empty' do
      expect(linked_list.display).to eq('')
    end

    it 'is pretty when the list has one element' do
      linked_list.push(:foo)
      expect(linked_list.display).to eq('foo')
    end

    it 'is pretty when the list has many elements' do
      linked_list.push(:foo)
      linked_list.push(:bar)
      linked_list.push(:foobar)
      expect(linked_list.display).to eq('foo ~> bar ~> foobar')
    end
  end

  describe '#empty?' do
    it 'is true when the list is empty' do
      expect(linked_list).to be_empty
    end

    it 'is false when the list is not empty' do
      linked_list.push(:foo)
      expect(linked_list).to_not be_empty
    end
  end

  describe '#first' do
    it 'is nil when the list is empty' do
      expect(linked_list.first).to be_nil
    end

    it 'is the first element when the list not is empty' do
      linked_list.push(:foo)
      linked_list.push(:bar)
      expect(linked_list.first).to eq(:foo)
    end
  end

  describe '#last' do
    it 'is nil when the list is empty' do
      expect(linked_list.last).to be_nil
    end

    it 'is the last element when the list not is empty' do
      linked_list.push(:foo)
      linked_list.push(:bar)
      expect(linked_list.last).to eq(:bar)
    end
  end

  describe '#get' do
    it 'is nil when the list is empty' do
      expect(linked_list.get(0)).to be_nil
      expect(linked_list.get(3)).to be_nil
    end

    context 'when the list is not empty' do

      before do
        linked_list.push(:foo)
        linked_list.push(:bar)
        linked_list.push(:foobar)
      end

      it 'is the element at an index' do
        expect(linked_list.get(0)).to eq(:foo)
        expect(linked_list.get(1)).to eq(:bar)
        expect(linked_list.get(2)).to eq(:foobar)
      end

      it 'is nil when the element is out of range' do
        expect(linked_list.get(3)).to be_nil
        expect(linked_list.get(4)).to be_nil
      end
    end
  end
end
