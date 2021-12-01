depths = [199,200,208,210,200,207,240,269,260,263]
count = []

{:ok, file} = File.read("day1.txt")
lines = file |> String.split("\r\n", trim: true)
nums = lines |> Enum.map(&String.to_integer/1)
# nums = lines |> Enum.map(fn x -> Integer.parse(x) end)
IO.inspect(nums);
# inc = fn n -> n + 1 end

# depths
# |> Enum.with_index
# |> Enum.each(fn({x,i}) ->
#   IO.puts("#{x} #{i} #{Enum.at(depths,i+1)}")
#   if Enum.at(depths,i+1) > x do
#     count = Enum.concat(count, [i])
#   end
# end
# )
trips = nums
|> Enum.chunk_every(3,1, :discard)
|> Enum.map(fn x -> Enum.reduce(x,fn x,acc -> x + acc end) end)
# |> Enum.map(fn {x,i} -> Enum.slice(nums, Range.new(i, i+2)) end)
# |> IO.inspect

trips
|> Enum.with_index
|> Enum.map(fn {x,i} -> x < Enum.at(trips,i+1) end)
|> Enum.filter(fn x -> x end)
|> Enum.count()
|> IO.inspect

# blah = length(lol)
# IO.puts("#{blah}")

# IO.puts("#{count}")
# IO.puts("#{length(count)}")
# IO.puts("#{Enum.count(count)}")
