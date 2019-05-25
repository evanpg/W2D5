class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if num > @store.length || num < 0
      raise "Out of bounds"
    else
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    # return true if @store[num] == true
    # return false
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store << num
  end

  def remove(num)
    @store.pop(num)
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == store.length 
      resize!
    end
    if !@store[num % store.length].include?(num)
      @count += 1
      @store[num % store.length] << num
    end
  end

  def remove(num)
      @store[num % store.length].delete(num)
      @count -= 1
   
  end

  def include?(num)
    @store[num % store.length].include?(num)
  end


  def count 
    @count 
  end
  
  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end


  def resize!
    r = ResizingIntSet.new(@num_buckets * 2)
    @store.each do |ele|
      r.insert(ele)
    end


  end
end
