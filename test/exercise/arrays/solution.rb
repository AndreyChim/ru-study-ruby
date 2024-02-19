module Exercise
  module Arrays
    class << self
      def find_max(array)
        max = array[0]
        array.each do |i|
          i > max ? max = i : i
        end
        max
      end

      def replace(array)
        array.map! { |x| x.positive? ? Exercise::Arrays.find_max(array) : x }
      end

      def search(array, query, left = 0, right = array.length - 1)
        mid = (left + right) / 2

        if left > right
          -1
        elsif array[mid] > query
          search(array, query, left, right - 1)
        elsif array[mid] < query
          search(array, query, left + 1, right)
        elsif array[mid] == query
          mid
        end
      end
    end
  end
end
