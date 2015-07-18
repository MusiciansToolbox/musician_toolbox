root_clip = @jam_circle.root_clip

json.name root_clip.name

if root_clip.has_children?
  json.children root_clip.children_json
end
