module ApplicationHelper
  def work_date_row_class(wd)
    wd.is_business? ? 'table-success' : 'table-danger'
  end

  def order_title_link(order)
    link_to order, order_path(order)
  end

  def machine_usage_row_class(usage)
    if usage.steps_count == 0
      'table-danger'
    end
  end

  def machines_collection_not_used_in_order(order, machine_id)
    Machine.ordered.where.not(id: order.machines.pluck(:id) - [machine_id])
  end

  def destroy_button(resource)
    last_resource = resource.is_a?(Array) ? resource.last : resource
    return unless last_resource.persisted?
    link_to 'Удалить',
      url_for(resource),
      method: :delete,
      data: { confirm: 'Удалить?' },
      class: 'btn btn-outline-danger'
  end

  def application_title
    'MetalMaster'
  end

  def machine_usage_condition_details(mu)
    case mu.start_condition
    when 'none'
      'бесусловный старт'
    when 'after_start'
      "после старта '#{mu.after_machine_usage}' через #{mu.skip_steps} шагов"
    when 'after_finish'
      "после завершения '#{mu.after_machine_usage}'"
    else
      'не известное условие'
    end
  end

  def navbar_link_to(title, href, active: nil)
    active = is_active_link? href, :inclusive if active.nil?
    active_class = active ? 'active' : ''
    content_tag :li, class: "nav-item #{active_class}" do
      link_to title, href, class: 'nav-link'
    end
  end
end
