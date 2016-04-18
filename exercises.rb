
#O(n^2)
def my_min(list)
  list.each_with_index do |el, idx|
    return el if list.all? { |el2| el <= el2 }
  end
end

#O(n)
def my_min2(list)
  min = list.first
  list.each do |el|
    min = el if el < min
  end

  min
end

#0(n^2)
def largest_contiguous_subsum(list)
  all_sub_arrs = []
  list.length.times do |start|
    (start...length).each do |finish|
      all_sub_arrs << list[start..finish]
    end
  end
  max = list.first
  all_sub_arrs.each { |arr| max = arr.inject(:+) if max < arr.inject(:+) }
  max
end

#0(n)
def largest_contiguous_subsum(list)
  cur_max, cur_val = 0, 0
  list.each do |el|
    cur_val += el
    cur_max = cur_val if cur_val > cur_max
    cur_val = 0 if cur_val < 0
  end
  cur_max
end

#ANAGRAMS
#0(n!)
def massive_first_anagram?(word, word2)
  word.chars.permutation(word.length) do |possible|
    return true if possible.join == word2
  end
  false
end

#O(n)
def second_anagram?(word, word2)
  word_dup = word.dup
  word2_dup = word2.dup
  word.each_char do |chr1|
    word2_dup.sub!(chr1, "")
  end
  word2.each_char do |chr2|
    word_dup.sub!(chr2, "")
  end
  word_dup == word2_dup
end

#0(n log(n))
def third_anagram(word, word2)
  word.chars.sort == word2.chars.sort
end

#0(n)
def forth_anagram(word1, word2)
  word_one = Hash.new(0)
  word1.each_char { |chr| word_one[chr] += 1 }
  word_two = Hash.new(0)
  word2.each_char { |chr| word_two[chr] += 1 }
  word_one == word_two
end

#0(n)
def fifth_anagram(word1, word2)
  words = Hash.new(0)
  word1.each_char { |chr| words[chr] += 1 }
  word2.each_char { |chr| words[chr] -= 1 }
  words.values.all? {|n| n == 0 }
end



##### TWO SUM #######

#O(n^2)
def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |num, idx|
    arr.drop(idx+1).each do |num2|
      return true if target_sum == num + num2
    end
  end

  false
end

#O(n log(n))
def okay_two_sum?(arr, target)
  arr = arr.dup.sort
  arr.each_with_index do |num, idx|
    arr_dup = arr.dup
    arr_dup.delete_at(idx)
    return true if arr_dup.bsearch { |x| x == target - num }
  end
  false
end

#0(n)
def good_two_sum?(arr, target)
  arr.each.with_object(Hash.new(0)) do |num, hash|
    return true if hash.include?(target - num)
    hash[num] += 1
  end

  false
end

#### MAX WINDOWED RANGE ####

#O(n^2)
def windowed_max_range(array, window)
  max_window = nil

  array.each_cons(window) do |w|
    value = w.max - w.min
    max_window ||= value
    max_window = value if max_window < value
  end

  max_window
end

require_relative "my_stackqueue.rb"

def windowed_max_range(array, window)
  current_best = 0
  our_queue = MinMaxStackQueue.new

  array.each do |num|
    if our_queue.size == window
      range = our_queue.max - our_queue.min
      current_best = range if current_best < range
      our_queue.dequeue
    end
    our_queue.enqueue(num)
  end
  range = our_queue.max - our_queue.min
  current_best = range if current_best < range

  current_best
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
