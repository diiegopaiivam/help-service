json.array! @employeers do |employee|
  json.id employee.id
  json.first_name employee.first_name
  json.last_name employee.last_name
  json.email employee.email
  json.phone employee.phone
  json.image employee.image
  json.latitude employee.latitude
  json.longitude employee.longitude
  json.created_at employee.created_at
  json.updated_at employee.updated_at
  json.comments employee.comments
end