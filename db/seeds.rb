

Brand.create(name: 'Kia', description: 'Kia brand')
Brand.create(name: 'Toyota', description: 'Toyota brand')
Brand.create(name: 'Nissan', description: 'Nissan brand')
Brand.create(name: 'Chevrolet', description: 'Chevrolet brand')

# kia
Model.create(name: 'Cerato', description: 'Cerato', brand_id: 1 )
Model.create(name: 'Rio', description: 'Rio', brand_id: 1 )
Model.create(name: 'Optima', description: 'Optima', brand_id: 1 )

# toyota
Model.create(name: 'Yaris', description: 'Yaris', brand_id: 2 )
Model.create(name: 'Avensis', description: 'Avensis', brand_id: 2 )
Model.create(name: 'Corolla', description: 'Corolla', brand_id: 2 )

# nissan
Model.create(name: 'Tiida', description: 'Tiida', brand_id: 3 )
Model.create(name: 'Sentra', description: 'Sentra', brand_id: 3 )
Model.create(name: 'Altima', description: 'Altima', brand_id: 3 )

# chevrolet
Model.create(name: 'Aveo', description: 'Aveo', brand_id: 4 )
Model.create(name: 'Sonic', description: 'Sonic', brand_id: 4 )
Model.create(name: 'Cruze', description: 'cruze', brand_id: 4 )


Car.create(name: 'Type 1', description: 'Type 1', model_id: 1 )
Car.create(name: 'Type 2', description: 'Type 2', model_id: 1 )
Car.create(name: 'Type 3', description: 'Type 3', model_id: 1 )

Car.create(name: 'Type 1', description: 'Type 1', model_id: 2 )
Car.create(name: 'Type 2', description: 'Type 2', model_id: 2 )
Car.create(name: 'Type 3', description: 'Type 3', model_id: 2 )

Car.create(name: 'Type 1', description: 'Type 1', model_id: 3 )
Car.create(name: 'Type 2', description: 'Type 2', model_id: 3 )
Car.create(name: 'Type 3', description: 'Type 3', model_id: 3 )

Car.create(name: 'Type 1', description: 'Type 1', model_id: 4 )
Car.create(name: 'Type 2', description: 'Type 2', model_id: 4 )
Car.create(name: 'Type 3', description: 'Type 3', model_id: 4 )

Car.create(name: 'Type 1', description: 'Type 1', model_id: 5 )
Car.create(name: 'Type 2', description: 'Type 2', model_id: 5 )
Car.create(name: 'Type 3', description: 'Type 3', model_id: 5 )

Car.create(name: 'Type 1', description: 'Type 1', model_id: 6 )
Car.create(name: 'Type 2', description: 'Type 2', model_id: 6 )
Car.create(name: 'Type 3', description: 'Type 3', model_id: 6 )

Car.create(name: 'Type 1', description: 'Type 1', model_id: 7 )
Car.create(name: 'Type 2', description: 'Type 2', model_id: 7 )
Car.create(name: 'Type 3', description: 'Type 3', model_id: 7 )

Car.create(name: 'Type 1', description: 'Type 1', model_id: 8 )
Car.create(name: 'Type 2', description: 'Type 2', model_id: 8 )
Car.create(name: 'Type 3', description: 'Type 3', model_id: 8 )

Car.create(name: 'Type 1', description: 'Type 1', model_id: 9 )
Car.create(name: 'Type 2', description: 'Type 2', model_id: 9 )
Car.create(name: 'Type 3', description: 'Type 3', model_id: 9 )



CarUser.create(username: 'carlos', password: 'carlos')