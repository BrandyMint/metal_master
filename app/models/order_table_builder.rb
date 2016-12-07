class OrderTableBuilder
  def build_table(order)
    rows = build_rows order.order_machine_usages.with_start_condition(:none)
    max_steps = rows.map(&:last_step).max
    { rows: rows, max_steps: max_steps || 0 }
  end

  def build_rows(usages)
    usages.map do |u|
      [u] +
        build_rows(u.before_linked_usages.with_start_condition(:after_start)) +
        build_rows(u.before_linked_usages.with_start_condition(:after_finish))
    end.flatten
  end
end
