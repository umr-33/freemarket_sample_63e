json.array! @brands do |b|
  json.name b.name
  json.id b.id
  json.parent_name b.parent.name
end