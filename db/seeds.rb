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

order = Order.create(title: 'Пробный')

usage1 = order.order_machine_usages.create! machine: machine1
usage2 = order.order_machine_usages.create! machine: machine2, start_condition: :after_finish, after_machine_usage: usage1
usage3 = order.order_machine_usages.create! machine: machine3, start_condition: :after_start, after_machine_usage: usage2, skip_steps: 2
