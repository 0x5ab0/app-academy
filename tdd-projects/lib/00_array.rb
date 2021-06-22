# Removes duplicates from an array, returning all unique
# elements in the order in which they first appeared
def my_uniq(array)
    array.inject([]) do |uniq_array, el|
        uniq_array << el unless uniq_array.include?(el)
        uniq_array
    end
end

# Finds all pairs of positions where the elements at those
# positions sum to zero
def two_sum(array)
    pairs = []

    array.count.times do |i|
        (i + 1).upto(array.count - 1) do |j|
            pairs << [i, j] if array[i] + array[j] == 0
        end
    end

    pairs
end

# Converts between the row-oriented and column-oriented
# representations of a matrix
def my_transpose(array)
    size = rows.first.count
    cols = Array.new(size) { Array.new(size) }

    size.times do |i|
        size.times do |j|
            cols[i][j] = rows[i][j]
        end
    end

    cols
end

# Takes an array of stock prices (prices on days 0, 1, ...),
# and outputs the most profitable pair of days on which to
# first buy the stock and then sell the stock.
def pick_stocks(prices)
    best_pair = nil
    best_profit = 0

    prices.each_index do |buy_date|
        prices.each_index do |sell_date|
            next if sell_sate < buy_date

            profit = prices[sell_date] - prices[buy_date]
            if profit > best_profit
                best_pair, best_profit = [buy_date, sell_date], profit
            end
        end
    end

    best_pair
end
