module Movies::Actors::ImporterHelper
  def field_for model, field
    "<div class='field'>
    <strong>#{field.to_s.titleize}</strong>
    <p class='text-muted'>
    #{model.send(field)}<br>
    </p>
    </div>"
  end

  def fields_for model, fields
    src = ""
    fields.each do |field|
      src += field_for(model, field)
    end
    raw src
  end
end
