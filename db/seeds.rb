# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


machine1 = Machine.create(title: 'Гибочный')
machine2 = Machine.create(title: 'Отгибочный')
machine3 = Machine.create(title: 'Лентопил')
machine4 = Machine.create(title: 'Обрубил')

order = Order.create(title: 'Пробный')

usage1 = order.order_machine_usages.create! machine: machine1
usage1.order_machine_usage_intervals.create workers: 3
usage1.order_machine_usage_intervals.create workers: 3

usage2 = order.order_machine_usages.create! machine: machine2,
  start_condition: :after_finish,
  after_machine_usage: usage1
usage2.order_machine_usage_intervals.create workers: 5
usage2.order_machine_usage_intervals.create workers: 5
usage2.order_machine_usage_intervals.create workers: 5

usage3 = order.order_machine_usages.create! machine: machine3,
  start_condition: :after_start,
  after_machine_usage: usage2, skip_steps: 2
usage3.order_machine_usage_intervals.create workers: 3

usage4 = order.order_machine_usages.create! machine: machine4,
  start_condition: :after_finish,
  after_machine_usage: usage2
usage4.order_machine_usage_intervals.create workers: 1
usage4.order_machine_usage_intervals.create workers: 1
usage4.order_machine_usage_intervals.create workers: 1


