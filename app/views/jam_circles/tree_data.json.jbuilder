root_clip = @jam_circle.root_clip

json.name root_clip.name
json.clip_id root_clip.id
json.clip_url root_clip.uploaded_file
json.clip_instrument root_clip.instrument.name
json.clip_user root_clip.user.name


if root_clip.has_children?
  json.children root_clip.children_json
end
