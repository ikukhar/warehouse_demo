# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Warehouse.all.each{ |w| w.destroy }
Item.all.each{ |i| i.destroy }

1.upto 5 do |i|
  w = Warehouse.create!({number: i})
  1.upto rand(1..5) do |j|
    s = Sector.create!({number: j, warehouse: w})
    1.upto rand(1..10) do |k|
      c = Cell.create!({number: k, sector: s})
    end
  end
end

def create_item(name, foto_url, cell)

  item = Item.new
  item.cell = cell
  item.name = name
  item.foto_url = foto_url
  item.max_cell_count = rand(1..100)
  item.count = rand(0..item.max_cell_count)
  item.save!

end

cells = Cell.all.unscoped.order("RANDOM()").limit(6)

create_item 'Наконечник рулевой тяги Авео правый FSO',
            'https://detali.zp.ua/uploads/photo/big/2014_12/2014_12_18_I12G_170447.jpg',
            cells[0]

create_item 'Свеча зажигания 406дв HERZOG (к-т)',
            'https://detali.zp.ua/uploads/photo/big/2014_07/2014_07_19_I7G_101833.jpg',
            cells[1]

create_item 'Масло SHELL Helix HX7 10W40 полусинтетика 4л',
            'https://detali.zp.ua/uploads/photo/big/2014_09/2014_09_06_I9G_144234.jpg',
            cells[2]

create_item 'Крышка радиатора 2401, 2410, 31029 ОАО ГАЗ (пробка)',
            'https://detali.zp.ua/uploads/photo/big/2014_06/2014_06_02_I6G_103235.jpg',
            cells[3]

create_item 'Бачок ГТЦ Ланос, Сенс GM',
            'https://detali.zp.ua/uploads/photo/big/2014_11/2014_11_06_I11G_145732.jpg',
            cells[4]

create_item 'Амортизатор Ланос FSO зад газ',
            'https://detali.zp.ua/uploads/photo/big/2014_06/2014_06_13_I6G_184118.jpg',
            cells[5]
