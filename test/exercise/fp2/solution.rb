module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(item = 0, &block)
        return self if item >= size

        block.call self[item]
        my_each(item + 1, &block) if item < size
      end

      # Написать свою функцию my_map
      def my_map(&block)
        my_reduce(MyArray.new) { |acc, first| acc << block.call(first) }
      end

      # Написать свою функцию my_compact
      def my_compact(*)
        my_result = MyArray.new
        i = 0

        while i < size
          my_result << self[i] unless self[i].nil?
          i += 1
        end
        my_result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        acc = acc.nil? ? first : block.call(acc, first)
        rest = self - self[0..0]
        return acc if rest.empty?

        MyArray.new(rest).my_reduce(acc, &block)
      end
    end
  end
end
