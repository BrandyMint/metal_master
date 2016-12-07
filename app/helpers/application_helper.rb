module ApplicationHelper
  def order_title_link(order)
    link_to order, order_path(order)
  end

  def machines_collection_not_used_in_order(order, machine_id)
    Machine.where.not(id: order.machines.pluck(:id) - [machine_id])
  end

  def destroy_button(resource)
    return unless resource.persisted?
    link_to 'Удалить',
      url_for(resource),
      method: :delete,
      data: { confirm: 'Удалить?' },
      class: 'btn btn-danger'
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
