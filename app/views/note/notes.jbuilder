json.array! @notes do |note|
  json.partial! 'note/note', note: note
end