class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        selected = []
        self.my_each do |el|
            selected << el if prc.call(el)
        end
        selected
    end

    def my_reject(&prc)
        rejected = []
        self.my_each do |el|
            rejected << el if !prc.call(el)
        end
        rejected
    end

    def my_any?(&prc)
        self.my_each do |el|
            return true if prc.call(el)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |el|
            return false if !prc.call(el)
        end
        true
    end

    def my_flatten
        flattened = []

        self.my_each do |el|
            if el.is_a?(Array)
                flattened.concat(el.my_flatten)
            else
                flattened << el
            end
        end

        flattened
    end

    def my_zip(*arrays)
        zipped = []
        
        i = 0
        while i < self.length do
            zipped_el = [self[i]]

            arrays.my_each do |array|
                zipped_el << array[i]
            end
            
            zipped << zipped_el
            i += 1
        end

        zipped
    end

    def my_rotate(n = 1)
        i = n % self.length

        self.drop(i) + self.take(i)
    end

    def my_join(separator = '')
        string = ''

        self.length.times do |i|
            string += self[i]
            string += separator unless i == self.length - 1
        end

        string
    end

    def my_reverse
        reversed = []

        self.my_each do |el|
            reversed.unshift(el)
        end

        reversed
    end
end