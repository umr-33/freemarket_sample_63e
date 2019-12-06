json.array! @categories do |cat|
  json.name cat.name
  json.id cat.id
  json.items_size cat.items_size
end