module ApplicationHelper

  def with_icon(icon_name, label)
    raw "<i class='fa fa-fw fa-#{icon_name}'></i> #{label}"
  end

  def participants(event_participants)
    out = event_participants.map do |ep|
      class_name = cycle("success", "info", "primary", "danger", "warning")
      "<span class='badge badge-pill text-uppercase badge-#{class_name}'>#{ep.actor.firstname[0]}#{ep.actor.lastname[0]}</span> "
    end

    raw out.join("")
  end

  def empty_resource(klass, opts)
    raw "<div class='alert alert-primary' role='alert'>
      <h4 class='alert-heading text-primary'>There are no #{klass.to_s.pluralize.downcase} as of now</h4>
      <p>#{opts[:info]}</p>
      <a href='#{opts[:cta]}' class='btn btn-sm btn-outline-primary'>create #{klass.to_s.downcase}</a>
    </div>"
  end

  def breadcrumbs crumbs
    crumbs = crumbs.map do |group|
        "<li class='breadcrumb-item'><a href='#{group[0]}'>#{group[1]}</a></li>"
  end.join("")
    raw "<nav aria-label='breadcrumb'>
    <ol class='breadcrumb'>
      #{crumbs}
    </ol></div>"

  end
end
