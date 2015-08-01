json.array!(@groups) do |product|
  json.extract! product, :id, :title
end
