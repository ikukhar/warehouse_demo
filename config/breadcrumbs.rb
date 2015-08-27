crumb :warehouses do
  link 'Склады', warehouses_path
end

crumb :warehouse do |w|
  link w, warehouse_path(w)
  parent :warehouses
end

crumb :sector do |s|
  link s, sector_path(s)
  parent s.warehouse
end

crumb :cell do |c|
  link c, cell_path(c)
  parent c.sector
end
